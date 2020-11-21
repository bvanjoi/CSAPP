# 4.13

| Stage  | `irmovq $128, %rsp` |
|  -     |      -              |
| Fetch  | `icode:ifun <- M1[0x16] = 3:0`   |
|        | `rA:rB <- M1[0x17] = f:4`        |
|        | `valC <- M8[0x18] = 0x80`        |
|        | `valP <- PC + 10 = 0x20`         |
| Decode |                                  |
| Execute| `valE <- 0 + valC = 0x80`        |
| Memory |                                  |
| Write back | `R[%rsp] <- valE = 0x80`     |
| PC update  | `PC <- valP = 0x20`          |
