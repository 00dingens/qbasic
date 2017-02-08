'geht die punkte in einer spirale durch und macht primzahlen grÅn

SCREEN 12
x = 320
y = 240
'PSET (x, y - 1), 1
d = 0
a = 1
DO
 a = a + 1
 dalt = d
 SELECT CASE dalt
 CASE 0: IF POINT(x, y - 1) = 0 THEN d = 1
 CASE 1: IF POINT(x - 1, y) = 0 THEN d = 2
 CASE 2: IF POINT(x, y + 1) = 0 THEN d = 3
 CASE 3: IF POINT(x + 1, y) = 0 THEN d = 0
 END SELECT
 SELECT CASE d
 CASE 0: x = x + 1
 CASE 1: y = y - 1
 CASE 2: x = x - 1
 CASE 3: y = y + 1
 END SELECT
 'LOCATE (a MOD 16) + 1, 5: PRINT x - 160; y - 100
 IF POINT(x, y) <> 0 THEN END
 GOSUB prim
 PSET (x, y), c
LOOP WHILE INKEY$ = ""
LINE (90, 10)-STEP(460, 460), , , 257
LINE (90, 470)-STEP(460, -460), , , 257
END

prim:
c = 2
FOR xx = 2 TO SQR(a)
 IF a MOD xx = 0 THEN c = 1
NEXT xx
RETURN

