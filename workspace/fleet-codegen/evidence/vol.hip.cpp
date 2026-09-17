// 证明 Fleet 的 ld_local_u64/st_local_u64(C++ volatile)降成 flat ... sc0 sc1(系统作用域),
// 与其注释宣称的 "L2-local, no fence needed" 相反。
typedef unsigned long long u64;
__attribute__((device)) __attribute__((always_inline)) inline
u64 ld_local_u64(u64 const *addr) { return *((volatile u64 const *)addr); }
__attribute__((device)) __attribute__((always_inline)) inline
void st_local_u64(u64 *addr, u64 val) { *((volatile u64 *)addr) = val; }
__attribute__((global)) void k_vol(u64 *p, u64 *out){ *out = ld_local_u64(p); }
__attribute__((global)) void k_plain(u64 *p, u64 *out){ *out = p[0]; }
__attribute__((global)) void k_volst(u64 *p, u64 v){ st_local_u64(p, v); }
__attribute__((global)) void k_plainst(u64 *p, u64 v){ p[0] = v; }
