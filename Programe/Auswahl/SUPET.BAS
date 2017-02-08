ON ERROR GOTO n
DIM o(5000), i(5000)
SCREEN 12
CIRCLE (5, 5), 4
FOR x = 1 TO 10
 FOR y = 1 TO 10
  q(x, y) = POINT(x, y)
 NEXT y
NEXT x

FOR a = 1 TO 10 STEP .1
 LINE (0, 0)-(a * 10, a * 10), 0, BF
 FOR x = 1 TO 10
  FOR y = 1 TO 10
   IF q(x, y) <> 0 THEN CIRCLE (x * a, y * a), a * .5 - .5, q(x, y)
  NEXT y
 NEXT x
 FOR t = 1 TO 50: NEXT t
NEXT a
LINE (0, 0)-(101, 101), 0, BF


FOR a = 1 TO 10 STEP .1
 FOR x = 1 TO 10
  FOR y = 1 TO 10
   IF q(x, y) <> 0 THEN
    CIRCLE (x * a, y * a), a * .5 - .5, q(x, y)
   END IF
  NEXT y
 NEXT x
 GET (0, 0)-(a * 10, a * 10), i
 LINE (0, 0)-(a * 10, a * 10), 0, BF
 GET (0, 0)-(a * 10, a * 10), o
 FOR n = 1 TO 10
  FOR m = 1 TO 10
   IF q(n, m) <> 0 THEN
    PUT (n * 10 * a, m * 10 * a), i, PSET
   ELSE
    PUT (n * 10 * a, m * 10 * a), o, PSET
   END IF
  NEXT m
 NEXT n
 FOR t = 1 TO 50: NEXT t
NEXT a
END

n:
LINE (n * 10 * a, m * 10 * a)-STEP(a * 10, a * 10), 0, BF
RESUME NEXT

