RANDOMIZE TIMER
SCREEN 13
DIM a(1000)
FOR x = 1 TO 64
 OUT &H3C8, x
 OUT &H3C9, INT(x)
 OUT &H3C9, INT(x)
 OUT &H3C9, INT(x)
NEXT x
OUT &H3C8, 64
OUT &H3C9, 63
OUT &H3C9, 63
OUT &H3C9, 63
x1 = INT(RND * 320): y1 = INT(RND * 200)
x2 = INT(RND * 320): y2 = INT(RND * 200)
x3 = INT(RND * 320): y3 = INT(RND * 200)
x4 = INT(RND * 320): y4 = INT(RND * 200)
x5 = INT(RND * 320): y5 = INT(RND * 200)
x6 = INT(RND * 320): y6 = INT(RND * 200)
x7 = INT(RND * 320): y7 = INT(RND * 200)
x8 = INT(RND * 320): y8 = INT(RND * 200)
start:
FOR x = 0 TO 1000
 IF zz = 1 THEN a(x) = SQR(((x MOD 16) - 8) ^ 2) - 4
 IF zz = 0 THEN a(x) = SGN(SQR(((x MOD 16) - 8) ^ 2) - 4) * 4
NEXT x

FOR y = 199 TO 0 STEP -1
 FOR x = 319 TO 0 STEP -1
  e1 = INT(SQR((x - x1) ^ 2 + (y - y1) ^ 2))
  e2 = INT(SQR((x - x2) ^ 2 + (y - y2) ^ 2))
  e3 = INT(SQR((x - x3) ^ 2 + (y - y3) ^ 2))
  e4 = INT(SQR((x - x4) ^ 2 + (y - y4) ^ 2))
  e5 = INT(SQR((x - x5) ^ 2 + (y - y5) ^ 2))
  e6 = INT(SQR((x - x6) ^ 2 + (y - y6) ^ 2))
  e7 = INT(SQR((x - x7) ^ 2 + (y - y7) ^ 2))
  e8 = INT(SQR((x - x8) ^ 2 + (y - y8) ^ 2))
  PSET (x, y), a(e1) + a(e2) + a(e3) + a(e4) + a(e5) + a(e6) + a(e7) + a(e8) + 32
 NEXT x
NEXT y
DO: LOOP WHILE INKEY$ = ""

'schatten
a = 1: b = 1: c = -2   'Schattenrichtung
FOR x = 0 TO 319
 FOR y = 0 TO 199
  n = x: m = y: o = POINT(x, y)
  DO
   n = n + a: m = m + b: o = o + c
   IF POINT(n, m) < o THEN PSET (n, m), 0
  LOOP UNTIL n < 0 OR n > 320 OR m < 0 OR m > 200 OR o < 0
 NEXT y
NEXT x
DO: LOOP WHILE INKEY$ = ""

'krass
FOR y = 199 TO 0 STEP -1
 FOR x = 319 TO 0 STEP -1
  IF POINT(x, y) <> 0 THEN PSET (x, y), 64
 NEXT x
NEXT y

DO: LOOP WHILE INKEY$ = ""
IF zz = 0 THEN zz = 1: GOTO start

