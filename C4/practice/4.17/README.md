# 4.17

| Stage  | `cmovq rA, rB` |
|  -     |      -         |
| Fetch  | `icode:ifun <- M1[PC]`     |
|        | `rA:rB <- M1[PC+1]`        |
|        | `valP <- PC + 2`           |
| Decode | `valA <- R[rA]`            |
| Execute| `valE <- 0 + valA`         |
|        | `Cnd <- Cond(CC, ifun)`    |
| Memory |                            |
| Write back | `if(Cnd) R[rB] <- valE`|
| PC update  | `PC <- valP`           |
  