
'™ffnet eine Bitmap

name$ = "c:\eigene~1\rafael\magisch\muster.bmp"
SCREEN 13
FOR x = 1 TO 255
 LINE (x, 0)-(x, 200), x
NEXT x
FOR r = 0 TO 5
 FOR g = 0 TO 5
  FOR b = 0 TO 5
   OUT &H3C8, r * 36 + g * 6 + b
   OUT &H3C9, r * 10
   OUT &H3C9, g * 10
   OUT &H3C9, b * 10
  NEXT b
 NEXT g
NEXT r
FOR x = 1 TO 40
 OUT &H3C8, x + 215
 OUT &H3C9, INT(x * 1.5 + 3)
 OUT &H3C9, INT(x * 1.5 + 3)
 OUT &H3C9, INT(x * 1.5 + 3)
NEXT x

OPEN name$ FOR BINARY AS #1
DIM z(2) AS INTEGER, q(1) AS STRING * 3
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
FOR y = 1 TO z(2)
 FOR x = 1 TO z(1)
  GET #1, a, q(1)
  r = INT(ASC(MID$(q(1), 3, 1)) / 43)
  g = INT(ASC(MID$(q(1), 2, 1)) / 43)
  b = INT(ASC(MID$(q(1), 1, 1)) / 43)
  f = r * 36 + g * 6 + b
  IF r = g AND g = b THEN f = INT(ASC(MID$(q(1), 1, 1)) / 6.54 + 216)
  PSET (x, z(2) - y), f
  a = a + 3
 NEXT x
 'a = a + 2
NEXT y
CLOSE


