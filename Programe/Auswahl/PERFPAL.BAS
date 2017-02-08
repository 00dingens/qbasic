
'Beste Palette

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

