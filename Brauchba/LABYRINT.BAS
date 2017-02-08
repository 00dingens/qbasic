
'erzeugt labyrinth

RANDOMIZE TIMER
SCREEN 12
WIDTH 80, 60

lan = 5                'gangstÅck-lÑnge (tut kaum was zur sache)
xz = 13: yz = 13      'labyrinth-ausma·e  max. 320x240
g = 5                   'gangbreite in pixel
                        '!!! xz*g<=320 und yz*g<=240

PSET (g, g), 15
anz = 1
DO
 DO
  x = INT(RND * xz + 1)
  y = INT(RND * yz + 1)
 LOOP UNTIL POINT(x * 2 * g - g, y * 2 * g - g) = 15

 FOR z = 1 TO lan
  r = INT(RND * 4)
  SELECT CASE r
  CASE 0
   IF x < xz THEN
    IF POINT(x * 2 * g + g, y * 2 * g - g) = 0 THEN GOSUB ver: x = x + 1: anz = anz + 1
   END IF
  CASE 1
   IF x > 1 THEN
    IF POINT(x * 2 * g - 3 * g, y * 2 * g - g) = 0 THEN GOSUB ver: x = x - 1: anz = anz + 1
   END IF
  CASE 2
   IF y < yz THEN
    IF POINT(x * 2 * g - g, y * 2 * g + g) = 0 THEN GOSUB ver: y = y + 1: anz = anz + 1
   END IF
  CASE 3
   IF y > 1 THEN
    IF POINT(x * 2 * g - g, y * 2 * g - 3 * g) = 0 THEN GOSUB ver: y = y - 1: anz = anz + 1
   END IF
  END SELECT
 NEXT z
LOOP UNTIL anz = xz * yz

PSET (g - 1, g), 15
PSET (xz * 2 * g - g + 1, yz * 2 * g - g), 15

IF g > 1 THEN
 FOR x = 0 TO xz * 2 * g
  FOR y = 0 TO yz * 2 * g
   IF POINT(x, y) <> 15 THEN
    FOR a = -g + 1 TO g - 1
     IF POINT(x + a, y - g + 1) = 15 THEN PSET (x, y), 7: GOTO grau
     IF POINT(x + a, y + g - 1) = 15 THEN PSET (x, y), 7: GOTO grau
     IF POINT(x - g + 1, y + a) = 15 THEN PSET (x, y), 7: GOTO grau
     IF POINT(x + g - 1, y + a) = 15 THEN PSET (x, y), 7: GOTO grau
    NEXT a
   END IF
grau:
  NEXT y
 NEXT x
 PAINT (g, g), 15, 0
END IF

DO: LOOP WHILE INKEY$ = ""
END

ver:
SELECT CASE r
CASE 0: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(2 * g, 0), 15
CASE 1: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(-2 * g, 0), 15
CASE 2: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(0, 2 * g), 15
CASE 3: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(0, -2 * g), 15
END SELECT
RETURN

