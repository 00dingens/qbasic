SCREEN 7, , 1, 0
q = 500
DIM a(q), B(q)
w = 2 * 3.1415926# / q
FOR x = 0 TO q - 1
 a(x) = SIN(w * x) * 50
 B(x) = COS(w * x) * 50
NEXT x
CIRCLE (160, 100), 53, 7, , , 1
PAINT (160, 100), 7, 7
LINE (112, 52)-(208, 148), 7, BF
CIRCLE (160, 100), 52, 0, , , 1
PAINT (160, 100), 0, 0
LINE (113, 53)-(207, 147), 0, BF
DO
 FOR x = 0 TO q - 1
  LINE (160, 100)-STEP(a((x + q - 1) MOD q), B((x + q - 1) MOD q)), 0
  LINE (160, 100)-STEP(a(x), B(x))
  PCOPY 1, 0
  IF INKEY$ <> "" THEN END
 NEXT x
LOOP

