
'lÑsst angegebene Farbe in Schwarz und weiss Åbergehen

SCREEN 13
INPUT "Rot  (0-63):", r
INPUT "GrÅn (0-63):", g
INPUT "Blau (0-63):", b
CLS
FOR x = 0 TO 255
 n = 15 - x MOD 16: m = 15 - INT(x / 16)
 'PSET (n, m), x
 LINE (n * 20, m * 12)-STEP(18, 10), x, BF
NEXT x
FOR x = 0 TO 255
 n = x MOD 16: m = INT(x / 16)
 t = (r + (63 - r) / 16 * n) / 16 * m
 h = (g + (63 - g) / 16 * n) / 16 * m
 v = (b + (63 - b) / 16 * n) / 16 * m

 't = ((63 - r) / 16 * n)
 'h = ((63 - g) / 16 * n)
 'v = ((63 - b) / 16 * n)

 OUT &H3C8, x
 OUT &H3C9, INT(t)
 OUT &H3C9, INT(h)
 OUT &H3C9, INT(v)
NEXT x
SLEEP

