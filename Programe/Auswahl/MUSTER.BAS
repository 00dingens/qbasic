SCREEN 12
FOR x = 0 TO 20
 a = a + x
 b = 0
 FOR y = 0 TO 20
  b = b + y
  LINE (a, b)-STEP(x, y), ((x + y) MOD 2) * 15, BF
 NEXT y
 FOR y = 19 TO 0 STEP -1
  b = b + y
  LINE (a, b)-STEP(x, y), ((x + y) MOD 2) * 15, BF
 NEXT y
NEXT x
FOR x = 19 TO 0 STEP -1
 a = a + x
 b = 0
 FOR y = 0 TO 20
  b = b + y
  LINE (a, b)-STEP(x, y), ((x + y) MOD 2) * 15, BF
 NEXT y
 FOR y = 19 TO 0 STEP -1
  b = b + y
  LINE (a, b)-STEP(x, y), ((x + y) MOD 2) * 15, BF
 NEXT y
NEXT x

