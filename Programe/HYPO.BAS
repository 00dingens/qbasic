
'Hypnotisiert dich

SCREEN 12
PRINT "Schaue ca. 2 Minuten auf die Mitte des Bildes!!"
INPUT "Wartezeit zwischen den Bildern (0-5000) zB. 2000 "; w
PRINT "P.S. Rumprobieren schadet nicht!"
INPUT "Sollen sich die Ringe nach innen(0) oder nach aussen(1) bewegen"; i
FOR z = 1 TO 14
 IF i = 1 THEN
 FOR x = 15 TO 0 STEP -1
  CIRCLE (320, 240), 480 - 32 + x * 2 - z * 32, x
  PAINT (320, 240), x, x
 NEXT x
 ELSE
 FOR x = 0 TO 15
  CIRCLE (320, 240), 480 - x * 2 - z * 32, x
  PAINT (320, 240), x, x
 NEXT x
 END IF
NEXT z
DO
 WAIT &H3DA, 8
 FOR x = 0 TO 15
  OUT &H3C8, x
  OUT &H3C9, 63
  OUT &H3C9, 63
  OUT &H3C9, 63
  OUT &H3C8, (x + 15) MOD 16
  OUT &H3C9, 0
  OUT &H3C9, 0
  OUT &H3C9, 0
  FOR y = 1 TO w: NEXT y
 NEXT x
LOOP WHILE INKEY$ = ""

