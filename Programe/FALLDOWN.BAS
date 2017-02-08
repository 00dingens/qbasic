SCREEN 7

xx = 50: yy = 50
FOR y = 0 TO yy
 FOR x = 0 TO xx
  IF RND < .1 THEN PSET (x, y), INT(RND * 25 + 1)
 NEXT x
NEXT y
DO: LOOP WHILE INKEY$ = ""
DO
FOR y = yy TO 0 STEP -1
 FOR x = 0 TO xx
  IF POINT(x, y) <> 0 AND POINT(x, y) <> 15 THEN
   c = POINT(x, y)
   IF POINT(x, y + 1) = 0 THEN
    PSET (x, y), 0
    PSET (x, y + 1), c
   ELSE
    IF POINT(x + 1, y) = 0 AND POINT(x + 1, y + 1) = 0 THEN
     PSET (x, y), 0
     PSET (x + 1, y + 1), c
     GOTO wer
    END IF
    IF POINT(x - 1, y) = 0 AND POINT(x - 1, y + 1) = 0 THEN
     PSET (x, y), 0
     PSET (x - 1, y + 1), c
    END IF
wer:
   END IF
  END IF
 NEXT x
NEXT y
LOOP WHILE INKEY$ = ""

