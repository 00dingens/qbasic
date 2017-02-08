GOSUB Voreinstellungen
GOSUB Bildaufbau
GOSUB Erstellen
END


Voreinstellungen:
SCREEN 13
FOR x = 16 TO 63
 OUT &H3C8, x
 OUT &H3C9, x
 OUT &H3C9, x
 OUT &H3C9, x
NEXT x
RETURN

Bildaufbau:
 FOR x = 1 TO 16
  CIRCLE (160, 100), 64 - 4 * x, x
  PAINT (160, 100), x, x
 NEXT x
RETURN

Erstellen:
FOR z = 0 TO 1
 FOR x = 0 TO 31
  FOR y = 1 TO 200
   PSET (x + z * 32, y), INT(RND * 16) + 64
  NEXT y
 NEXT x
NEXT z
FOR x = 64 TO 320
 FOR y = 1 TO 200
  PSET (x, y), POINT(x - 64 + POINT(x, y), y)
 NEXT y
NEXT x
RETURN

