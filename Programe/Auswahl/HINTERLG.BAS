
'Hinterlegt ein Bild dem Anderen

ON ERROR GOTO ende
GOSUB voraussetzungen
GOSUB andere.farben
GOSUB farben.lesen
GOSUB bild
GOSUB neue.farben
GOSUB hinterlegen
END

voraussetzungen:
DIM f(15, 3), n%(10000), m%(10000)
SCREEN 13
INPUT "Sichtbarkeit des Zweiten"; s
CLS
RETURN

andere.farben:
FOR a = 1 TO 15
 OUT &H3C8, a
 OUT &H3C9, a * 4 + 3
 OUT &H3C9, a * 4 + 3
 OUT &H3C9, a * 4 + 3
NEXT a
RETURN

farben.lesen:
FOR a = 0 TO 15
 OUT &H3C7, a
 f(a, 1) = INP(&H3C9)
 f(a, 2) = INP(&H3C9)
 f(a, 3) = INP(&H3C9)
NEXT a
RETURN

bild:
FOR a = 1 TO 15
 LINE (25 - a, 25 - a)-STEP(a * 2, a * 2), a * 16, B
NEXT a
FOR a = 0 TO 15
 CIRCLE (125, 25), 17 - a, a
 PAINT STEP(0, 0), a, a
NEXT a
RETURN

neue.farben:
FOR a = 1 TO 255
 OUT &H3C8, a
 OUT &H3C9, (f(a MOD 16, 1) * s + f(INT(a / 16), 1) * (2 - s)) / 2
 OUT &H3C9, (f(a MOD 16, 2) * s + f(INT(a / 16), 2) * (2 - s)) / 2
 OUT &H3C9, (f(a MOD 16, 3) * s + f(INT(a / 16), 3) * (2 - s)) / 2
NEXT a
RETURN

hinterlegen:
GET (0, 0)-(50, 50), n%
GET (100, 0)-(150, 50), m%
CLS
x1 = 1: y1 = 50: x2 = 1: y2 = 100
n1 = 1: m1 = 1: n2 = 1: m2 = -1
PUT (x1, y1), n%
PUT (x2, y2), m%
DO
 PUT (x1, y1), n%
 PUT (x2, y2), m%
 x1 = x1 + n1: y1 = y1 + m1: x2 = x2 + n2: y2 = y2 + m2
 PUT (x1, y1), n%
 PUT (x2, y2), m%
 FOR z = 1 TO 500: NEXT z
LOOP
RETURN

ende:
LOCATE 12, 12
PRINT "E  R  R  O  R  !"
END

