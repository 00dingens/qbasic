SCREEN 13
DIM a(100)
r = 0: g = 0: b = 0
FOR x = 1 TO 255
 IF x < 9 THEN b = b + 2
 IF x > 8 AND x < 17 THEN b = b - 2
 IF x > 8 AND x < 30 THEN r = r + 3
 IF x > 29 AND x < 51 THEN g = g + 3
 IF x > 50 AND x < 72 THEN b = b + 3
 OUT &H3C8, x
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
NEXT x

PAINT (1, 1), 1
DO
 FOR y = 100 TO 198
  FOR x = 1 TO 118
   f = INT((1 + POINT(x - 1, y - 1) + POINT(x, y - 1) + POINT(x + 1, y - 1) + POINT(x - 1, y) + POINT(x + 1, y) + POINT(x - 1, y + 1) + POINT(x, y + 1) + POINT(x + 1, y + 1)) / 8)
   IF f > 0 THEN f = f - 1
   PSET (x, y - 1), f
  NEXT x
 NEXT y
 FOR y = 197 TO 199
  FOR x = 0 TO 319
   PSET (x, y), INT(RND * 15 + 64)
  NEXT x
 NEXT y
 FOR x = 0 TO INT(RND * 45)
  y = INT(RND * 320)
  LINE (y - 1, 197)-(y + 1, 199), 255, BF
 NEXT x
LOOP WHILE INKEY$ = ""
SLEEP

