
'Sich bewegender Punkt dreht sich um einen ihn anziehenden Punkt

RANDOMIZE TIMER
SCREEN 12
INPUT "Anziehungskraft (0-100)"; q
CLS
q = 101 - q
'q = .05
x = INT(RND * 640): y = INT(RND * 480)
a = RND * 2 - 1: b = RND * 2 - 1
DO
 PSET (x, y), 7
 x = x + a: y = y + b
 IF x < 0 THEN x = x + 640
 IF x > 640 THEN x = x - 640
 IF y < 0 THEN y = y + 480
 IF y > 480 THEN y = y - 480
 r = SQR((x - 320) ^ 2 + (y - 240) ^ 2): n = (x - 320) / (r * q): m = (y - 240) / (r * q)
 a = a - n: b = b - m
 PSET (x, y), 15
LOOP WHILE INKEY$ = ""

