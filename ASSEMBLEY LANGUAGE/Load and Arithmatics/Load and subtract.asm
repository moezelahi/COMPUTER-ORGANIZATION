b20: EQU  12345 >> 12 
b12: EQU  12345 & 0xfff
b12a: EQU  23456 & 0xfff
b20a: EQU  23456 >> 12
lui x6, 3
addi x7, x6, 0x039
lui  x8, 6
addi x9, x8, 0xba0
sub  x5, x9, x7


