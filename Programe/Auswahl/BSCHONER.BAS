
'Bildschirmschoner

RANDOMIZE TIMER
SCREEN 13
DO
 x = INT(RND * 320): y = INT(RND * 200)
 FOR a = 0 TO 63
  IF x MOD 2 = 1 THEN PALETTE a, a ELSE PALETTE a, 63 - a
  CIRCLE (x, y), 64 - a, a
  PAINT (x, y), a, a
 NEXT a
 IF x MOD 2 = 1 THEN PALETTE 0, 63: PALETTE 63, 0 ELSE PALETTE 0, 0: PALETTE 63, 63
LOOP WHILE INKEY$ = ""

