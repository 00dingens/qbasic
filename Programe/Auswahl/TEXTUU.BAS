RANDOMIZE TIMER
SCREEN 9, , 1, 0
PRINT "Hallo"
PRINT "Du da"
n = 40: m = 32
DIM p(n, m)
FOR a = 0 TO n - 1
 FOR b = 0 TO m - 1
  'IF POINT(a, b) = 0 THEN PSET (a, b), INT(RND * 8)
 NEXT b
NEXT a
FOR a = 0 TO n - 1
 FOR b = 0 TO m - 1
  p(a, b) = POINT(a, b)
 NEXT b
NEXT a
CLS
FOR z = 1 TO 4
 x(z) = RND * 640: y(z) = RND * 350
 a(z) = RND * 10 - 5: b(z) = RND * 10 - 5
NEXT z
DO
 FOR z = 1 TO 4
  IF x(z) + a(z) < 0 OR x(z) + a(z) > 640 THEN a(z) = -a(z)
  IF y(z) + b(z) < 0 OR y(z) + b(z) > 350 THEN b(z) = -b(z)
  x(z) = x(z) + a(z): y(z) = y(z) + b(z)
 NEXT z
 CLS
 FOR a = 0 TO n - 1
  FOR b = 0 TO m - 1
  
   'PSET ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * b)), p(a, b)
                                                                                                                                                                                                                                   '''
   LINE ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * b))-((x(1) + (x(3) - x(1)) / m * (b + 1)) + (((x(2) + (x(4) - x(2)) / m * (b + 1)) - (x(1) + (x(3) - x(1)) / m * (b + 1))) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * (b + 1))), p(a, b)
   LINE ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * b))-((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * (a + 1)), (y(1) + (y(2) - y(1)) / n * (a + 1)) + (((y(3) + (y(4) - y(3)) / n * (a + 1)) - (y(1) + (y(2) - y(1)) / n * (a + 1))) / m * b)), p(a, b)
   LINE ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * b))-((x(1) + (x(3) - x(1)) / m * (b + 1)) + (((x(2) + (x(4) - x(2)) / m * (b + 1)) - (x(1) + (x(3) - x(1)) / m * (b + 1))) / n * (a + 1)), (y(1) + (y(2) - y(1)) / n * (a + 1)) + (((y(3) + (y(4) - y(3)) / n * (a + 1)) - (y(1) + (y(2) - y(1)) / n * (a + 1))) / m * (b + 1))), p(a, b)
   LINE ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * (a + 1)), (y(1) + (y(2) - y(1)) / n * (a + 1)) + (((y(3) + (y(4) - y(3)) / n * (a + 1)) - (y(1) + (y(2) - y(1)) / n * (a + 1))) / m * b))-((x(1) + (x(3) - x(1)) / m * (b + 1)) + (((x(2) + (x(4) - x(2)) / m * (b + 1)) - (x(1) + (x(3) - x(1)) / m * (b + 1))) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * (b + 1))), p(a, b)
 
  NEXT b
 NEXT a
 PCOPY 1, 0
LOOP WHILE INKEY$ = ""

