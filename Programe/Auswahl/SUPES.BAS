ON ERROR GOTO n
DIM o(10000)
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
 CLS
 FOR x = 1 TO 10
  FOR y = 1 TO 10
   IF q(x, y) <> 0 THEN
    CIRCLE (x * a, y * a), a * .5 - .5, q(x, y)
   END IF
  NEXT y
 NEXT x
 GET (0, 0)-(a * 10, a * 10), o
 LINE (0, 0)-(100, 100), 0, BF
 FOR n = 1 TO 10
  FOR m = 1 TO 10
   IF q(n, m) <> 0 THEN
    PUT (n * 10 * a, m * 10 * a), o
   END IF
  NEXT m
 NEXT n
 FOR t = 1 TO 50: NEXT t
NEXT a
END

n: RESUME NEXT

