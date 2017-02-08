SCREEN 13
DO
 z = (RND * 100) + 50
 y = 100 + (RND - .5) * z: x = 160 + (RND - .5) * z
 PSET (x, y), (POINT(x, y) + 1) MOD 256
LOOP WHILE INKEY$ = ""

FOR x = 0 TO 255
 FOR y = 0 TO 255
  PALETTE y, INT(((y + x) MOD 256) / 4)
  IF INKEY$ <> "" THEN END
 NEXT y
NEXT x

