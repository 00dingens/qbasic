
'Lichteffekte V1.0

SCREEN 13
FOR a = 1 TO 16
  CIRCLE (50, 100), 20 - a, a + 15
  PAINT STEP(0, 0), a + 15, a + 15
  CIRCLE (100, 100), 40 - a * 2, a + 15
  PAINT STEP(0, 0), a + 15, a + 15
  CIRCLE (180, 100), 60 - a * 3, a + 15
  PAINT STEP(0, 0), a + 15, a + 15
  CIRCLE (250, 100), 80 - a * 4, a + 15
  PAINT STEP(0, 0), a + 15, a + 15
NEXT a
DO: LOOP WHILE INKEY$ = ""
CLS
FOR x = 0 TO 63
  OUT &H3C8, x
  OUT &H3C9, x
  OUT &H3C9, x
  OUT &H3C9, x
  CIRCLE (160, 100), 70 - x, x
  PAINT STEP(0, 0), x, x
NEXT x

