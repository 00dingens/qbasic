
'Beam-Lichteffekt

SCREEN 12
FOR x = 1 TO 60
CIRCLE (320, 240), 220 - x * 3.6, INT(x / 4 + 1), , , x / (61 - x)
NEXT x
FOR x = 1 TO 60
CIRCLE (320, 240), 220 - x * 3.6, 0, , , x / (61 - x)
NEXT x

