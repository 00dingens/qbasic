
'Flammen V1.0

SCREEN 13
DIM a(100)
r = 0: g = 0: b = 0
FOR x = 1 TO 164
IF x > 0 AND x < 64 THEN r = r + 1
IF x > 50 AND x < 114 THEN g = g + 1
IF x > 100 AND x < 164 THEN b = b + 1
OUT &H3C8, x
OUT &H3C9, r
OUT &H3C9, g
OUT &H3C9, b
LINE (0, x)-(320, x), x
NEXT x
GET (1, 0)-(1, 164), a
CLS
q = 15
FOR x = 1 TO 319
 q = q + RND * 4 - 2
 IF q < 1 THEN q = 2
 IF q > 35 THEN q = 34
 PUT (x, q), a, PSET
 LINE (x, q + 164)-(x, 200), 164
NEXT x
SLEEP

