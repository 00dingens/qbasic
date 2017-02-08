
'Generiert eine Abstrzendes-Flugzeug-Rauch-Spur.

speed = 5  'Geschwindigkeit des abstrzenden Flugzeugs (1-20) Optimum:3-8
gg = 3      'Ausdehnung der Rauchw”lkchen (0-5) Optimum:3
un = 2      'Unsch„rfe des Rauches
SCREEN 13
DIM q(10000)
FOR x = 0 TO 63
 OUT &H3C8, x
 OUT &H3C9, 0
 OUT &H3C9, 63 - x
 OUT &H3C9, 63 - x
NEXT x
FOR x = 64 TO 255
 OUT &H3C8, x
 OUT &H3C9, 0
 OUT &H3C9, 0
 OUT &H3C9, 0
NEXT x
LINE (100, 100)-STEP(1, 1), 63, BF
LINE (100 - gg, 100 - gg)-STEP(1, 1), 63, BF
LINE (100 - gg, 100 + gg)-STEP(1, 1), 63, BF
LINE (100 + gg, 100 - gg)-STEP(1, 1), 63, BF
LINE (100 + gg, 100 + gg)-STEP(1, 1), 63, BF
FOR z = 1 TO un
 FOR x = 93 TO 108
  FOR y = 93 TO 108
   a = 0
   FOR n = -2 TO 2
    FOR m = -2 TO 2
     a = a + POINT(n + x, m + y)
    NEXT m
   NEXT n
   a = a / 25
   PSET (x + 130, y), a
  NEXT y
 NEXT x
 GET (223, 93)-(238, 108), q
 PUT (93, 93), q, PSET
NEXT z
CLS
PUT (0, 0), q
n = 300: m = -10
DO
 n = n - INT(RND * speed + 1)
 m = m + INT(RND * speed + 1)
 FOR x = 0 TO 15
  FOR y = 0 TO 15
   PSET (x + n, y + m), POINT(n + x, m + y) + POINT(x, y)
  NEXT y
 NEXT x
LOOP UNTIL m > 150
LINE (0, 0)-(15, 15), 0, BF
LINE (n + 5, m + 11)-STEP(1, -1), 64

