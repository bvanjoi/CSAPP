# 4.18

| Stage  | `call 0x041` |
|  -     |      -         |
| Fetch  | `icode:ifun <- M1[0x37] = 8:0`   |
|        | `valC <- M8[0x38] = 0x41`        |
|        | `valP <- PC + 9 = 0x40`          |
| Decode | `valB <- R[%rsp] = 128`          |
| Execute| `valE <- valB - 8 = 120`         |
| Memory | `M8[valE] = valP = 0x40`         |
| Write back | `R[%rsp] <- valE = 120`      |
| PC update  | `PC <- 0x41`                 |
