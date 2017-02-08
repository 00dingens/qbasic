
'verkleinert ein Bild

SCREEN 13
gx = 5         'grobheit x
gy = 5         'grobheit y       bedingung:   gx * gy < 43
GOSUB malen
e = -1
FOR x = 0 TO 63
 OUT &H3C8, 100 + x
 OUT &H3C9, x
 OUT &H3C9, x
 OUT &H3C9, x '* INT(64 / (gx * gy)) - 1
NEXT x
FOR x = 0 TO 100 STEP gx
 FOR y = 0 TO 100 STEP gy
  q% = 0
  FOR a = 1 TO gx
   FOR b = 1 TO gy
    q% = q% + POINT(x + a, y + b)
   NEXT b
  NEXT a  '+161
  LINE (x + 1, y + 1)-STEP(gx - 1, gy - 1), 100 + q%, BF
  PSET (x / gx + 120, 120 + y / gy), 100 + q%
 NEXT y
NEXT x
SLEEP
END

malen:                     'hier kann auch etwas anderes gemalt werden
c = 64 / (gx * gy) - 1
OUT &H3C8, c
OUT &H3C9, 50
OUT &H3C9, 50
OUT &H3C9, 50
CIRCLE (50, 50), 40, c
PAINT (50, 50), c, c
CIRCLE (50, 50), 26, 0
PAINT (50, 50), 0, 0
CIRCLE (10, 90), 7, c
PAINT (10, 90), c, c
CIRCLE (90, 10), 7, c
PAINT (90, 10), c, c
LINE (86, 5)-(5, 86), c
LINE (95, 14)-(14, 95), c
PAINT (50, 50), c, c
PAINT (80, 20), c, c
PAINT (20, 80), c, c
'LOCATE 4, 2
'COLOR c
'PRINT "HALLO"
RETURN

