
'Fraktales Bild mit Bewegung, beste Aufl”sung

RANDOMIZE TIMER
SCREEN 12
INPUT "Welche Genauigkeit (0 - 7)"; g
IF g < 0 OR g > 7 THEN BEEP: g = 3
INPUT "Wartezeit zwischen den Bildern"; wart
wart = wart * 100
SCREEN 9, , 1, 0
VIEW SCREEN (145, 0)-(495, 349)      'kann man weglassen
f = .5
a1 = 259: b1 = 116: a2 = 375: b2 = 232
n1 = a1: n2 = a2: m1 = b1: m2 = b2
DO
 SELECT CASE bb
  CASE 0
   a1 = 259: b1 = 116: a2 = 375: b2 = 232
   n1 = a1: n2 = a2: m1 = b1: m2 = b2
   SELECT CASE INT(RND * 3)
    CASE 0
     g1 = -23.2: h1 = -23.2: g2 = -11.6: h2 = -11.6: bb = 0
    CASE 1
     g1 = -23.2: h1 = 11.6: g2 = -11.6: h2 = 23.2: bb = 3
    CASE 2
     g1 = 11.6: h1 = -23.2: g2 = 23.2: h2 = -11.6: bb = 1
    CASE ELSE
   END SELECT
  CASE 1
   a1 = 375: b1 = 116: a2 = 259: b2 = 232
   n1 = a1: n2 = a2: m1 = b1: m2 = b2
   SELECT CASE INT(RND * 3)
    CASE 0
     g1 = 23.2: h1 = -23.2: g2 = 11.6: h2 = -11.6: bb = 1
    CASE 1
     g1 = 23.2: h1 = 11.6: g2 = 11.6: h2 = 23.2: bb = 2
    CASE 2
     g1 = -11.6: h1 = -23.2: g2 = -23.2: h2 = -11.6: bb = 0
    CASE ELSE
   END SELECT
  CASE 2
   a1 = 375: b1 = 232: a2 = 259: b2 = 116
   n1 = a1: n2 = a2: m1 = b1: m2 = b2
   SELECT CASE INT(RND * 3)
    CASE 0
     g1 = 23.2: h1 = 23.2: g2 = 11.6: h2 = 11.6: bb = 2
    CASE 1
     g1 = -11.6: h1 = 23.2: g2 = -23.2: h2 = 11.6: bb = 3
    CASE 2
     g1 = 23.2: h1 = -11.6: g2 = 11.6: h2 = -23.2: bb = 1
    CASE ELSE
   END SELECT
  CASE 3
   a1 = 259: b1 = 232: a2 = 375: b2 = 116
   n1 = a1: n2 = a2: m1 = b1: m2 = b2
   SELECT CASE INT(RND * 3)
    CASE 0:
     g1 = -23.2: h1 = 23.2: g2 = -11.6: h2 = 11.6: bb = 3
    CASE 1:
     g1 = 11.6: h1 = 23.2: g2 = 23.2: h2 = 11.6: bb = 2
    CASE 2:
     g1 = -23.2: h1 = -11.6: g2 = -11.6: h2 = -23.2: bb = 0
    CASE ELSE
   END SELECT
  CASE ELSE
 END SELECT
 FOR r = 0 TO 10
  a1 = a1 + g1: a2 = a2 + g2: b1 = b1 + h1: b2 = b2 + h2
  CLS
  LINE (a1 - (a2 - a1) / f, b1 - (b2 - b1) / f)-(a1, b1), , BF
  LINE (a1, b1)-(a2, b2), , BF
  FOR x = 0 TO g
   FOR y = 1 TO 3 ^ x
    t = y
    n1 = a1: n2 = a2: m1 = b1: m2 = b2
    FOR z = 0 TO x - 1
     SELECT CASE t MOD 3
      CASE 0: l1 = n2: k1 = m2: n2 = (n2 - n1) * f + n2: m2 = (m2 - m1) * f + m2: n1 = l1: m1 = k1
      CASE 1: l1 = n1: k1 = m2: n2 = n1 - (n2 - n1) * f: m2 = (m2 - m1) * f + m2: n1 = l1: m1 = k1
      CASE 2: l1 = n2: k1 = m1: n2 = (n2 - n1) * f + n2: m2 = m1 - (m2 - m1) * f: n1 = l1: m1 = k1
      CASE ELSE
     END SELECT
     t = INT(t / 3)
    NEXT z
    LINE (n2, m2)-STEP((n2 - n1) * f, (m2 - m1) * f), , BF
    LINE (n1, m2)-STEP(-(n2 - n1) * f, (m2 - m1) * f), , BF
    LINE (n2, m1)-STEP((n2 - n1) * f, -(m2 - m1) * f), , BF
   NEXT y
  NEXT x
  PCOPY 1, 0
  FOR wa = 1 TO wart: NEXT wa
 NEXT r
LOOP WHILE INKEY$ = ""

