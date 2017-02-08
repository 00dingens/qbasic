RANDOMIZE TIMER
SCREEN 13
FOR x = 1 TO 15
 OUT &H3C8, x
 OUT &H3C9, x * 4
 OUT &H3C9, x * 3
 OUT &H3C9, x
NEXT x
DIM z(10000)
l = 30: h = 18
FOR x = 1 TO l
 FOR y = 1 TO 3
  PSET (x, y + h), INT(RND * 5) + 8
  IF RND < .3 THEN PSET (x, y + h), 15
 NEXT y
NEXT x
DO
 GET (1, 1)-(2, h + 3), z
 PUT (0, 100), z, PSET
 GET (1, 1)-(l, h + 3), z
 PUT (1, 0), z, PSET
 PUT (l, 100), z, PSET
 PUT (l * 2, 100), z, PSET
 PUT (0, 100), z, PSET
 FOR y = 1 TO h
  FOR x = 1 TO l
   q = FIX((POINT(x - 1, y + 101) + POINT(x, y + 101) + POINT(x + 1, y + 101) + POINT(x - 1, y + 100) + POINT(x, y + 100) + POINT(x + 1, y + 100)) / 6)
   'q = FIX((POINT(x - 1, y + 101) + POINT(x, y + 101) + POINT(x + 1, y + 101) + POINT(x - 1, y + 100) + POINT(x, y + 100) + POINT(x + 1, y + 100) + POINT(x - 1, y + 102) + POINT(x, y + 102) + POINT(x + 1, y + 102)) / 9)
   IF q > 0 THEN q = q - 1
   PSET (x, y), q
  NEXT x
 NEXT y
 FOR x = 1 TO l
  FOR y = 1 TO 3
   PSET (x, y + h), INT(RND * 5) + 8
   IF RND < .3 THEN PSET (x, y + h), 15
  NEXT y
 NEXT x
LOOP WHILE INKEY$ = ""

