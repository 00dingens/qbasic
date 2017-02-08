
'Magnetfeld um geladene K”rper
'neu aufsetzen mit Leertaste
'ende mit esc

los:
RANDOMIZE TIMER
ab = 1 < f0 'Abstand der Kompasse
la = 9   'L„nge der Kompasse
an = 4    'Anzahl der geladenen K”rper
spd = 10   'Geschwindigkeit der geladenen K”rper
DIM q(an), x(an), y(an), xx(an), yy(an)
SCREEN 9, , 1, 0
FOR z = 1 TO an
 x(z) = INT(RND * 620 + 10)
 y(z) = INT(RND * 330 + 10)
 xx(z) = RND * spd * 2 - spd
 yy(z) = RND * spd * 2 - spd
 q(z) = INT(RND * 2) * 2 - 1
NEXT z
DO
 FOR z = 1 TO an
  IF x(z) + xx(z) < 0 OR x(z) + xx(z) > 640 THEN xx(z) = -(RND * spd) * SGN(xx(z))
  IF y(z) + yy(z) < 0 OR y(z) + yy(z) > 350 THEN yy(z) = -(RND * spd) * SGN(yy(z))
  x(z) = x(z) + xx(z)
  y(z) = y(z) + yy(z)
 NEXT z
 CLS
 FOR z = 1 TO an
  IF q(z) = 1 THEN c = 2 ELSE c = 12
  CIRCLE (x(z), y(z)), 4, c
  PAINT (x(z), y(z)), c, c
 NEXT z
 FOR a = 0 TO 640 STEP ab
  FOR b = 0 TO 350 STEP ab
   n = 0: m = 0
   FOR z = 1 TO an
    e = SQR((x(z) - a) ^ 2 + (y(z) - b) ^ 2)
    n = n + q(z) * (x(z) - a) / e ^ 2
    m = m + q(z) * (y(z) - b) / e ^ 2
   NEXT z
   'ee = .05
   ee = SQR(n ^ 2 + m ^ 2)
   n = n * la / ee: m = m * la / ee
   LINE (a, b)-(a + n, b + m), 12
   LINE (a - n, b - m)-(a, b), 2
  NEXT b
 NEXT a
 PCOPY 1, 0
 SELECT CASE INKEY$
 CASE " ": CLEAR : GOTO los
 CASE CHR$(27): END
 CASE ELSE
 END SELECT
LOOP

