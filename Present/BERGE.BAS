RANDOMIZE
SCREEN 13
x = 32: y = 32
g1 = SIN(.05): g2 = COS(.05)
e = 100
rr = 16
r = rr

FOR m = 0 TO y STEP r
 FOR n = 0 TO x STEP r
  LINE (n, m)-STEP(r, r), INT(RND * 256), BF
 NEXT n
NEXT m

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
DIM j(x, y), k(x, y), l(x, y), xx(x, y), yy(n, m)
FOR m = 0 TO y
 FOR n = 0 TO x
  j(n, m) = (n - y / 2) * 100 / x
  k(n, m) = POINT(n, m) * rr / 16
  l(n, m) = (m - x / 2) * 100 / x
 NEXT n
NEXT m
SCREEN 9, , 1, 0
DO
 t$ = INKEY$
 IF t$ = CHR$(0) + "H" THEN
  FOR m = 0 TO y
   FOR n = 0 TO x
    k(n, m) = k(n, m) + 5
   NEXT n
  NEXT m
 END IF
 IF t$ = CHR$(0) + "P" THEN
  FOR m = 0 TO y
   FOR n = 0 TO x
    k(n, m) = k(n, m) - 5
   NEXT n
  NEXT m
 END IF

 FOR m = 0 TO y
  FOR n = 0 TO x
   xx(n, m) = j(n, m) * g2 - l(n, m) * g1
   yy(n, m) = j(n, m) * g1 + l(n, m) * g2
   j(n, m) = xx(n, m): l(n, m) = yy(n, m)
  NEXT n
 NEXT m
 
 FOR m = 0 TO y
  FOR n = 0 TO x
   xx(n, m) = 320 + j(n, m) / (l(n, m) + e) * e
   yy(n, m) = 175 + k(n, m) / (l(n, m) + e) * e
  NEXT n
 NEXT m
 CLS
 FOR m = 0 TO y - 1
  FOR n = 0 TO x - 1
   IF n <> x - 1 THEN LINE (xx(n, m), yy(n, m))-(xx(n + 1, m), yy(n + 1, m)), 15
   IF m <> y - 1 THEN LINE (xx(n, m), yy(n, m))-(xx(n, m + 1), yy(n, m + 1)), 15
  NEXT n
 NEXT m
 PCOPY 1, 0
LOOP UNTIL t$ = CHR$(27)

