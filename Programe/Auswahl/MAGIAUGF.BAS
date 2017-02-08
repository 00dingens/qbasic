GOSUB Voreinstellungen
GOSUB Bildaufbau
GOSUB Erstellen
END


Voreinstellungen:
SCREEN 12
FOR x = 0 TO 15
 OUT &H3C8, x
 OUT &H3C9, x * 4
 OUT &H3C9, x * 4
 OUT &H3C9, x * 4
NEXT x
RETURN

Bildaufbau:
 FOR x = 1 TO 15
  CIRCLE (160, 100), 130 - 8 * x, x
  PAINT (160, 100), x, x
  LINE (80 + x * 6, 220 + x * 6)-(260 - x * 6, 400 - x * 6), x, BF
 NEXT x

 FOR x = 1 TO 0 STEP -1
  FOR y = 0 TO 15
   CIRCLE (450, 200), (x * 32 + 32 - y) * 3, y
   PAINT (450, 200), y, y
  NEXT y
  FOR y = 15 TO 0 STEP -1
   CIRCLE (450, 200), (x * 32 + y) * 3, y
   PAINT (450, 200), y, y
  NEXT y
 NEXT x

 FOR y = 0 TO 3
  FOR x = 0 TO 15
   LINE (y * 128 + x * 4, 410)-STEP(20, 50), x, BF
  NEXT x
  FOR x = 0 TO 15
   LINE (y * 128 + x * 4 + 64, 410)-STEP(20, 50), 16 - x, BF
  NEXT x
 NEXT y
RETURN

Erstellen:
FOR x = 1 TO 31
 FOR y = 1 TO 480
  PSET (x, y), INT(RND * 16)
 NEXT y
NEXT x
FOR x = 32 TO 640
 FOR y = 1 TO 480
  PSET (x, y), POINT(x - 30 + POINT(x, y), y)
 NEXT y
NEXT x
RETURN

