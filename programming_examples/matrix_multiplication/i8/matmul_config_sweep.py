from run import build_module
from air.extras import types as T
from air.backend.xrt import XRTBackend

import csv
import subprocess
import re
import math
import numpy as np
import traceback
from concurrent.futures import ProcessPoolExecutor, as_completed
from pathlib import Path
from itertools import product
from ml_dtypes import bfloat16


def batched(iterable, existing=None):
    batch = []
    for row in iterable:
        # Extract values for row
        m = row[0]
        k = row[1]
        n = row[2]
        tile_m = row[3]
        tile_k_l2 = row[4]
        tile_k_l1 = row[5]
        tile_n = row[6]

        key = (m, k, n, tile_m, tile_k_l2, tile_k_l1, tile_n)
        if key in existing and is_valid(existing[key]):
            continue

        # Ensure m and n fit into tiles
        if tile_m % 32 != 0:
            continue
        if tile_k_l1 % 8 != 0:
            continue
        if tile_n % 32 != 0:
            continue
        if tile_k_l2 % 32 != 0:
            continue
        if m % (tile_m * HERD_M) != 0:
            continue
        if n % (tile_n * HERD_N) != 0:
            continue
        if k % tile_k_l2 != 0:
            continue
        if tile_k_l2 % tile_k_l1 != 0:
            continue
        # Ensure sufficient L1 space
        l1_usage = (
            2 * INPUT_A_L1_BYTES * tile_m * tile_k_l1
            + 2 * INPUT_B_L1_BYTES * tile_n * tile_k_l1
            + OUTPUT_L1_BYTES * tile_m * tile_n
        ) + 1024
        if l1_usage > 2**16:
            continue
        # Ensure sufficient L2 space
        l2_usage = (
            2
            * HERD_M
            * (
                INPUT_A_L2_BYTES * tile_m * tile_k_l2
                + INPUT_B_L2_BYTES * tile_n * tile_k_l2
                + OUTPUT_L2_BYTES * tile_m * tile_n
            )
        )
        if l2_usage > HERD_M * (2**19):
            continue

        yield row


def worker_chunk(batch):
    [m, k, n, tile_m, tile_k_l2, tile_k_l1, tile_n] = batch
    print(
        f"Try M: {m}, K: {k}, N: {n}, Tile M: {tile_m}, Tile K L2: {tile_k_l2}, Tile K L1: {tile_k_l1}, Tile N: {tile_n}"
    )
    try:
        output1 = subprocess.run(
            [
                "make",
                "compile-kernel",
                f"TILE_M={tile_m}",
                f"TILE_N={tile_n}",
                f"TILE_K_L1={tile_k_l1}",
                f"AIE_TARGET=aie2p",
            ],
            cwd="..",
            capture_output=True,
            text=True,
            timeout=600 * 1000,
        )
        # Build run.py command with optional --direct-codegen flag
        run_cmd = [
            "python",
            "../run.py",
            "--herd-m",
            str(HERD_M),
            "--herd-n",
            str(HERD_N),
            "--m",
            str(m),
            "--k",
            str(k),
            "--n",
            str(n),
            "--tile-m",
            str(tile_m),
            "--tile-k-l2",
            str(tile_k_l2),
            "--tile-k-l1",
            str(tile_k_l1),
            "--tile-n",
            str(tile_n),
            "--compile-mode",
            "compile-and-run",
            "--arch",
            "aie2p",
        ]
        if USE_DIRECT_CODEGEN:
            run_cmd.append("--direct-codegen")

        output2 = subprocess.run(
            run_cmd, capture_output=True, text=True, timeout=600 * 1000
        )
        output3 = subprocess.run(
            [
                "./test.exe",
                "-x",
                "air.xclbin",
                "-k",
                "MLIR_AIE",
                "-i",
                "air.insts.bin",
                "-M",
                str(m),
                "-K",
                str(k),
                "-N",
                str(n),
            ],
            capture_output=True,
            timeout=600 * 1000,
        )

        # Extract latency from test.exe output
        output_text = output3.stdout.decode("utf-8")
        latency = re.findall("(?<=Avg NPU matmul time: )\\d+(?:\\.\\d+)?", output_text)
        lat_avg = float(latency[0])
        latency = re.findall("(?<=Max NPU matmul time: )\\d+(?:\\.\\d+)?", output_text)
        lat_max = float(latency[0])
        latency = re.findall("(?<=Min NPU matmul time: )\\d+(?:\\.\\d+)?", output_text)
        lat_min = float(latency[0])

        # Check if test passed (PASS! is printed by run.py)
        passed = "PASS!" in output2.stdout or "PASS!" in output2.stderr

    except Exception:
        print(traceback.format_exc())
        lat_avg = 0.0
        lat_max = 0.0
        lat_min = 0.0
        passed = False

    return [
        m,
        k,
        n,
        tile_m,
        tile_k_l2,
        tile_k_l1,
        tile_n,
        lat_avg,
        lat_max,
        lat_min,
        passed,
    ]


def run_chunk(worker, chunk_iter):
    for chunk in chunk_iter:
        yield worker(chunk)


def is_valid(row):
    try:
        latency = float(row["runner latency"])
        return latency > 0  # example condition
    except Exception:
        return False


def find_factors(n: int):
    results = []
    for i in range(1, int(math.sqrt(n)) + 1):
        if n % i == 0:
            results.append(i)
            results.append(n // i)
    # Filter to only include factors >= 64
    return sorted([x for x in set(results) if x >= 64])


def main():
    tile_m_vals = find_factors(SIZE // HERD_M)
    tile_k_l2_vals = find_factors(SIZE)
    tile_k_l1_vals = find_factors(SIZE)
    tile_n_vals = find_factors(SIZE // HERD_N)

    # Load in all csv values
    existing = {}
    if READ_FILE != None:
        read_path = Path(READ_FILE)
        if Path.exists(read_path):
            with read_path.open(newline="", encoding="utf-8") as f:
                reader = csv.DictReader(f)
                for row in reader:
                    key = (
                        int(row["m"]),
                        int(row["k"]),
                        int(row["n"]),
                        int(row["tile_m"]),
                        int(row["tile_k_l2"]),
                        int(row["tile_k_l1"]),
                        int(row["tile_n"]),
                    )
                    existing[key] = row  # whole dict row

    with open(WRITE_FILE, "w") as f:
        writer = csv.writer(f)
        writer.writerow(
            [
                "m",
                "k",
                "n",
                "tile_m",
                "tile_k_l2",
                "tile_k_l1",
                "tile_n",
                "latency avg",
                "latency max",
                "latency min",
                "passed",
            ]
        )
        chunk_iter = batched(
            product(
                [SIZE],
                [SIZE],
                [SIZE],
                tile_m_vals,
                tile_k_l2_vals,
                tile_k_l1_vals,
                tile_n_vals,
            ),
            existing,
        )
        for row in run_chunk(worker_chunk, chunk_iter):
            writer.writerow(row)
            f.flush()


READ_FILE = None
SIZE = 4096
HERD_M = 8
HERD_N = 4

# Codegen mode
USE_DIRECT_CODEGEN = False  # Set to True to use --direct-codegen, False to use AIE API

# Data format configuration
DATA_FORMAT = "i8"  # e.g., "i8", "bf16", "f32", etc.

# Data format byte sizes (bytes per element)
# L1 memory calculations
INPUT_A_L1_BYTES = 1  # int8 inputs at L1
INPUT_B_L1_BYTES = 1  # int8 inputs at L1
OUTPUT_L1_BYTES = 2  # int16 output at L1

# L2 memory calculations
INPUT_A_L2_BYTES = 1  # int8 inputs at L2
INPUT_B_L2_BYTES = 1  # int8 inputs at L2
OUTPUT_L2_BYTES = 2  # int16 output at L2

# Generate output filename based on configuration
codegen_suffix = "_direct_codegen" if USE_DIRECT_CODEGEN else "_aie_api"
WRITE_FILE = f"data{SIZE}_{DATA_FORMAT}_rerun{codegen_suffix}.csv"

if __name__ == "__main__":
    main()
