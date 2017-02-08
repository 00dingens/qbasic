RANDOMIZE TIMER
DIM h(50, 50) AS INTEGER

SCREEN 13
r = 8
FOR m = 0 TO 64 STEP r
 FOR n = 0 TO 64 STEP r
  LINE (n, m)-STEP(r, r), INT(RND * 256), BF
 NEXT n
NEXT m
DO
 r = r / 2
 FOR m = 0 TO 64 STEP r
  FOR n = 0 TO 64 STEP r
   c = CINT((POINT(n, m) + POINT(n + r, m) + POINT(n, m + r) + POINT(n + r, m + r)) / 4)
   IF m + r >= 64 THEN c = POINT(n, 0)
   IF n + r >= 64 THEN c = POINT(0, m)
   LINE (n, m)-STEP(r, r), c, BF
  NEXT n
 NEXT m
LOOP UNTIL r <= 1
FOR y = 0 TO 50
 FOR x = 0 TO 50
  h(x, y) = POINT(x, y) / 4
 NEXT x
NEXT y


SCREEN 7, , 0, 1
FOR z = 0 TO 7
READ r, g, b
OUT &H3C8, z
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
NEXT z



FOR z = 0 TO 199
 FOR y = 0 TO 50
  FOR x = 0 TO 50
   PSET (10 + x * 4 + y, z - y * 2), 15
  NEXT x
 NEXT y
 PCOPY 0, 1
 CLS
NEXT z
FOR z = 199 TO 0 STEP -1
 u = 0
 FOR y = 0 TO 50
  FOR x = 0 TO 50
   IF z > 190 - h(x, y) THEN
    PSET (10 + x * 4 + y, z - y * 2), 15
    u = 1
   ELSE
    PSET (10 + x * 4 + y, 190 - h(x, y) - y * 2), INT(h(x, y) / 8)
   END IF
  NEXT x
 NEXT y
 PCOPY 0, 1
 CLS
 IF u = 0 THEN EXIT FOR
NEXT z
DO: LOOP WHILE INKEY$ = ""

DATA  0, 0, 0
DATA  0, 0,63
DATA 63,63, 0
DATA  0,21, 0
DATA  0,42, 0
DATA  0,63, 0
DATA 31,31,31
DATA 63,63,63

