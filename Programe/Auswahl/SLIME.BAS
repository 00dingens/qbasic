SCREEN 7, , 1, 0
a = 20: p = .5 * 3.1415926535#
DIM q(a), w(a)
FOR x = 1 TO a
 q(x) = INT(RND * 20)
 w(x) = (INT(RND * 2) - .5) * 2
NEXT x
DO
 k = (k + 1) MOD 190
 CLS
 FOR x = 1 TO a
  q(x) = q(x) + w(x)
  IF q(x) < 0 OR q(x) > 20 THEN w(x) = -w(x)
 NEXT x

 FOR x = 0 TO a - 1
  IF q(x) < q(x + 1) THEN
   m = q(x) + ((q(x + 1) - q(x)) / 2)
   v = (q(x + 1) - q(x)) / (300 / a)
   IF v > 1 THEN g = (q(x + 1) - q(x)) / 2 ELSE g = 150 / a
   CIRCLE (x * 300 / a, k + m), g, 10, 0, p, v
   CIRCLE ((x + 1) * 300 / a, k + m), g, 10, 2 * p, 3 * p, v
  ELSE
   m = q(x + 1) + ((q(x) - q(x + 1)) / 2)
   v = (q(x) - q(x + 1)) / (300 / a)
   IF v > 1 THEN g = (q(x) - q(x + 1)) / 2 ELSE g = 150 / a
   CIRCLE (x * 300 / a, k + m), g, 2, 3 * p, 4 * p, v
   CIRCLE ((x + 1) * 300 / a, k + m), g, 2, p, 2 * p, v
  END IF
 NEXT x
 PCOPY 1, 0
LOOP WHILE INKEY$ = ""

