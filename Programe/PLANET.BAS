DEFDBL A-Z
SCREEN 9, , 0, 0
x = 50: y = 240
a = 0: b = .2
q = 50
PSET (320, 240 * .73), 11
DO
 r = SQR((x - 320) ^ 2 + (y - 240) ^ 2)
 a = a - ((x - 320) * q / r ^ 3): b = b - ((y - 240) * q / r ^ 3)
 IF a < -10 OR a > 1000 THEN a = 10 * SGN(a)
 IF b < -10 OR b > 1000 THEN b = 10 * SGN(b)
 x = x + a: y = y + b
 IF x < -1 OR x > 640 THEN x = (x + 640) MOD 640
 IF y < -1 OR y > 480 THEN y = (y + 480) MOD 480
 PSET (x, y * .73)
LOOP WHILE INKEY$ = ""

