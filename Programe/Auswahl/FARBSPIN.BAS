
'Lichteffekte V2.0

p = 3
DIM x(p), y(p)
x(1) = 150: y(1) = 95
x(2) = 155: y(2) = 107
x(p) = 163: y(p) = 102   'x(p) liegt ganz rechts

SCREEN 13
PAINT (10, 10), 0
FOR a = 1 TO 16
 FOR b = 1 TO p
  CIRCLE (x(b), y(b)), 68 - a * 4, a + 15
  PAINT (x(b) + 67 - a * 4, y(b)), a + 15, a + 15
'  CIRCLE (x(b), y(b)), 34 - a * 2, a + 15
'  PAINT (x(b) + 33 - a * 2, y(b)), a + 15, a + 15
 NEXT b
NEXT a

