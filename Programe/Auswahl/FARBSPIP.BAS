
'Lichteffekte V2.2

RANDOMIZE TIMER
p = 70
DIM x(p), y(p)
FOR a = 1 TO p
 x(a) = a * 3 + 50
 y(a) = INT(RND * 100 + 50)
NEXT a

SCREEN 13
FOR a = 1 TO 16
 FOR b = 1 TO p
  CIRCLE (x(b), y(b)), 68 - a * 4, 56 - a
  PAINT (x(b) + 67 - a * 4, y(b)), 56 - a, 56 - a
'  CIRCLE (x(b), y(b)), 34 - a * 2, 56-a
'  PAINT (x(b) + 33 - a * 2, y(b)), 56-a, 56-a
 NEXT b
NEXT a

