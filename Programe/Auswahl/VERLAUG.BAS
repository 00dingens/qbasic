
'l„sst Farbe in Schwarz und weiss bergehen

RANDOMIZE TIMER
SCREEN 13
r = INT(RND * 64)
g = INT(RND * 64)
b = INT(RND * 64)
z = RND * 2 - 1
j = RND * 2 - 1
c = RND * 2 - 1
CLS
'PAINT (1, 1), 240
FOR x = 0 TO 255
 n = 15 - x MOD 16: m = 15 - INT(x / 16)
 'PSET (n, m), x
 LINE (n * 20, m * 12)-STEP(18, 10), x, BF
NEXT x
DO
 IF r + z > 63 THEN z = -RND
 IF r + z < 0 THEN z = RND
 IF g + j > 63 THEN j = -RND
 IF g + j < 0 THEN j = RND
 IF b + c > 63 THEN c = -RND
 IF b + c < 0 THEN c = RND
 r = r + z: g = g + j: b = b + c
 FOR x = 0 TO 255
  n = x MOD 16: m = INT(x / 16)
  t = (r + (63 - r) / 16 * n) / 16 * m
  h = (g + (63 - g) / 16 * n) / 16 * m
  v = (b + (63 - b) / 16 * n) / 16 * m
  OUT &H3C8, x
  OUT &H3C9, INT(t)
  OUT &H3C9, INT(h)
  OUT &H3C9, INT(v)
 NEXT x
LOOP WHILE INKEY$ = ""
DO: LOOP WHILE INKEY$ = ""

