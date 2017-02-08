
'Schablone (Kugel)

SCREEN 12
g = 8: b = 600 / g
w = 3.141592653# / 180
FOR x = 0 TO 180 STEP .5
 FOR y = 0 TO g - 1
  PSET (b * (y + .5) + 20 + SIN(x * w) * b / 2, x * 2 + 40)
  PSET (b * (y + .5) + 20 - SIN(x * w) * b / 2, x * 2 + 40)
 NEXT y
NEXT x
'CHAIN "c:\a\picture.bas"

