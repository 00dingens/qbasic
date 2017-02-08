RANDOMIZE TIMER
SCREEN 7, , 0, 1
DIM x(1000), y(1000)
ab = 7
a = 5: b = 5
FOR z = 0 TO 1000
 y(z) = RND * 300'10
 x(z) = RND * 200'10 + z * 3
NEXT z
x(0) = 10: y(0) = 10
GOSUB mal
DO
 x(0) = x(0) + a
 y(0) = y(0) + b
 IF x(0) > 318 OR x(0) < 1 THEN x(0) = x(0) - a: a = -a
 IF y(0) > 198 OR y(0) < 1 THEN y(0) = y(0) - b: b = -b
 GOSUB mal
LOOP WHILE INKEY$ = ""

END

mal:
 CLS
 PSET (x(0), y(0))
 FOR o = 1 TO 90
  l = SQR((x(o - 1) - x(o)) ^ 2 + (y(o - 1) - y(o)) ^ 2)
  x(o) = x(o - 1) + (x(o) - x(o - 1)) * ab / l
  y(o) = y(o - 1) + (y(o) - y(o - 1)) * ab / l
  PSET (x(o), y(o))
 NEXT o
 PCOPY 0, 1
RETURN

