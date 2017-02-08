RANDOMIZE TIMER
SCREEN 7
a = 10: p = .5 * 3.141592653#
DIM q(a)
FOR x = 0 TO a
 q(x) = INT(RND * 100)'(300 / a))
NEXT x
FOR x = 0 TO a - 1
 IF q(x) < q(x + 1) THEN
  m = q(x) + ((q(x + 1) - q(x)) / 2)
  v = (q(x + 1) - q(x)) / (300 / a)
  IF v > 1 THEN g = (q(x + 1) - q(x)) / 2 ELSE g = 150 / a
  CIRCLE (x * 300 / a, m), g, 7, 0, p, v
  CIRCLE ((x + 1) * 300 / a, m), g, 7, 2 * p, 3 * p, v
 ELSE
  m = q(x + 1) + ((q(x) - q(x + 1)) / 2)
  v = (q(x) - q(x + 1)) / (300 / a)
  IF v > 1 THEN g = (q(x) - q(x + 1)) / 2 ELSE g = 150 / a
  CIRCLE (x * 300 / a, m), g, 7, 3 * p, 4 * p, v
  CIRCLE ((x + 1) * 300 / a, m), g, 7, p, 2 * p, v
 END IF
 PSET (x * 300 / a, q(x))
NEXT x
LINE (0, 0)-(300, 150), 7, B
PAINT (10, 140), 15, 7
SLEEP

