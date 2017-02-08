RANDOMIZE TIMER
CLS
PRINT TAB(30); "M A N D A L A"
PRINT TAB(29); "==============="
INPUT "   A (z.B. 123 )  ", a
INPUT "   B (z.B. 147 )  ", b
INPUT "   C (z.B. 159 )  ", c
IF a = 0 THEN a = RND * 500
IF b = 0 THEN b = RND * 500
IF c = 0 THEN c = RND * 500

SCREEN 12
WINDOW (-640, -400)-(640, 400)
x = 0: y = 0
DO
  PSET (x, y)
  xx = y - SGN(x) * SQR(ABS(b * x + c))
  yy = -a - x
  x = xx: y = yy
LOOP WHILE INKEY$ = ""
PRINT a, b, c

