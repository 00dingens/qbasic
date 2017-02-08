
'Muster

RANDOMIZE TIMER
SCREEN 12
z = .4
q = 20
FOR x = 0 TO 640 STEP q
 FOR y = 0 TO 480 STEP q
  LINE (x, y)-STEP(q, q), 8, B
  IF RND < z THEN PSET (x, y + q / 2), 0
  IF RND < z THEN PSET (x + q / 2, y), 0
 NEXT y
NEXT x
FOR x = q / 2 TO 640 STEP q
 FOR y = q / 2 TO 480 STEP q
  IF POINT(x, y) = 0 THEN PAINT (x, y), INT(RND * 15 + 1), 8
 NEXT y
NEXT x
DO: LOOP WHILE INKEY$ = ""

