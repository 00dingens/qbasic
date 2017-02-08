
'Vergr”sserer Steuern mit Zahltasten, Ende mit Leertaste
'Vergr”ssern mit 5

DECLARE SUB bild ()
s = 0: u = 0: verg = 1
DO
CLS
SCREEN 12
x = s: y = u
PRINT verg, x, y
WINDOW (x - 160 / verg, y - 175 / verg)-(x + 320 / verg, y + 175 / verg)
CALL bild
GOSUB steuern
DO
PRINT s, u;
INPUT "Wie stark vergr”áern (0.1 - 10)"; ver
LOOP UNTIL ver >= .02 AND ver <= 50
verg = ver * verg
LOOP
END

steuern:
DO
PSET (s, u)
t$ = INKEY$
PSET (s, u), 0
IF t$ = "1" THEN u = u - 1: s = s - 1
IF t$ = "2" THEN u = u - 1
IF t$ = "3" THEN u = u - 1: s = s + 1
IF t$ = "4" THEN s = s - 1
IF t$ = "6" THEN s = s + 1
IF t$ = "7" THEN u = u + 1: s = s - 1
IF t$ = "8" THEN u = u + 1
IF t$ = "9" THEN u = u + 1: s = s + 1
IF t$ = " " THEN END
LOOP UNTIL t$ = "5"
RETURN

SUB bild
'Haus
LINE (1, 1)-(4, 4), 1, B
PAINT (3, 3), 11, 1
LINE (1.5, 2.5)-(2, 3.5), 0, BF
LINE (3, 2.5)-(3.5, 3.5), 0, BF
LINE (2.25, 1)-(2.75, 2.5), 0, BF
LINE (4, 4)-(1, 4), 4
LINE -(2.5, 5.5), 4
LINE -(4, 4), 4
LINE -(6, 5.5), 4
LINE -(5, 6), 4
LINE -(2.5, 5.5), 4
PAINT (2.5, 4.5), 12, 4
PAINT (4.5, 5), 12, 4
LINE (4, 1)-(6, 4), 1
LINE -(6, 5.5), 1
LINE -(4, 4), 1
LINE -(4, 1), 1
PAINT (5, 4), 11, 1
'####

'beam
FOR x = 1 TO 30
CIRCLE (9, 3), (150 - x * 5) / 50, INT(x / 2), , , x / (31 - x)
NEXT x
'####

'b”rse
PSET (13, 3)
FOR x = 1 TO 100
LINE -(x / 25 + 13, RND + 2.5)
NEXT x
'#####

'man
CIRCLE (22.5, 5), .4
PAINT (22.5, 5), 15, 15
LINE -(22.5, 2.5)
LINE (21.5, 2.75)-(21.75, 3.5)
LINE -(22.5, 4)
LINE -(23.5, 3.25)
LINE -(24.5, 3.75)
LINE (21.5, 0)-(21, .5)
LINE -(22, 1.25)
LINE -(22.5, 2.5)
LINE -(23.5, 1.5)
LINE -(24, .5)
LINE -(24.5, 1)
'###

'licht
FOR c = 1 TO 500
LINE (3, 10)-(RND * 4 + 1, RND * 4 + 8), 5
NEXT c
'#####

'spirale
DIM x(4), y(4)
p = 3.14159 / 2
v = .1
x(1) = 9.9: y(1) = 10.11
x(2) = 9.9: y(2) = 10
x(3) = 10: y(3) = 10
x(4) = 10: y(4) = 10.11
FOR b = 1 TO 5
FOR i = 1 TO 4
 CIRCLE (x(i), y(i)), v, 15, p * (i - 1), p * i
 v = v + .1
NEXT i
NEXT b
'#######
END SUB

