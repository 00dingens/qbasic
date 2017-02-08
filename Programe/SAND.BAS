RANDOMIZE TIMER
SCREEN 13
g = 100: h = 100   'Gr”áe
w = 10            'B”schungssteigung (0 - 30)
FOR x = 1 TO 63
 OUT &H3C8, x
 OUT &H3C9, x
 OUT &H3C9, x
 OUT &H3C9, x
NEXT x
FOR x = 64 TO 100
 OUT &H3C8, x
 OUT &H3C9, 63
 OUT &H3C9, 63
 OUT &H3C9, 63
NEXT x

FOR x = 0 TO g + 2
 FOR y = 0 TO h + 2
  PSET (x, y), INT(RND * 32)
  IF RND < .2 THEN PSET (x, y), 100
 NEXT y
NEXT x

'LINE (8, 8)-(11, 11), 100, BF

DO
 fertig = -1
 FOR z = 0 TO g
  FOR x = 0 TO h
   n = z + 1: m = x + 1
  
   IF POINT(n, m) - w > POINT(n + 1, m) THEN
    PSET (n, m), POINT(n, m) - 1
    PSET (n + 1, m), POINT(n + 1, m) + 1
    fertig = 0
   END IF
   IF POINT(n, m) - w > POINT(n - 1, m) THEN
    PSET (n, m), POINT(n, m) - 1
    PSET (n - 1, m), POINT(n - 1, m) + 1
    fertig = 0
   END IF
   IF POINT(n, m) - w > POINT(n, m + 1) THEN
    PSET (n, m), POINT(n, m) - 1
    PSET (n, m + 1), POINT(n, m + 1) + 1
    fertig = 0
   END IF
   IF POINT(n, m) - w > POINT(n, m - 1) THEN
    PSET (n, m), POINT(n, m) - 1
    PSET (n, m - 1), POINT(n, m - 1) + 1
    fertig = 0
   END IF
  
  NEXT x
 NEXT z
LOOP UNTIL fertig OR INKEY$ = " "
LINE (0, 0)-(g + 2, h + 2), 0, B
BEEP: SLEEP

