
'Eine sich drehende Kugel

rad = 200: eck = 36        'Gr”sse, Genauigkeit
DIM x(eck * 2), y(eck * 2)
win = 2 * 3.141593 / (eck * 2)
FOR i = 0 TO eck * 2 - 1
 x(i) = COS(i * win)
 y(i) = SIN(i * win)
NEXT i
SCREEN 12
DO
 FOR h = 0 TO 3
  FOR i = 0 TO eck - 1 STEP 4
   r = y(i) * rad: y = 240 + x(i) * rad
   FOR z = 0 TO eck - 1
    IF z MOD 4 = h THEN PSET (320 + x(z) * r, y) ELSE PSET (320 + x(z) * r, y), 0
   NEXT z
  NEXT i
 NEXT h
LOOP WHILE INKEY$ = ""

