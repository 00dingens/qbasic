RANDOMIZE TIMER
SCREEN 13
DO
 z = (RND * 100) + 50
 y = 100 + (RND - .5) * z: x = 160 + (RND - .5) * z
 FOR a = -15 TO 15
  FOR b = -15 TO 15
   n = x + a: m = y + b
   PSET (n, m), (POINT(n, m) + 1) MOD 256
  NEXT b
 NEXT a
LOOP WHILE INKEY$ = ""

FOR x = 0 TO 255
 FOR y = 0 TO 255
  PALETTE y, INT(((y + x) MOD 256) / 4)
 NEXT y
 IF INKEY$ <> "" THEN END
NEXT x

