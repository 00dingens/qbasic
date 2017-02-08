CLS
PRINT TAB(30); "M A N D A L A"
PRINT TAB(29); "==============="
PRINT :
INPUT "FÅr bestimmte Zufallszahlen ist ein Startwert nîtig(-32768 bis 32767)"; ddd
RANDOMIZE ddd
a = CDBL(RND * 200)
b = CDBL(RND * 200)
c = CDBL(RND * 200)

SCREEN 12
WINDOW (-640, -480)-(640, 480)
x = 0: y = 0
DO
 FOR p = 1 TO 15
  FOR o = 1 TO 10
   PSET (x, y), p
   xx = y - SGN(x) * SQR(ABS(b * x + c))
   yy = -a - x
   x = xx: y = yy
  NEXT o
 NEXT p
LOOP WHILE INKEY$ = ""
PRINT CDBL(a); CDBL(b); CDBL(c); ddd

