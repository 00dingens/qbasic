
' Starfield Simulation

SCREEN 9, , 0, 1
DIM x(3000), y(3000), z(3000)
an = 100               'Sternenanzahl
ab = 320               'Abstand
sp = 10                'Speed

sp = sp * SGN(sp)
FOR q = 0 TO an
 x(q) = RND * 640 - 320
 y(q) = RND * 350 - 175
 z(q) = ab
NEXT q
DO
 FOR q = 0 TO an
  IF z(q) < 1 THEN x(q) = 10000: z(q) = 1
  a = 320 + x(q) * ab / z(q)
  b = 175 + y(q) * ab / z(q)
  IF a < 640 AND a > -1 AND b < 350 AND b > -1 THEN
   m = 4 / (z(q) * 4 / ab) - 1
   LINE (a, b)-STEP(m, m), , BF
  ELSE
   x(q) = RND * 640 - 320
   y(q) = RND * 350 - 175
   z(q) = ab
  END IF
  z(q) = z(q) - sp
 NEXT q
 PSET (320, 175), 12
 PCOPY 0, 1
 CLS
LOOP UNTIL INKEY$ = CHR$(27)

