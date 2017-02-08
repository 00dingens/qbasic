RANDOMIZE TIMER
SCREEN 7
DO
 FOR x = 1 TO 320
  PSET (x, 0), INT(RND * 2) * 15
  PSET (0, x), INT(RND * 2) * 15
 NEXT x
 FOR y = 1 TO 170
  FOR x = 1 TO 320
   IF POINT(x, y - 1) <> POINT(x - 1, y - 1) THEN c = 15: a = 0 ELSE c = 0: a = a + 1
   PSET (x, y), c
   IF a > r THEN r = a: LOCATE 23, 1: PRINT r
  NEXT x
  IF INKEY$ <> "" THEN END
 NEXT y
LOOP

