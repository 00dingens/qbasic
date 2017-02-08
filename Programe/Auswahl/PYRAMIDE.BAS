
'Sich drehende Pyramide
'mit Perspektive, durchsichtig

SCREEN 12
WINDOW (1, 1)-(320, 240)
DIM x(10000), y(10000)
eck = 400
rad = 30
win = 2 * 3.141593 / eck
FOR i = 0 TO eck - 1
 x(i) = rad * COS(i * win)
 y(i) = rad * SIN(i * win)
 x(i) = x(i) - (x(i) * y(i) * .01)
 x(i + eck) = x(i): y(i + eck) = y(i)
NEXT i
CLS
DO
 FOR i = 0 TO eck / 4 - 1
  LINE (160, 200)-((x(i) * 3) + 160, y(i) + 120)
  LINE -((x(i + 100) * 3) + 160, y(i + 100) + 120)
  LINE (160, 200)-((x(i + 100) * 3) + 160, y(i + 100) + 120)
  LINE -((x(i + 200) * 3) + 160, y(i + 200) + 120)
  LINE (160, 200)-((x(i + 200) * 3) + 160, y(i + 200) + 120)
  LINE -((x(i + 300) * 3) + 160, y(i + 300) + 120)
  LINE (160, 200)-((x(i + 300) * 3) + 160, y(i + 300) + 120)
  LINE -((x(i) * 3) + 160, y(i) + 120)
  FOR zz = 1 TO 100: NEXT zz        ''Geschwindigkeit
  LINE (160, 200)-((x(i) * 3) + 160, y(i) + 120), 0
  LINE -((x(i + 100) * 3) + 160, y(i + 100) + 120), 0
  LINE (160, 200)-((x(i + 100) * 3) + 160, y(i + 100) + 120), 0
  LINE -((x(i + 200) * 3) + 160, y(i + 200) + 120), 0
  LINE (160, 200)-((x(i + 200) * 3) + 160, y(i + 200) + 120), 0
  LINE -((x(i + 300) * 3) + 160, y(i + 300) + 120), 0
  LINE (160, 200)-((x(i + 300) * 3) + 160, y(i + 300) + 120), 0
  LINE -((x(i) * 3) + 160, y(i) + 120), 0
 NEXT i
LOOP WHILE INKEY$ = ""
END


