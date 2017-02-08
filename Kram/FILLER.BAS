SCREEN 9, , 0, 1

DIM x(10000) AS INTEGER
DIM y(10000) AS INTEGER
DIM z(10000) AS INTEGER

anz = 200
e = 2000
b = 100

FOR q = 1 TO anz
 x(q) = INT(RND * 640 - 320)
 y(q) = INT(RND * 350 - 175)
 z(q) = e
NEXT q

DO
 FOR q = 1 TO anz
  z(q) = z(q) - e / b
  IF z(q) = 0 THEN z(q) = -1
  xx = 320 + x(q) * e / z(q)
  yy = 175 + y(q) * e / z(q)
  IF z(q) < 1 OR xx < 0 OR xx > 640 OR yy < 0 OR yy > 350 THEN x(q) = INT(RND * 640 - 320): y(q) = INT(RND * 350 - 175): z(q) = e
  SELECT CASE z(q)
  CASE 0 TO e / 2: c = 15
  CASE e / 2 TO e * .75: c = 7
  CASE ELSE: c = 8
  END SELECT
 
  PSET (xx, yy), c
 NEXT q
 PCOPY 0, 1
 CLS

LOOP WHILE INKEY$ = ""

