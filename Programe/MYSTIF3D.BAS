RANDOMIZE TIMER
e = 4              'Anzahl der Ecken
SCREEN 12
DIM x(e), y(e), z(e), a(e), b(e), c(e)
grenze = 1                 'Minimalgeschwindigkeit
r = 63: g = 0: b = 0         'Farbe
FOR q = 0 TO e - 1
 x(q) = INT(RND * 300): y(q) = INT(RND * 350): z(q) = INT(RND * 300)
 a(q) = 10 * RND - 5: b(q) = 10 * RND - 5: c(q) = 10 * RND - 5
NEXT q
DO
 IF r = 63 AND g <> 63 AND b = 0 THEN g = g + 1
 IF r <> 0 AND g = 63 AND b = 0 THEN r = r - 1
 IF r = 0 AND g = 63 AND b <> 63 THEN b = b + 1
 IF r = 0 AND g <> 0 AND b = 63 THEN g = g - 1
 IF r <> 63 AND g = 0 AND b = 63 THEN r = r + 1
 IF r = 63 AND g = 0 AND b <> 0 THEN b = b - 1
 OUT &H3C8, 0
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
 OUT &H3C8, 1
 OUT &H3C9, 63 - r
 OUT &H3C9, 63 - g
 OUT &H3C9, 63 - b
 FOR q = 0 TO e - 1
  IF SGN(a(q)) * a(q) < grenze THEN a(q) = a(q) * 2
  IF SGN(b(q)) * b(q) < grenze THEN b(q) = b(q) * 2
  IF SGN(c(q)) * c(q) < grenze THEN c(q) = c(q) * 2
  x(q) = x(q) + a(q): y(q) = y(q) + b(q): z(q) = z(q) + c(q)
  IF x(q) < 1 OR x(q) > 298 THEN x(q) = x(q) - a(q): a(q) = -RND * SGN(a(q)) * 5
  IF y(q) < 1 OR y(q) > 348 THEN y(q) = y(q) - b(q): b(q) = -RND * SGN(b(q)) * 5
  IF z(q) < 1 OR z(q) > 298 THEN z(q) = z(q) - c(q): c(q) = -RND * SGN(c(q)) * 5
 NEXT q
 FOR q = 0 TO e - 1
  LINE (x(q) + z(q) / 15, y(q))-(x((q + 1) MOD e) + z((q + 1) MOD e) / 15, y((q + 1) MOD e)), 1
  LINE (320 + x(q) - z(q) / 15, y(q))-(320 + x((q + 1) MOD e) - z((q + 1) MOD e) / 15, y((q + 1) MOD e)), 1
 NEXT q
 FOR s = 1 TO 10000: NEXT s
 CLS
LOOP WHILE INKEY$ = ""

