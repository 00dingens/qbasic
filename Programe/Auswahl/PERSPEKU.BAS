
'Perspektivischer Gang

SCREEN 12
WINDOW (-320, -240)-(319, 239)
q = 50
FOR z = 0 + q TO 1000 + q STEP 100
 FOR a = -1 TO 1 STEP 2
  FOR b = -1 TO 1 STEP 2
   x = 400 * a: y = 400 * b
   LINE (x / z * q, y / z * q)-(x / (z + 25) * q, y / (z + 25) * q), 15
  NEXT b
 NEXT a
NEXT z

