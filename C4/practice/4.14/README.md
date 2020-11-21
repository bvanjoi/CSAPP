# 4.14

| Stage  | `popq $128, %rsp` |
|  -     |      -              |
| Fetch  | `icode:ifun <- M1[0x2c] = b:0`   |
|        | `rA:rB <- M1[0x2d] = 0:f`        |
|        | `valP <- PC + 2 = 0x2e`          |
| Decode | `valA <- R[%rsp] = 120`          |
|        | `valB <- R[%rsp] = 120`          |
| Execute| `valE <- valB + 8 = 128`        |
| Memory | `valM <- M8[valA] = 9`           |
| Write back | `R[%rsp] <- valE = 128`     |
|            | `R[%rax] <- valM = 9`        |
| PC update  | `PC <- valP = 0x2e`          |
