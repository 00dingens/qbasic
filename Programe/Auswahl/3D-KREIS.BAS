
'3D-Animation nach Augenmaá

SCREEN 7
DO
 FOR x = 1 TO 4 STEP .2
  CIRCLE (100, 100), (x - .2) ^ 3 / 5, 0
  CIRCLE (100, 100), x ^ 3 / 5
  FOR s = 1 TO 500: NEXT s
 NEXT x
CIRCLE (100, 100), (x - .2) ^ 3 / 5, 0
LOOP WHILE INKEY$ = ""

