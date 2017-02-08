
'Aufbau eines Salzkristalles

xx = 19: xy = -3
yx = 0: yy = 20
zx = 10: zy = 10
SCREEN 12
FOR z = 1 TO 10
 FOR y = 10 TO 1 STEP -1
  FOR x = 10 TO 1 STEP -1
   a = 10: b = 100
   a = a + xx * x + yx * y + zx * z
   b = b + xy * x + yy * y + zy * z
   IF (x + y + z) MOD 2 = 0 THEN
    CIRCLE (a, b), 14, 1
    PAINT (a, b), 12, 1
    CIRCLE (a, b), 14, 4
   ELSE
    CIRCLE (a, b), 7, 1
    PAINT (a, b), 10, 1
    CIRCLE (a, b), 7, 2
   END IF
   'PSET (a, b), 12
  NEXT x
 NEXT y
NEXT z

