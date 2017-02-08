SCREEN 13
FOR x = 1 TO 63
OUT &H3C8, x
OUT &H3C9, x * 4
OUT &H3C9, x * 4
OUT &H3C9, x * 4
NEXT x
n = 15
w = 3.14159265358979# / (2 ^ n) * 2
FOR x = 1 TO n - 2
 FOR y = 0 TO 2 ^ n STEP 2 ^ x
  LINE (160, 100)-STEP(SIN(y * w) * (130 - x * 8), COS(y * w) * (130 - x * 8)), x
 NEXT y
NEXT x

