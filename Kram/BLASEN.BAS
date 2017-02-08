RANDOMIZE TIMER
DIM x(3000), y(3000), r(3000)
sc = 1                        'Anzahl der gescrollten Zeilen pro Bild
ad = .1                        'Dazukommende Blasen pro Bild
groesse = 10                  'Maximale Blasengr”áe
grr = 140                     'Rechte Bildgrenze
gro = 220                      'Abstand der Anhaltegrenze vom oberen Bildrand
FOR z = 1 TO 3000
 r(z) = INT(RND * groesse + 1)
 y(z) = 350
NEXT z
SCREEN 9, , 1, 0
DO
 a = a + ad
 b = INT(a)
 a = a - INT(a)
 FOR u = 1 TO b
  c = c + 1
  ver = 10
BlaseNeu:
  ver = ver - 1
  x(c) = INT(RND * grr)
  gn = 0
  FOR t = 1 TO c - 1
   IF y(t) > 349 - groesse * 2 THEN
    qq = SQR((x(t) - x(c)) ^ 2 + (y(t) - y(c)) ^ 2)
    IF qq * SGN(qq) < r(t) + r(c) THEN gn = -1
   END IF
  NEXT t
  IF gn = -1 AND ver > 0 THEN GOTO BlaseNeu
 NEXT u
 CLS
 LINE (0, gro)-(grr, gro), 8
 FOR z = 1 TO c
 ' CIRCLE (x(z), y(z)), r(z), 0, , , 1
  IF y(z) >= gro THEN
   ab = INT(RND * (2 * sc + 1) - sc)
   x(z) = x(z) + ab
   f = 0
   IF x(z) < 0 THEN f = -x(z)
   IF x(z) > grr THEN f = grr - x(z)
   x(z) = x(z) + f
   y(z) = y(z) - sc
   gn = 0
   FOR t = 1 TO c
    IF z <> t THEN
     qq = SQR((x(t) - x(z)) ^ 2 + (y(t) - y(z)) ^ 2)
     IF qq * SGN(qq) < r(t) + r(z) THEN gn = -1
    END IF
   NEXT t
   IF gn = -1 THEN
    x(z) = x(z) - ab
    y(z) = y(z) + sc
    x(z) = x(z) - f
   END IF
  END IF
  CIRCLE (x(z), y(z)), r(z), , , , 1
 NEXT z
 PCOPY 1, 0
LOOP WHILE INKEY$ = "" AND c < 3000

