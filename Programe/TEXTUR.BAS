RANDOMIZE TIMER
SCREEN 12
n = 100: m = 20
FOR z = 1 TO 4
 x(z) = RND * 640: y(z) = RND * 480
NEXT z
FOR z = 1 TO 4
 CIRCLE (x(z), y(z)), 5, z
NEXT z
FOR a = 0 TO n
 FOR b = 0 TO m
  PSET ((x(1) + (x(3) - x(1)) / m * b) + (((x(2) + (x(4) - x(2)) / m * b) - (x(1) + (x(3) - x(1)) / m * b)) / n * a), (y(1) + (y(2) - y(1)) / n * a) + (((y(3) + (y(4) - y(3)) / n * a) - (y(1) + (y(2) - y(1)) / n * a)) / m * b)), 15
 NEXT b
NEXT a

