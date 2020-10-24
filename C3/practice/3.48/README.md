# 3.48

A.

- no canary value: `buf` in `(%rsp)`, `v` in `(%rsp) + 0x24`.
- had canary value: `buf` in `(%rsp) + 0x16`, `v` in `(%rsp) + 0x8`.

B.  `buf` can't corrupt the value of `v`.

