RANDOMIZE TIMER
SCREEN 9, , 1, 0
DIM x(4), y(4), a(4), b(4)
n = 10: m = 10              'Anzahl der Felder horiz. und vert.
grenze = .2                 'Minimalgeschwindigkeit
r = 63: g = 0: b = 0         'Farbe
FOR q = 1 TO 4
 x(q) = INT(RND * 640): y(q) = INT(RND * 350)
 a(q) = 4 * RND - 2: b(q) = 4 * RND - 2
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

 FOR q = 1 TO 4
  IF SGN(a(q)) * a(q) < grenze THEN a(q) = a(q) * 2
  IF SGN(b(q)) * b(q) < grenze THEN b(q) = b(q) * 2
  x(q) = x(q) + a(q): y(q) = y(q) + b(q)
  IF x(q) < 1 OR x(q) > 638 THEN x(q) = x(q) - a(q): a(q) = -RND * SGN(a(q)) * 2
  IF y(q) < 1 OR y(q) > 348 THEN y(q) = y(q) - b(q): b(q) = -RND * SGN(b(q)) * 2
  PSET (x(q), y(q))
 NEXT q
 FOR q = 0 TO n
  LINE (x(1) + (x(2) - x(1)) * q / n, y(1) + (y(2) - y(1)) * q / n)-(x(3) + (x(4) - x(3)) * q / n, y(3) + (y(4) - y(3)) * q / n), 1
 NEXT q
 FOR q = 0 TO m
  LINE (x(1) + (x(3) - x(1)) * q / m, y(1) + (y(3) - y(1)) * q / m)-(x(2) + (x(4) - x(2)) * q / m, y(2) + (y(4) - y(2)) * q / m), 1
 NEXT q
 PCOPY 1, 0
 CLS
LOOP WHILE INKEY$ = ""

