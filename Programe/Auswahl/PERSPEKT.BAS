
'Perspektivischer Gang

SCREEN 12
WINDOW (-320, -240)-(319, 239)
q = 100
FOR z = 0 TO 1000 STEP 100
   x1 = -400: y1 = -400: x2 = 400: y2 = 400
   LINE (x1 / (z + q) * q, y1 / (z + q) * q)-(x2 / (z + q) * q, y1 / (z + q) * q)
   LINE (x1 / (z + q) * q, y1 / (z + q) * q)-(x1 / (z + q) * q, y2 / (z + q) * q)
   LINE (x2 / (z + q) * q, y2 / (z + q) * q)-(x1 / (z + q) * q, y2 / (z + q) * q)
   LINE (x2 / (z + q) * q, y2 / (z + q) * q)-(x2 / (z + q) * q, y1 / (z + q) * q)
NEXT z

