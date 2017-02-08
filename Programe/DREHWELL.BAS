SCREEN 9, , 0, 1
DEFDBL X-Z
WINDOW (-320, -175)-(319, 174)
DIM h(20, 20) AS INTEGER     'h”he
DIM n(20, 20, 40) AS INTEGER 'x-koord
DIM m(20, 20, 40) AS INTEGER 'y-koord
zz = 3.1415926535# / 20
 FOR y = 0 TO 20
  FOR x = 0 TO 20
   h(x, y) = (COS(zz * x) + COS(zz * y)) * 20
  NEXT x
 NEXT y
FOR z = 0 TO 40
 CLS
 zx = SIN(zz * z): zy = COS(zz * z)
 FOR y = 0 TO 20
  FOR x = 0 TO 20
   n(x, y, z) = x * 5 * zy - y * 5 * zx
   m(x, y, z) = x * 5 * zx + y * 5 * zy
   PSET (100 + n(x, y, z) + m(x, y, z) * .4, m(x, y, z) * .5 + h(x, y))
   PSET (100 - n(x, y, z) - m(x, y, z) * .4, -m(x, y, z) * .5 + h(x, y))
   PSET (100 + m(x, y, z) - n(x, y, z) * .4, -n(x, y, z) * .5 + h(x, y))
   PSET (100 - m(x, y, z) + n(x, y, z) * .4, n(x, y, z) * .5 + h(x, y))
  
   PSET (-100 + n(x, y, z) + m(x, y, z) * .6, m(x, y, z) * .5 + h(x, y))
   PSET (-100 - n(x, y, z) - m(x, y, z) * .6, -m(x, y, z) * .5 + h(x, y))
   PSET (-100 + m(x, y, z) - n(x, y, z) * .6, -n(x, y, z) * .5 + h(x, y))
   PSET (-100 - m(x, y, z) + n(x, y, z) * .6, n(x, y, z) * .5 + h(x, y))
  NEXT x
 NEXT y
 PCOPY 0, 1
NEXT z

FOR z = 0 TO 40
 CLS
 FOR y = 0 TO 20
  FOR x = 0 TO 20
   PSET (100 + n(x, y, z) + m(x, y, z) * .4, m(x, y, z) * .5 + h(x, y))
   PSET (100 - n(x, y, z) - m(x, y, z) * .4, -m(x, y, z) * .5 + h(x, y))
   PSET (100 + m(x, y, z) - n(x, y, z) * .4, -n(x, y, z) * .5 + h(x, y))
   PSET (100 - m(x, y, z) + n(x, y, z) * .4, n(x, y, z) * .5 + h(x, y))
  
   PSET (-100 + n(x, y, z) + m(x, y, z) * .6, m(x, y, z) * .5 + h(x, y))
   PSET (-100 - n(x, y, z) - m(x, y, z) * .6, -m(x, y, z) * .5 + h(x, y))
   PSET (-100 + m(x, y, z) - n(x, y, z) * .6, -n(x, y, z) * .5 + h(x, y))
   PSET (-100 - m(x, y, z) + n(x, y, z) * .6, n(x, y, z) * .5 + h(x, y))
  NEXT x
 NEXT y
 PCOPY 0, 1
NEXT z

