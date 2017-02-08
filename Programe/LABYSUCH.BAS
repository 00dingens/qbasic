RANDOMIZE TIMER
SCREEN 12
WIDTH 80, 60

warten = 50000           'wartezeit beim schritte machen
lan = 100               'gangstÅck-lÑnge (tut kaum was zur sache)
xz = 79: yz = 59        'labyrinth-ausma·e  max. 320x240
g = 4                   'gangbreite in pixel
                        '!!! xz*g<=320 und yz*g<=240

DIM z(xz + 1, yz + 1, 5) AS INTEGER

PSET (INT(xz / 2) * g * 2 - g, INT(yz / 2) * g * 2 - g), 15
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

'anfang und ende
'PSET (g - 1, g), 15
'PSET (xz * 2 * g - g + 1, yz * 2 * g - g), 15

PAINT (639, 479), 7, 15

IF g > 0 THEN
 FOR x = 0 TO xz * g * 2 STEP g * 2
  FOR y = 0 TO yz * g * 2 STEP g * 2
   IF POINT(x + g, y) <> 15 THEN LINE (x, y)-STEP(g * 2, 0), 0
   IF POINT(x, y + g) <> 15 THEN LINE (x, y)-STEP(0, g * 2), 0
  NEXT y
 NEXT x
END IF

'''LINE (0, 0)-(xz * g * 2, yz * g * 2), 0, B
IF xz * g * 2 < 640 OR yz * g * 2 < 480 THEN PAINT (639, 479), 0, 0
'''' PAINT (g, g), 7, 7     'ohne weg

DO: LOOP WHILE INKEY$ = ""

FOR x = 1 TO xz
 FOR y = 1 TO yz
  t = 0
  IF POINT(x * g * 2, y * g * 2 - g) <> 0 THEN t = t + 1: z(x, y, t) = 0
  IF POINT(x * g * 2 - g - g, y * g * 2 - g) <> 0 THEN t = t + 1: z(x, y, t) = 1
  IF POINT(x * g * 2 - g, y * g * 2) <> 0 THEN t = t + 1: z(x, y, t) = 2
  IF POINT(x * g * 2 - g, y * g * 2 - g - g) <> 0 THEN t = t + 1: z(x, y, t) = 3
  z(x, y, 0) = t
  FOR r = 1 TO t
   SWAP z(x, y, r), z(x, y, INT(RND * t + 1))
  NEXT r
  FOR r = 1 TO t
   SELECT CASE z(x, y, r)
   CASE 0: aaa = 1: bbb = 0
   CASE 1: aaa = -1: bbb = 0
   CASE 2: aaa = 0: bbb = 1
   CASE 3: aaa = 0: bbb = -1
   END SELECT
   'LINE (x * g * 2 - g, y * g * 2 - g)-STEP(aaa * 2, bbb * 2), r
  NEXT r
 NEXT y
NEXT x
x = 1'INT(RND * xz + 1)  'start
y = 1'INT(RND * yz + 1)
xe = xz'INT(RND * xz + 1) 'ziel
ye = yz'INT(RND * yz + 1)
CIRCLE (x * g * 2 - g, y * 2 * g - g), 3, 1
CIRCLE (xe * g * 2 - g, ye * 2 * g - g), 3, 4
DO
 r = z(x, y, 1)         'richtung
 'schritt simulieren
 a = 0: b = 0
 FOR t = 1 TO g * 2
 
  IF g <= 2 THEN PSET (x * g * 2 - g + a, y * g * 2 - g + b), 15
  IF g > 2 THEN CIRCLE (x * g * 2 - g + a, y * g * 2 - g + b), 1, 7: PSET (x * g * 2 - g + a, y * g * 2 - g + b), 7
 
  SELECT CASE r
  CASE 0: a = a + 1
  CASE 1: a = a - 1
  CASE 2: b = b + 1
  CASE 3: b = b - 1
  CASE ELSE: PRINT r
  END SELECT
  IF g <= 2 THEN PSET (x * g * 2 - g + a, y * g * 2 - g + b), 0
  IF g > 2 THEN CIRCLE (x * g * 2 - g + a, y * g * 2 - g + b), 1, 0: PSET (x * g * 2 - g + a, y * g * 2 - g + b), 0
 
  'CIRCLE (x * g * 2 - g + a, y * g * 2 - g + b), 1, 0
  'PSET (x * g * 2 - g + a, y * g * 2 - g + b), 0
  FOR pause = 1 TO warten: NEXT pause
 NEXT t
 'neue position
 SELECT CASE r
 CASE 0: x = x + 1: rr = 1
 CASE 1: x = x - 1: rr = 0
 CASE 2: y = y + 1: rr = 3
 CASE 3: y = y - 1: rr = 2
 END SELECT
 'herkunft festlegen
 FOR t = 1 TO z(x, y, 0)
  IF z(x, y, t) = rr THEN SWAP z(x, y, 1), z(x, y, t)
 NEXT t
 'wanderrichtung weiterdrehen
 z(x, y, z(x, y, 0) + 1) = z(x, y, 1)
 FOR t = 1 TO z(x, y, 0)
  z(x, y, t) = z(x, y, t + 1)
 NEXT t
LOOP UNTIL x = xe AND y = ye







END

ver:
SELECT CASE r
CASE 0: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(2 * g, 0), 15
CASE 1: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(-2 * g, 0), 15
CASE 2: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(0, 2 * g), 15
CASE 3: LINE (x * 2 * g - g, y * 2 * g - g)-STEP(0, -2 * g), 15
END SELECT
RETURN

