RANDOMIZE TIMER
p = 70
DIM x(p), y(p)
FOR a = 1 TO p
 x(a) = a * 3 + 50
 y(a) = INT(RND * 80 + 60)
NEXT a

SCREEN 13
FOR a = 1 TO 64
 FOR b = 1 TO p
  CIRCLE (x(b), y(b)), 65 - a, a + 16
  PAINT (x(b) + 64 - a, y(b)), a + 16, a + 16
 NEXT b
NEXT a

