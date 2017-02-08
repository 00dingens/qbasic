DEFDBL A-Z
a = -1: b = 2
x = 200: y = 100
q = 200000
SCREEN 12
DO
' PSET (x, y), 0
 x = x + a: y = y + b
 PSET (x, y)
 IF x < 10 THEN x = 630
 IF x > 630 THEN x = 10
 IF y < 10 THEN y = 470
 IF y > 470 THEN y = 10
 e = SQR((x - 320) ^ 2 + (y + 480) ^ 2)  'Entfernung in dots
 n = (x - 320) / e
 m = (y - 240) / e
 n = q * n / (e ^ 2)
 m = q * m / (e ^ 2)
 a = a - n: b = b - m
LOOP WHILE INKEY$ = ""

