RANDOMIZE TIMER
SCREEN 9, , 1, 0
DIM x(4), y(4), z(4), a(4), b(4), c(4)
COLOR 1
n = 10: m = 10               'Anzahl der Felder horiz. und vert.
grenze = 1                   'Minimalgeschwindigkeit
r = 63: g = 0: b = 0         'Farbe
FOR q = 1 TO 4
 x(q) = INT(RND * 300): y(q) = INT(RND * 300 + 50): z(q) = INT(RND * 300)
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
 FOR q = 1 TO 4
  IF SGN(a(q)) * a(q) < grenze THEN a(q) = a(q) * 2
  IF SGN(b(q)) * b(q) < grenze THEN b(q) = b(q) * 2
  IF SGN(c(q)) * c(q) < grenze THEN c(q) = c(q) * 2
  x(q) = x(q) + a(q): y(q) = y(q) + b(q): z(q) = z(q) + c(q)
  IF x(q) < 1 OR x(q) > 298 THEN x(q) = x(q) - a(q): a(q) = -RND * SGN(a(q)) * 5
  IF y(q) < 48 OR y(q) > 348 THEN y(q) = y(q) - b(q): b(q) = -RND * SGN(b(q)) * 5
  IF z(q) < 1 OR z(q) > 298 THEN z(q) = z(q) - c(q): c(q) = -RND * SGN(c(q)) * 5
 NEXT q
 FOR q = 0 TO n
  LINE (x(1) + (x(2) - x(1)) * q / n + (z(1) + (z(2) - z(1)) * q / n) / 15, y(1) + (y(2) - y(1)) * q / n)-(x(3) + (x(4) - x(3)) * q / n + (z(3) + (z(4) - z(3)) * q / n) / 15, y(3) + (y(4) - y(3)) * q / n), 1
  LINE (340 + x(1) + (x(2) - x(1)) * q / n - (z(1) + (z(2) - z(1)) * q / n) / 15, y(1) + (y(2) - y(1)) * q / n)-(340 + x(3) + (x(4) - x(3)) * q / n - (z(3) + (z(4) - z(3)) * q / n) / 15, y(3) + (y(4) - y(3)) * q / n), 1
 NEXT q
 FOR q = 0 TO m
  LINE (x(1) + (x(3) - x(1)) * q / m + (z(1) + (z(3) - z(1)) * q / m) / 15, y(1) + (y(3) - y(1)) * q / m)-(x(2) + (x(4) - x(2)) * q / m + (z(2) + (z(4) - z(2)) * q / m) / 15, y(2) + (y(4) - y(2)) * q / m), 1
  LINE (340 + x(1) + (x(3) - x(1)) * q / m - (z(1) + (z(3) - z(1)) * q / m) / 15, y(1) + (y(3) - y(1)) * q / m)-(340 + x(2) + (x(4) - x(2)) * q / m - (z(2) + (z(4) - z(2)) * q / m) / 15, y(2) + (y(4) - y(2)) * q / m), 1
 NEXT q
 'Koordinaten Ausgeben
 LOCATE 1, 1: PRINT "x1 ="; CINT(x(1))
 LOCATE 1, 11: PRINT "x2 ="; CINT(x(2))
 LOCATE 1, 21: PRINT "x3 ="; CINT(x(3))
 LOCATE 1, 31: PRINT "x4 ="; CINT(x(4))
 LOCATE 1, 40: PRINT "³x1 ="; CINT(x(1))
 LOCATE 1, 51: PRINT "x2 ="; CINT(x(2))
 LOCATE 1, 61: PRINT "x3 ="; CINT(x(3))
 LOCATE 1, 71: PRINT "x4 ="; CINT(x(4))
 LOCATE 2, 1: PRINT "y1 ="; CINT(y(1))
 LOCATE 2, 11: PRINT "y2 ="; CINT(y(2))
 LOCATE 2, 21: PRINT "y3 ="; CINT(y(3))
 LOCATE 2, 31: PRINT "y4 ="; CINT(y(4))
 LOCATE 2, 40: PRINT "³y1 ="; CINT(y(1))
 LOCATE 2, 51: PRINT "y2 ="; CINT(y(2))
 LOCATE 2, 61: PRINT "y3 ="; CINT(y(3))
 LOCATE 2, 71: PRINT "y4 ="; CINT(y(4))
 LOCATE 3, 1: PRINT "z1 ="; CINT(z(1))
 LOCATE 3, 11: PRINT "z2 ="; CINT(z(2))
 LOCATE 3, 21: PRINT "z3 ="; CINT(z(3))
 LOCATE 3, 31: PRINT "z4 ="; CINT(z(4))
 LOCATE 3, 40: PRINT "³z1 ="; CINT(z(1))
 LOCATE 3, 51: PRINT "z2 ="; CINT(z(2))
 LOCATE 3, 61: PRINT "z3 ="; CINT(z(3))
 LOCATE 3, 71: PRINT "z4 ="; CINT(z(4))
 PCOPY 1, 0
 CLS
LOOP WHILE INKEY$ = ""

