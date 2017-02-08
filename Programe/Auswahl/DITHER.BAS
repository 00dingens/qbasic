
'Rastert das Gemalte

SCREEN 12
FOR x = 1 TO 640 STEP 20
 FOR y = 1 TO 480 STEP 20
  LINE (x, y)-STEP(18, 18), INT(RND * 16), BF
 NEXT y
NEXT x
a = 2
b = 20
FOR x = 1 TO 640
 FOR y = 1 TO 480
  PSET (x, y), POINT(x + INT(RND * a), y + INT(RND * b))
 NEXT y
NEXT x
DO: LOOP WHILE INKEY$ = ""

