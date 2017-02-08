'das alte nur halt mit mehr farben.

c = 4

SCREEN 13
RANDOMIZE TIMER
DO
 FOR x = 0 TO 320 STEP 2
  LINE (x, 0)-(x + 1, 1), INT(RND * c), BF
 NEXT x
 FOR y = 2 TO 200 STEP 2
  shift = INT(y / 2) MOD 2
  FOR x = (shift + 2) TO 317 STEP 2
   farbe = (POINT(x, y - 1) + POINT(x + 1, y - 1)) MOD c
   LINE (x, y)-(x + 1, y + 1), farbe, BF
  NEXT x
  LINE (shift, y)-(shift + 1, y + 1), POINT(316 + shift, y), BF
  LINE (318 + shift, y)-(shift + 319, y + 1), POINT(2 + shift, y), BF
 NEXT y
 
 DO: LOOP WHILE INKEY$ = ""
LOOP UNTIL INKEY$ <> ""

