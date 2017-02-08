
'Fraktales Bild mit Farbwechsel

SCREEN 12
g = 8      'Generationen 3-10
f = .61803   'Verkleinerung .1 - 1
a1 = 200: b1 = 200: a2 = 300: b2 = 300
n1 = a1: n2 = a2: m1 = b1: m2 = b2
LINE (n1, m1)-(n2, m2), 1, BF
FOR x = g TO 0 STEP -1
 FOR y = 0 TO 3 ^ x
  t = y
  n1 = a1: n2 = a2: m1 = b1: m2 = b2
  FOR z = 0 TO x - 1
   SELECT CASE t MOD 3
    CASE 0: l1 = n2: k1 = m2: n2 = (n2 - n1) * f + n2: m2 = (m2 - m1) * f + m2: n1 = l1: m1 = k1
    CASE 1: l1 = n1: k1 = m2: n2 = n1 - (n2 - n1) * f: m2 = (m2 - m1) * f + m2: n1 = l1: m1 = k1
    CASE 2: l1 = n2: k1 = m1: n2 = (n2 - n1) * f + n2: m2 = m1 - (m2 - m1) * f: n1 = l1: m1 = k1
   END SELECT
   t = INT(t / 3)
  NEXT z
 
  'LINE (n1, m1)-(n2, m2), x, BF
 
  LINE (n2, m2)-STEP((n2 - n1) * f, (m2 - m1) * f), x + 2, BF
  LINE (n1, m2)-STEP(-(n2 - n1) * f, (m2 - m1) * f), x + 2, BF
  LINE (n2, m1)-STEP((n2 - n1) * f, -(m2 - m1) * f), x + 2, BF
 NEXT y
NEXT x

DIM r(15), g(15), b(15)
FOR x = 0 TO 11
 READ r(x), g(x), b(x)
NEXT x
DO
 FOR x = 1 TO 12
  FOR q = 1 TO 12
   OUT &H3C8, q
   OUT &H3C9, r((x + q) MOD 12)
   OUT &H3C9, g((x + q) MOD 12)
   OUT &H3C9, b((x + q) MOD 12)
  NEXT q
  FOR z = 1 TO 2000: NEXT z
 NEXT x
LOOP WHILE INKEY$ = ""
DATA 63,0,0, 63,31,0, 63,63,0, 31,63,0, 0,63,0, 0,63,31, 0,63,63, 0,31,63, 0,0,63, 31,0,63, 63,0,63, 63,0,31

