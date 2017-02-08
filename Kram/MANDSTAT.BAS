'test f〉 verschl《selungszwecke
'16bit zufallszahlen werden skaliert
'x ist [-2 -1.5[
'y ist [-0.05 0.05[
'somit ist jedes veschl《selte zeichen 4 byte lang
'2byte x und 2byte y
'entschl《seln: werte zur…kskalieren, iteration=zeichennummer
'verschl《selungsalg noch nicht realisiert.


SCREEN 13
WINDOW (-2, -.005)-(-1.5, .005)
DIM hist(0 TO 257) AS INTEGER
DO
 FOR k = 1 TO 10000
  'x = RND * 3 - 2: y = RND * 2 - 1
  'w = RND * 6.28: r = RND * .2 + .65: x = SIN(w) * r - .175: y = COS(w) * r * 1.05
  xx = INT(RND * 32768) / 32768: yy = INT(RND * 32768) / 32768
  x = xx * .5 - 2: y = yy * .01 - .005
  'IF (x + .18) ^ 2 + (y) ^ 2 < .35 OR (x + 1) ^ 2 + (y) ^ 2 < .07 THEN
  IF x > -1.775 AND x < -1.75 THEN
   PSET (x, y), 15
  ELSE
   x1 = 0: y1 = 0
   FOR z = 0 TO 256
    x2 = x1 * x1 - y1 * y1 + x
    y2 = 2 * x1 * y1 + y
    x1 = x2: y1 = y2
   IF x1 * x1 + y1 * y1 > 4 THEN EXIT FOR
   NEXT z
   PSET (x, y), z
   IF hist(z) < 30000 THEN hist(z) = hist(z) + 1
  END IF
 NEXT k
 alleErfasst = 1
 a = 0
 LOCATE 1, 1
 FOR k = 1 TO 255
  IF hist(k) = 0 THEN
   alleErfasst = alleErfasst - 1
   'PRINT k;
  ELSE
   a = a + 1
  END IF
 NEXT k
 PRINT a
LOOP UNTIL alleErfasst > 0

SCREEN 13
WINDOW (0, 0)-(319, 239)
FOR z = 1 TO 255
 IF hist(z) <> 0 THEN LINE (z, 0)-(z, hist(z) - 1)
NEXT z
DO: LOOP WHILE INKEY$ = ""

