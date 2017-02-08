g = 15: l = 4    'g = Radius (max 15)
DIM e(-g TO g, -g TO g, -g TO g) AS INTEGER
FOR x = 0 TO g
 FOR y = 0 TO g
  FOR z = 0 TO g
   n = INT(SQR(x ^ 2 + y ^ 2 + z ^ 2))
   e(x, y, z) = n
   e(x, y, -z) = n
   e(x, -y, z) = n
   e(x, -y, -z) = n
   e(-x, y, z) = n
   e(-x, y, -z) = n
   e(-x, -y, z) = n
   e(-x, -y, -z) = n
  NEXT z
 NEXT y
NEXT x
SCREEN 12
FOR z = g TO -g STEP -1
 FOR y = -g TO g
  FOR x = -g TO g
   IF e(x, y, z) < g + 1 AND e(x, y, z) > g - 1 THEN
    LINE (320 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(10, 0), 15
    LINE (320 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(0, 10), 15
    LINE (320 + l + x * 10 + z * l, 250 + l + y * 10 + z * l)-STEP(10, 0), 15
    LINE (330 + l + x * 10 + z * l, 240 + l + y * 10 + z * l)-STEP(0, 10), 15
    LINE (330 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(l, l), 15
    LINE (320 + x * 10 + z * l, 250 + y * 10 + z * l)-STEP(l, l), 15
    PAINT (325 + x * 10 + z * l, 245 + y * 10 + z * l), 15, 15
   
    LINE (320 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(10, 0), 2
    LINE (320 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(0, 10), 2
    LINE (320 + l + x * 10 + z * l, 250 + l + y * 10 + z * l)-STEP(10, 0), 2
    LINE (330 + l + x * 10 + z * l, 240 + l + y * 10 + z * l)-STEP(0, 10), 2
    LINE (330 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(l, l), 2
    LINE (320 + x * 10 + z * l, 250 + y * 10 + z * l)-STEP(l, l), 2
    PAINT (325 + x * 10 + z * l, 245 + y * 10 + z * l), 2, 2
   
    LINE (320 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(10, 10), 10, B
    LINE (330 + x * 10 + z * l, 240 + y * 10 + z * l)-STEP(l, l), 10
    LINE (320 + x * 10 + z * l, 250 + y * 10 + z * l)-STEP(l, l), 10
    LINE (330 + x * 10 + z * l, 250 + y * 10 + z * l)-STEP(l, l), 10
    LINE (320 + l + x * 10 + z * l, 250 + l + y * 10 + z * l)-STEP(10, 0), 10
    LINE (330 + l + x * 10 + z * l, 240 + l + y * 10 + z * l)-STEP(0, 10), 10
    'LINE (320 + x * 10 + z * l, 240 + y * 10 - z * l)-STEP(10, 10), 10, B
    m = m + 1
   END IF
   NEXT x
 NEXT y
NEXT z
PRINT m

