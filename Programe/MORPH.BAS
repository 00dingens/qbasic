DECLARE SUB pkt (a!, b!, xx!, yy!)
DIM SHARED x(64, 64), y(64, 64)
SCREEN 12
pkt 0, 0, 100, 100
pkt 32, 0, 250, 50
pkt 64, 0, 300, 200   '<-geknickt
pkt 0, 16, 80, 150
pkt 0, 32, 130, 200
pkt 0, 64, 100, 400
pkt 64, 16, 430, 150
pkt 64, 32, 420, 250
pkt 32, 64, 250, 440
pkt 48, 64, 300, 420
pkt 64, 64, 400, 400
'fehlende rahmenpunkte
FOR gg = 5 TO 0 STEP -1
 g = 2 ^ gg
 FOR a = 0 TO 64 STEP g
  IF x(0, a) = 0 AND y(0, a) = 0 THEN x(0, a) = (x(0, a + g) + x(0, a - g)) / 2: y(0, a) = (y(0, a + g) + y(0, a - g)) / 2
  IF x(64, a) = 0 AND y(64, a) = 0 THEN x(64, a) = (x(64, a + g) + x(64, a - g)) / 2: y(64, a) = (y(64, a + g) + y(64, a - g)) / 2
  IF x(a, 0) = 0 AND y(a, 0) = 0 THEN x(a, 0) = (x(a + g, 0) + x(a - g, 0)) / 2: y(a, 0) = (y(a + g, 0) + y(a - g, 0)) / 2
  IF x(a, 64) = 0 AND y(a, 64) = 0 THEN x(a, 64) = (x(a + g, 64) + x(a - g, 64)) / 2: y(a, 64) = (y(a + g, 64) + y(a - g, 64)) / 2
 NEXT a
NEXT gg

'rahmen malen
FOR a = 0 TO 64
 PSET (x(0, a), y(0, a))
 PSET (x(64, a), y(64, a))
 PSET (x(a, 0), y(a, 0))
 PSET (x(a, 64), y(a, 64))
NEXT a

FOR gg = 5 TO 0 STEP -1
 g = 2 ^ gg
 FOR a = 0 TO 64 STEP g
  FOR b = 0 TO 64 STEP g
   IF x(a, b) = 0 AND y(a, b) = 0 THEN GOSUB rechm
  NEXT b
 NEXT a

 IF g = 1 THEN GOTO mal
 g = g / 2

 FOR a = 0 TO 64 STEP g * 2
  FOR b = 0 TO 64 STEP g
   IF x(a, b) = 0 AND y(a, b) = 0 THEN GOSUB rechy
  NEXT b
 NEXT a

 FOR a = 0 TO 64 STEP g
  FOR b = 0 TO 64 STEP g
   IF x(a, b) = 0 AND y(a, b) = 0 THEN GOSUB rechx
  NEXT b
 NEXT a

NEXT gg

mal:
FOR a = 0 TO 64
 FOR b = 0 TO 64
  PSET (x(a, b), y(a, b))
 NEXT b
NEXT a
END

rechm:
x(a, b) = (x(a, b + g) + x(a, b - g) + x(a + g, b) + x(a - g, b)) / 4
y(a, b) = (y(a, b + g) + y(a, b - g) + y(a + g, b) + y(a - g, b)) / 4
RETURN

rechy:
x(a, b) = (x(a, b + g) + x(a, b - g)) / 2
y(a, b) = (y(a, b + g) + y(a, b - g)) / 2
RETURN

rechx:
x(a, b) = (x(a + g, b) + x(a - g, b)) / 2
y(a, b) = (y(a + g, b) + y(a - g, b)) / 2
RETURN

SUB pkt (a, b, xx, yy)
 x(a, b) = xx
 y(a, b) = yy
END SUB

