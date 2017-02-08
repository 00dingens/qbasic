INPUT "welcher grad"; g
DIM a(g + 1, g + 1)
FOR x = g TO 0 STEP -1
 PRINT "vieviele x^"; x;
 INPUT a(x, 0)
NEXT x
FOR x = 1 TO g
 FOR y = 0 TO g
  a(y, x) = a(y + 1, x - 1) * (y + 1)
 NEXT y
NEXT x
INPUT "x anfang", x1
INPUT "x ende  ", x2
IF x1 = x2 THEN x1 = -16: x2 = 16
INPUT "y anfang", y1
INPUT "y ende  ", y2
IF y1 = y2 THEN y1 = -10: y2 = 10
SCREEN 12
WINDOW (x1, y1)-(x2, y2)
LINE (x1, 0)-(x2, 0), 8
LINE (0, y1)-(0, y2), 8

FOR x = x1 TO x2 STEP (x2 - x1) / 640
 FOR q = 0 TO g
  y = 0
  FOR z = 0 TO g
   y = y + a(z, q) * x ^ z
  NEXT z
  PSET (x, y), q + 1
 NEXT q
NEXT x

