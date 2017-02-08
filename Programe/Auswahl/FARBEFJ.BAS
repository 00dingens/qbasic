SCREEN 13
DIM q(32), a%(32700)
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

FOR x = 1 TO 128 STEP 32
 FOR y = 0 TO 15
  CIRCLE (128, 100), 128 - x - y, y
  PAINT STEP(0, 0), y, y
 NEXT y
 FOR y = 0 TO 15
  CIRCLE (128, 100), 128 - x - y - 16, 15 - y
  PAINT STEP(0, 0), 15 - y, 15 - y
 NEXT y
NEXT x
GET (0, 0)-(256, 199), a%
CLS
FOR x = 1 TO 128 STEP 32
 FOR y = 0 TO 15
  CIRCLE (192, 100), 128 - x - y, y * 16
  PAINT STEP(0, 0), y * 16, y * 16
 NEXT y
 FOR y = 0 TO 15
  CIRCLE (192, 100), 128 - x - y - 16, (15 - y) * 16
  PAINT STEP(0, 0), (15 - y) * 16, (15 - y) * 16
 NEXT y
NEXT x
PUT (0, 0), a%

