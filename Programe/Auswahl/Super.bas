SCREEN 12
CIRCLE (5, 5), 4
FOR x = 1 TO 10
 FOR y = 1 TO 10
  q(x, y) = POINT(x, y)
 NEXT y
NEXT x

FOR a = 1 TO 10 STEP .1
 LINE (0, 0)-(101, 101), 0, BF
 FOR x = 1 TO 10
  FOR y = 1 TO 10
   IF q(x, y) <> 0 THEN CIRCLE (x * a, y * a), a * .5 - .5, q(x, y)
  NEXT y
 NEXT x
 FOR t = 1 TO 50: NEXT t
NEXT a

FOR a = 1 TO 10 STEP .1
 LINE (0, 0)-(640, 480), 0, BF
 FOR n = 1 TO 10
  FOR m = 1 TO 10
   IF q(n, m) <> 0 THEN
    FOR x = 1 TO 10
     FOR y = 1 TO 10
      IF q(x, y) <> 0 THEN
       CIRCLE (n * 10 * a + x * a, m * 10 * a + y * a), a * .5 - .5, q(x, y)
      END IF
     NEXT y
    NEXT x
   END IF
  NEXT m
 NEXT n
 FOR t = 1 TO 50: NEXT t
NEXT a

