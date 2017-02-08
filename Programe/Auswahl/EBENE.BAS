
'Stellt eine Ebene dar.

RANDOMIZE TIMER
SCREEN 12
LINE (0, 0)-(20, 20), 1, BF
FOR x = 1 TO 8
 CIRCLE (10, 10), 10 - x, x
 PAINT STEP(0, 0), x, x
 OUT &H3C8, x
 OUT &H3C9, 5 * x + 10
 OUT &H3C9, 5 * x + 10
 OUT &H3C9, 5 * x + 10
NEXT x
PSET (10, 10), 15

DIM a(20, 20)
FOR x = 0 TO 20
 FOR y = 0 TO 20
  a(x, y) = -POINT(x, y) * 5
 NEXT y
NEXT x

CLS
WINDOW (1, -20)-(240, 300)
FOR x = 1 TO 20
 FOR y = 1 TO 20
'  LINE ((x - 1) * 10 + y * 3, y * 8 - a(x - 1, y))-(x * 10 + (y - 1) * 3, (y - 1) * 8 - a(x, y - 1)), 7
'  LINE ((x - 1) * 10 + (y - 1) * 3, (y - 1) * 8 - a(x - 1, y - 1))-(x * 10 + y * 3, y * 8 - a(x, y)), 7

  LINE ((x - 1) * 10 + y * 3, y * 8 - a(x - 1, y))-(x * 10 + y * 3, y * 8 - a(x, y)), -a(x, y) / 5
  LINE (x * 10 + (y - 1) * 3, (y - 1) * 8 - a(x, y - 1))-(x * 10 + y * 3, y * 8 - a(x, y)), -a(x, y) / 5
 NEXT y
NEXT x
PRINT "Ende mit Taste."
DO: LOOP WHILE INKEY$ = ""

