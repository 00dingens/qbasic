DIM a%(10000)
x = 690
SCREEN 13
FOR a = 1 TO 16
  CIRCLE (50, 100), 35 - a * 2, a + 15
  PAINT STEP(0, 0), a + 15, a + 15
NEXT a
GET (14, 64)-(86, 136), a%
PUT (100, 100), a%
CLS
FOR i = -120 TO 120 STEP .1
x = x + (i * .001)
PUT (i + 120, x - 570), a%, PSET
NEXT i

