
'Eine Ecke mehr mit Enter, neu aufsetzen mit Space, Ende mit Escape.

RANDOMIZE TIMER
SCREEN 9, , 1, 0
DIM x(100), y(100), a(100), b(100)
n = 20                      'Anzahl der Felder horiz. und vert.
grenze = .2                 'Minimalgeschwindigkeit
r = 63: g = 0: b = 0        'Farbe

FOR ee = 1 TO 100
 FOR q = 0 TO ee - 1
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
  FOR q = 0 TO ee - 1
   IF SGN(a(q)) * a(q) < grenze THEN a(q) = a(q) * 2
   IF SGN(b(q)) * b(q) < grenze THEN b(q) = b(q) * 2
   x(q) = x(q) + a(q): y(q) = y(q) + b(q)
   IF x(q) < 1 OR x(q) > 638 THEN x(q) = x(q) - a(q): a(q) = -RND * SGN(a(q)) * 2
   IF y(q) < 1 OR y(q) > 348 THEN y(q) = y(q) - b(q): b(q) = -RND * SGN(b(q)) * 2
   PSET (x(q), y(q))
  NEXT q
  FOR ww = 0 TO ee - 1
   FOR q = ww TO ee - 1
    LINE (x(ww), y(ww))-(x(q), y(q)), 1
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

