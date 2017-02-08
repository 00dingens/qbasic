
'Sich schneidende Fl„chen

SCREEN 12
READ an
DIM x1(an), y1(an), x2(an), y2(an), a1(an), b1(an), a2(an), b2(an)
FOR x = 1 TO an
 READ x1(x), y1(x), x2(x), y2(x), a1(x), b1(x), a2(x), b2(x)
 a1(x) = a1(x) / 100
 b1(x) = b1(x) / 100
 a2(x) = a2(x) / 100
 b2(x) = b2(x) / 100
NEXT x
FOR x = 0 TO 100
 FOR y = 1 TO an
  FOR z = 1 TO 8 - y
   LINE (x1(y) + (z - 1) * 65, y1(y))-(x2(y) + (z - 1) * 65, y2(y)), y
  NEXT z
  x1(y) = x1(y) + a1(y)
  x2(y) = x2(y) + a2(y)
  y1(y) = y1(y) + b1(y)
  y2(y) = y2(y) + b2(y)
 NEXT y
NEXT x

DATA 7
DATA 20,  0, 60,  0,-20, 60,-20, 60
DATA 40,  0, 40, 40,-20, 20,-20, 20
DATA 20,  0, 60, 40,-20, 20,-20, 20
DATA 20, 40, 60, 40,-20,-20,-20,-20
DATA 20, 20, 60, 20,-20, 20,-20, 20
DATA 60,  0, 60, 40,-60, 20,-60, 20
DATA 20,  0, 20, 40, 20, 20, 20, 20

