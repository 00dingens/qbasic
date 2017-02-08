RANDOMIZE
SCREEN 13
x = 47: y = 47
rr = 4
r = rr

FOR m = 0 TO y STEP r
 FOR n = 0 TO x STEP r
  LINE (n, m)-STEP(r, r), INT(RND * 256), BF
 NEXT n
NEXT m

'CIRCLE (23, 23), 16, 255
'PAINT (23, 23), 255, 255
'CIRCLE (23, 23), 12, 0
'PAINT (23, 23), 0, 0

'FOR n = 1 TO x STEP 8
' CIRCLE (23, n), 4, 255
' PAINT (23, n), 255, 255
'NEXT n

DO
 r = r / 2
 FOR m = 0 TO y STEP r
  FOR n = 0 TO x STEP r
   c = CINT((POINT(n, m) + POINT(n + r, m) + POINT(n, m + r) + POINT(n + r, m + r)) / 4)
   IF m + r >= y THEN c = POINT(n, 0)
   IF n + r >= x THEN c = POINT(0, m)
   LINE (n, m)-STEP(r, r), c, BF
  NEXT n
 NEXT m
LOOP UNTIL r <= 1
DIM z(8000)
GET (0, 0)-(x, y), z
PUT (x + 1, 0), z, PSET
PUT (0, y + 1), z, PSET
PUT (x + 1, y + 1), z, PSET
FOR z = 0 TO 255
 LINE (z, 190)-(z, 200), z
NEXT z

FOR z = 0 TO 23
 OUT &H3C7, z + 32
 r = INP(&H3C9)
 g = INP(&H3C9)
 b = INP(&H3C9)
 FOR t = 0 TO 8
  OUT &H3C8, z + t * 24 + 8
  OUT &H3C9, r
  OUT &H3C9, g
  OUT &H3C9, b
 NEXT t
NEXT z
DO: LOOP WHILE INKEY$ = ""

x = x + 1: y = y + 1
DIM a(x, y)
FOR m = 0 TO y
 FOR n = 0 TO x
  a(n, m) = POINT(n, m) * rr / 16
 NEXT n
NEXT m
SCREEN 12
FOR m = 0 TO y - 1
 FOR n = 0 TO x - 1
  IF n <> x - 1 THEN LINE (8 * n + 5 * m, 200 + 5 * m - a(n, m))-(8 * (n + 1) + 5 * m, 200 + 5 * m - a(n + 1, m)), 15
  IF m <> y - 1 THEN LINE (8 * n + 5 * m, 200 + 5 * m - a(n, m))-(8 * n + 5 * (m + 1), 200 + 5 * (m + 1) - a(n, m + 1)), 15
 NEXT n
NEXT m

