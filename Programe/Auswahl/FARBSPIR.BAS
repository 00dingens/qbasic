
'Lichteffekte V2.4

RANDOMIZE TIMER
p = 70
DIM x(p), y(p)
FOR a = 1 TO p
 x(a) = a * 3 + 50
 y(a) = INT(RND * 80 + 60)
NEXT a

SCREEN 13
FOR a = 1 TO 63
 FOR b = 1 TO p
  CIRCLE (x(b), y(b)), 64 - a, a
  PAINT (x(b) + 63 - a, y(b)), a, a
 NEXT b
NEXT a
FOR a = 1 TO 63
 PALETTE a, a
NEXT a

