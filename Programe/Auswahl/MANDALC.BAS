
'Mandala V1.2

CLS
PRINT TAB(30); "M A N D A L A"
PRINT TAB(29); "==============="
PRINT
INPUT "F�r bestimmte Zufallszahlen ist ein Startwert n�tig(-32768 bis 32767)"; ddd
RANDOMIZE CDBL(ddd)
a = CDBL(RND * 200): b = CDBL(RND * 200): c = CDBL(RND * 200): x = 0: y = 0
SCREEN 12: WINDOW (-640, -480)-(640, 480)
DO
  IF POINT(x, y) = 0 THEN
    PSET (x, y), 11
    PSET (x, -y), 9
    PSET (-x, y), 10
    PSET (-x, -y), 2
    PSET (y, x), 14
    PSET (y, -x), 13
    PSET (-y, x), 12
    PSET (-y, -x), 15
  END IF
  xx = y - SGN(x) * SQR(ABS(b * x + c))
  yy = -a - x
  x = xx: y = yy
LOOP WHILE INKEY$ = ""
PRINT CDBL(a); CDBL(b); CDBL(c); CDBL(ddd)

