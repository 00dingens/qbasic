RANDOMIZE TIMER
SCREEN 12
'PALETTE 15, 0
z = 3.141592 / 2
q = 20
FOR x = 0 TO 640 STEP q
 FOR y = 0 TO 480 STEP q
  SELECT CASE INT(RND * 2)
  CASE 0
   CIRCLE (x, y), q / 2, , z * 3, z * 4
   CIRCLE (x + q, y + q), q / 2, , z, z * 2
  CASE 1
   CIRCLE (x, y + q), q / 2, , 0, z
   CIRCLE (x + q, y), q / 2, , z * 2, z * 3
  END SELECT
  'LINE (x, y)-STEP(q - 1, q - 1), 1, B
 NEXT y
NEXT x
FOR x = 0 TO 640 STEP q
 FOR y = 0 TO 480 STEP q
  IF POINT(x, y) = 0 THEN PAINT (x, y), INT(RND * 15 + 1), 15
 NEXT y
NEXT x
DO: LOOP WHILE INKEY$ = ""

