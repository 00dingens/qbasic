xxx = 14: yyy = 7
DIM q(xxx, yyy), a$(yyy)
a$(1) = "12121212121212"
a$(2) = "21212121212121"
a$(3) = "12121212121212"
a$(4) = "21212121212121"
a$(5) = "12121212121212"
a$(6) = "21212121212121"
a$(7) = "12121212121212"
FOR x = 1 TO xxx
 FOR y = 1 TO yyy
  q(x, y) = VAL(MID$(a$(y), x, 1))
 NEXT y
NEXT x

FOR e = 1 TO 10
 CLS
 READ n, m, xx, xy, yx, yy
 xx = xx / xxx
 xy = xy / xxx
 yx = yx / yyy
 yy = yy / yyy
 
 SCREEN 12
 FOR x = 1 TO xxx
  FOR y = 1 TO yyy
   LINE (n + xx * x + yx * y, m + xy * x + yy * y)-(n + xx * (x + 1) + yx * y, m + xy * (x + 1) + yy * y), q(x, y)
   LINE (n + xx * x + yx * y, m + xy * x + yy * y)-(n + xx * x + yx * (y + 1), m + xy * x + yy * (y + 1)), q(x, y)
   LINE (n + xx * (x + 1) + yx * y, m + xy * (x + 1) + yy * y)-(n + xx * (x + 1) + yx * (y + 1), m + xy * (x + 1) + yy * (y + 1)), q(x, y)
   LINE (n + xx * x + yx * (y + 1), m + xy * x + yy * (y + 1))-(n + xx * (x + 1) + yx * (y + 1), m + xy * (x + 1) + yy * (y + 1)), q(x, y)
   PAINT (n + xx * (x + .5) + yx * (y + .5), m + xy * (x + .5) + yy * (y + .5)), q(x, y)
  NEXT y
 NEXT x
NEXT e

DATA  70, 40,300, 100, 200,300
DATA 110, 60,300,  60, 120,300
DATA 150, 80,300,  20,  40,300
DATA 190,100,300, -20, -50,300
DATA 230,120,300, -60,-120,300
DATA 270,140,300,-100,-200,300
DATA 230,120,300, -60,-120,300
DATA 190,100,300, -20, -50,300
DATA 150, 80,300,  20,  40,300
DATA 110, 60,300,  60, 120,300
DATA  70, 40,300, 100, 200,300

