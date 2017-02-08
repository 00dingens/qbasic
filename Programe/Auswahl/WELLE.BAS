
'Addiert Wellen

RANDOMIZE TIMER
SCREEN 12
m = 5
DIM q(m), w(m), y(m, 1000), wi(m), b(m)
DO
 CLS
 INPUT "Anzahl der Wellen"; m
 IF m = 0 THEN EXIT DO
 REDIM q(m), w(m), wi(m), b(m)
 REDIM y(m * 2, 640)

 FOR c = 1 TO m
  PRINT "Genauigkeit    "; c;
  INPUT q(c)
  IF q(c) = 0 THEN q(c) = INT(RND * 200)
  PRINT "H”he der Welle "; c;
  INPUT w(c)
  IF w(c) = 0 THEN w(c) = 200 / m
  PRINT "Fortschritt    "; c;
  INPUT hh(c)
  'IF hh(c) = 0 THEN hh(c) = INT(RND * q(c) - 1)
 NEXT c
 CLS
 FOR c = 1 TO m
  wi(c) = 2 * 3.141593 / q(c)
 NEXT c
 FOR c = 1 TO m
  FOR i = 1 TO q(c)
   y(c, i) = w(c) * SIN(i * wi(c))
   y(c, i + q(c)) = y(c, i)
  NEXT i
  FOR i = 1 TO q(c)
   y(c, i) = y(c, i + hh(c))
  NEXT i
 NEXT c
 
 s = 480 / (m * 2 + 1) - m
 FOR c = 1 TO m
  PSET (-10, s * c)
  FOR a = 0 TO 640 STEP q(c)
   FOR b = 1 TO q(c)
    LINE -(a + b, s * c + y(c, b)), 11
   NEXT b
  NEXT a
 NEXT c

 PSET (-1, 400)
 FOR c = 1 TO m
  b(c) = 0
 NEXT c
 FOR a = 1 TO 640
  FOR c = 1 TO m
   b(c) = b(c) + 1
  NEXT c
  FOR c = 1 TO m
   IF b(c) = q(c) + 1 THEN b(c) = 1
  NEXT c
  d = 400
  FOR c = 1 TO m
   d = d + y(c, b(c))
  NEXT c
  LINE -(a, d), 15
 NEXT a
 
 DO: LOOP WHILE INKEY$ = ""
LOOP
END

