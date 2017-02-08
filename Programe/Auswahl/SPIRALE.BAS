
'Konstruiert Spirale

SCREEN 12
p = 3.141592 / 8
FOR y = 1 TO 240 STEP 16
 FOR x = 0 TO 15
  CIRCLE (320, 240), y + x, x, x * p, (x + 1) * p
 NEXT x
NEXT y

