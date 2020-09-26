# 2.14

x = 0x66, y = 0x39.

|Expression| value|
|-|-|
|x & y     | 0x20|
|x \| y    | 0x7F|
|~x \| ~y  | 0xDF|
|x & !y    | 0x00|

|Expression| value|
|-|-|
|x && y    | 1|
|x \|\| y  | 1|
|!x \|\|!y | 0|
|x && ~y   | 1|
