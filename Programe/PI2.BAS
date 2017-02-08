DEFDBL A-Z
CLS
e = 3
l = 1
r = 1                 'Beteiligt:
DO                    ' e  l  x1 x2 x3 pi
 l = l / 2            '    X
 x2 = l * l           '    X     X
 x3 = 1 - x2          '          X  X
 x1 = SQR(x3)         '       X     X
 l = 1 - x1           '    X  X
 x1 = l * l           '    X  X
 x3 = x1 + x2         '          X  X
 l = SQR(x3)          '    X        X
 e = e * 2            ' X   
 pi = e * l           ' X  X           X
 PRINT pi;
 i = i + 1: IF i = 25 THEN END
LOOP WHILE INKEY$ = ""
pi = e * l

