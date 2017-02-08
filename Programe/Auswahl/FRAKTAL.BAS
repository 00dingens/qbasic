
'Fraktales Bild

SCREEN 12
g = 6'INPUT "Anzahl Generationen"; g
f = .5'INPUT "Faktor"; f
a1 = -128: b1 = -128: a2 = 128: b2 = 128
n1 = a1: n2 = a2: m1 = b1: m2 = b2
'LINE (n1, m1)-(n2, m2), , BF
FOR x = 0 TO g
 FOR y = 1 TO 3 ^ x
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
 
  LINE (n2, m2)-STEP((n2 - n1) * f, (m2 - m1) * f), x + 5, BF
  LINE (n1, m2)-STEP(-(n2 - n1) * f, (m2 - m1) * f), x + 5, BF
  LINE (n2, m1)-STEP((n2 - n1) * f, -(m2 - m1) * f), x + 5, BF
 NEXT y
NEXT x

