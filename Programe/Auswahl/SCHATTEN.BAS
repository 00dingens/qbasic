SCREEN 12
FOR x = 1 TO 15
 OUT &H3C8, x
 OUT &H3C9, x * 2 + 32
 OUT &H3C9, x * 2 + 32
 OUT &H3C9, x * 2 + 32
NEXT x
GOSUB Bildladen
a = 1: b = 1: c = -.3   'Schattenrichtung
FOR x = 1 TO 150
 FOR y = 1 TO 150
  n = x: M = y: o = POINT(x, y)
  DO
   n = n + a: M = M + b: o = o + c
   IF POINT(n, M) < o THEN PSET (n, M), 0
  LOOP UNTIL n < 0 OR n > 640 OR M < 0 OR M > 480 OR o < 0
 NEXT y
NEXT x

END
Bildladen:
PAINT (10, 10), 1

'M”gl. 1
'FOR x = 1 TO 5
' FOR y = 1 TO 5
'  LINE (x * 20, y * 20)-STEP(19, 19), INT(RND * 15 + 1), BF
' NEXT y
'NEXT x

'M”gl. 2
'LINE (10, 10)-(80, 80), 15, BF
'LINE (20, 20)-(50, 50), 10, BF

'M”gl. 3
'FOR x = 42 TO 0 STEP -3
'CIRCLE (50, 50), x, x / 3
'PAINT (50, 50), x / 3, x / 3
'NEXT x

'M”gl. 4
'FOR x = 42 TO 0 STEP -3
'CIRCLE (50, 50), x, 15 - x / 3
'PAINT (50, 50), 15 - x / 3, 15 - x / 3
'NEXT x

'M”gl. 5
FOR x = 42 TO 0 STEP -3
CIRCLE (65, 35), x / 2, 15 - x / 3
PAINT (65, 35), 15 - x / 3, 15 - x / 3
CIRCLE (50, 50), x, 15 - x / 3
PAINT (50, 50), 15 - x / 3, 15 - x / 3
NEXT x
RETURN

