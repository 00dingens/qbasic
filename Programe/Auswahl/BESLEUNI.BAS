RANDOMIZE TIMER
SCREEN 12
DIM a(10000)
a = -.007: b = 0: x = 320: y = 100
PSET (x, y)
DO
 a = a + .0000001: y = y - a
 b = b + RND * .00002 - .00001: x = x + b
 LINE -(x, y)
LOOP UNTIL y < 0

