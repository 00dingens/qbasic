
' "Hypnotisiert" dich!

SCREEN 12
PRINT "Schaue ca. 2 Minuten auf die Mitte des Bildes, dann woanders hin!!"
INPUT "Wartezeit zwischen den Bildern (0-5000, z.B. 2000)"; w
PRINT "P.S. Rumprobieren schadet nicht! Finde den Wert, bei dem es nicht flimmert!"
INPUT "Art des Musters (0-4)"; art
INPUT "Soll sich das Muster nach innen(0) oder nach aussen(1) bewegen"; i
SELECT CASE art
CASE 0
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
CASE 1
 FOR z = 0 TO 19
  IF i = 1 THEN
   FOR x = 0 TO 15
    LINE (z * 16 + 16 - x, 0)-(z * 16 + 16 - x, 480), x
    LINE (640 - z * 16 - 16 + x, 0)-(640 - z * 16 - 16 + x, 480), x
   NEXT x
  ELSE
   FOR x = 0 TO 15
    LINE (z * 16 + x, 0)-(z * 16 + x, 480), x
    LINE (640 - z * 16 - x, 0)-(640 - z * 16 - x, 480), x
   NEXT x
  END IF
 NEXT z
CASE 2
 FOR z = 0 TO 14
  IF i = 1 THEN
   FOR x = 0 TO 15
    LINE (0, z * 16 + 16 - x)-(640, z * 16 + 16 - x), x
    LINE (0, 480 - z * 16 - 16 + x)-(640, 480 - z * 16 - 16 + x), x
   NEXT x
  ELSE
   FOR x = 0 TO 15
    LINE (0, z * 16 + x)-(640, z * 16 + x), x
    LINE (0, 480 - z * 16 - x)-(640, 480 - z * 16 - x), x
   NEXT x
  END IF
 NEXT z
CASE 3
 FOR z = 0 TO 34
  IF i = 1 THEN
   FOR x = 0 TO 15
    LINE (-240 + z * 16 + x, 240)-(320, -320 + z * 16 + x), x
    LINE (320 + z * 16 + x, 240)-(320, 240 - z * 16 - x), x
    LINE (320 - z * 16 - x, 240)-(320, 240 + z * 16 + x), x
    LINE (880 - z * 16 - x, 240)-(320, 800 - z * 16 - x), x
   NEXT x
  ELSE
   FOR x = 0 TO 15
    LINE (-240 + z * 16 + x, 240)-(320, -320 + z * 16 + x), 15 - x
    LINE (320 + z * 16 + x, 240)-(320, 240 - z * 16 - x), 15 - x
    LINE (320 - z * 16 - x, 240)-(320, 240 + z * 16 + x), 15 - x
    LINE (880 - z * 16 - x, 240)-(320, 800 - z * 16 - x), 15 - x
   NEXT x
  END IF
 NEXT z
CASE 4
 FOR z = 0 TO 40
  IF i = 0 THEN
   FOR x = 0 TO 15
    LINE (0 + z * 16 + x, 240)-(320 + z * 16 + x, -80), x
    LINE (640 - z * 16 - x, 240)-(320 - z * 16 - x, 560), x
    LINE (320, -80 + z * 16 + x)-(640, 240 + z * 16 + x), x
    LINE (0, 240 - z * 16 - x)-(320, 560 - z * 16 - x), x
   NEXT x
  ELSE
   FOR x = 0 TO 15
    LINE (-240 + z * 16 + x, 240)-(320, -320 + z * 16 + x), 15 - x
    LINE (320 + z * 16 + x, 240)-(320, 240 - z * 16 - x), 15 - x
    LINE (320 - z * 16 - x, 240)-(320, 240 + z * 16 + x), 15 - x
    LINE (880 - z * 16 - x, 240)-(320, 800 - z * 16 - x), 15 - x
   NEXT x
  END IF
 NEXT z
END SELECT
DO
 WAIT &H3DA, 8
 FOR x = 0 TO 15
  OUT &H3C8, x
  OUT &H3C9, 63
  OUT &H3C9, 63
  OUT &H3C9, 63
  OUT &H3C8, (x + 10) MOD 16
  OUT &H3C9, 0
  OUT &H3C9, 0
  OUT &H3C9, 0
  FOR y = 1 TO w: NEXT y
 NEXT x
LOOP WHILE INKEY$ = ""

CLS
FOR x = 0 TO 640 STEP 20
FOR y = 0 TO 480 STEP 20
 LINE (x, y)-STEP(20, 20), , B
NEXT y
NEXT x

