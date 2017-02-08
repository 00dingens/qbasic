RANDOMIZE TIMER
SCREEN 9, , 1, 0
DIM x(6), y(6), a(6), b(6)
n = 20                      'Anzahl der Felder horiz. und vert.
grenze = .2                 'Minimalgeschwindigkeit
r = 63: g = 0: b = 0        'Farbe

FOR ee = 3 TO 7
 FOR q = 0 TO ee - 1
  x(q) = INT(RND * 640): y(q) = INT(RND * 350)
  a(q) = 4 * RND - 2: b(q) = 4 * RND - 2
 NEXT q
 IF ee = 7 AND kk = 0 THEN
  x(0) = 220: y(0) = 30: x(1) = 80: y(1) = 100: x(2) = 50: y(2) = 240: x(3) = 230: y(3) = 330: x(4) = 500: y(4) = 330: x(5) = 600: y(5) = 250: x(6) = 520: y(6) = 90: kk = 1
  FOR q = 0 TO ee - 1: a(q) = 0: b(q) = 0: NEXT q
 END IF
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
  FOR q = 0 TO ee - 1
   IF SGN(a(q)) * a(q) < grenze THEN a(q) = a(q) * 2
   IF SGN(b(q)) * b(q) < grenze THEN b(q) = b(q) * 2
   x(q) = x(q) + a(q): y(q) = y(q) + b(q)
   IF x(q) < 1 OR x(q) > 638 THEN x(q) = x(q) - a(q): a(q) = -RND * SGN(a(q)) * 2
   IF y(q) < 1 OR y(q) > 348 THEN y(q) = y(q) - b(q): b(q) = -RND * SGN(b(q)) * 2
   PSET (x(q), y(q))
  NEXT q
  FOR ww = 0 TO ee - 1
   FOR q = 0 TO n
    LINE (x(ww) + (x((ww + 1) MOD ee) - x(ww)) * (n - q) / n, y(ww) + (y((ww + 1) MOD ee) - y(ww)) * (n - q) / n)-(x((ww + 2) MOD ee) + (x((ww + 3) MOD ee) - x((ww + 2) MOD ee)) * q / n, y((ww + 2) MOD ee) + (y((ww + 3) MOD ee) - y((ww + 2) MOD ee)) * q / n), 1
    IF ee MOD 2 = 1 THEN LINE (x(ww) + (x((ww + 1) MOD ee) - x(ww)) * (n - q) / n, y(ww) + (y((ww + 1) MOD ee) - y(ww)) * (n - q) / n)-(x((ww + 1) MOD ee) + (x((ww + 2) MOD ee) - x((ww + 1) MOD ee)) * q / n, y((ww + 1) MOD ee) + (y((ww + 2) MOD ee) - y((ww + 1) MOD ee)) * q / n), 1
   NEXT q
  NEXT ww
  PCOPY 1, 0
  CLS
  t$ = INKEY$
  IF t$ = " " THEN ee = ee - 1: EXIT DO
  IF t$ = CHR$(13) THEN EXIT DO
  IF t$ = CHR$(27) THEN END
 LOOP
NEXT ee

