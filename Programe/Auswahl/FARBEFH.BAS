
'Lichteffekt

SCREEN 13
DIM q(32)
FOR x = 0 TO 16
 q(x) = 15 + 16 * COS(x * (2 * 3.141592 / 32))
' PSET (x, q(x))
NEXT x
FOR x = 0 TO 255
 OUT &H3C8, x
 OUT &H3C9, q(x MOD 16) + q(INT(x / 16))
 OUT &H3C9, q(x MOD 16) + q(INT(x / 16))
 OUT &H3C9, q(x MOD 16) + q(INT(x / 16))
 PSET (x MOD 16, INT(x / 16)), x
NEXT x
 OUT &H3C8, 255
 OUT &H3C9, 0
 OUT &H3C9, 0
 OUT &H3C9, 0
SLEEP
FOR x = 1 TO 320 STEP 32
 FOR y = 1 TO 200 STEP 32
  FOR a = 0 TO 15
   FOR b = 0 TO 15
    PSET (x + a, y + b), a * 16 + b
    PSET (x + 31 - a, y + b), a * 16 + b
    PSET (x + a, y + 31 - b), a * 16 + b
    PSET (x + 31 - a, y + 31 - b), a * 16 + b
   NEXT b
  NEXT a
 NEXT y
NEXT x

