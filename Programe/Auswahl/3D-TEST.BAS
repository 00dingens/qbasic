
'Hiermit testete ich 3D-Effekte (sind keine echten)
'Wenn die Punkte hinten sind, sind sie langsamer.

SCREEN 12
WINDOW (1, 1)-(320, 240)
DIM x(10000), y(10000)
eck = 300: rad = 40
win = 2 * 3.141593 / eck
FOR i = 0 TO eck - 1
 x(i) = rad * COS(i * win)
 y(i) = rad * SIN(i * win)
 x(i) = x(i) - (x(i) * y(i) * .01)
 x(i + eck) = x(i): y(i + eck) = y(i)
NEXT i
CLS
CIRCLE (160, 120), 7, 11
PAINT (160, 120), 11, 11
DO
FOR i = 0 TO eck - 1
 FOR zz = 1 TO 100: NEXT zz

 PSET ((x(i + 8) * 3) + 160, y(i + 8) + 120), 15
 PSET ((x(i + 6) * 3) + 160, y(i + 6) + 120), 7
 PSET ((x(i + 4) * 3) + 160, y(i + 4) + 120), 8
 PSET ((x(i + 2) * 3) + 160, y(i + 2) + 120), 0
 PSET ((x(i + 108) * 3) + 160, y(i + 108) + 120), 15
 PSET ((x(i + 106) * 3) + 160, y(i + 106) + 120), 7
 PSET ((x(i + 104) * 3) + 160, y(i + 104) + 120), 8
 PSET ((x(i + 102) * 3) + 160, y(i + 102) + 120), 0
 PSET ((x(i + 208) * 3) + 160, y(i + 208) + 120), 15
 PSET ((x(i + 206) * 3) + 160, y(i + 206) + 120), 7
 PSET ((x(i + 204) * 3) + 160, y(i + 204) + 120), 8
 PSET ((x(i + 202) * 3) + 160, y(i + 202) + 120), 0

NEXT i
LOOP WHILE INKEY$ = ""
END

 'Alternative 1
 LINE ((x(i + 5) * 3) + 160, y(i + 5) + 120)-((x(i + 2) * 3) + 160, y(i + 2) + 117), 15
 LINE ((x(i + 5) * 3) + 160, y(i + 5) + 120)-((x(i + 2) * 3) + 160, y(i + 2) + 123), 15
 LINE ((x(i + 3) * 3) + 160, y(i + 3) + 120)-((x(i + 0) * 3) + 160, y(i + 0) + 117), 0
 LINE ((x(i + 3) * 3) + 160, y(i + 3) + 120)-((x(i + 0) * 3) + 160, y(i + 0) + 123), 0

 'Alternative 2
 PSET ((x(i + 8) * 3) + 160, y(i + 8) + 120), 15
 PSET ((x(i + 6) * 3) + 160, y(i + 6) + 120), 7
 PSET ((x(i + 4) * 3) + 160, y(i + 4) + 120), 8
 PSET ((x(i + 2) * 3) + 160, y(i + 2) + 120), 0
 PSET ((x(i + 108) * 3) + 160, y(i + 108) + 120), 15
 PSET ((x(i + 106) * 3) + 160, y(i + 106) + 120), 7
 PSET ((x(i + 104) * 3) + 160, y(i + 104) + 120), 8
 PSET ((x(i + 102) * 3) + 160, y(i + 102) + 120), 0
 PSET ((x(i + 208) * 3) + 160, y(i + 208) + 120), 15
 PSET ((x(i + 206) * 3) + 160, y(i + 206) + 120), 7
 PSET ((x(i + 204) * 3) + 160, y(i + 204) + 120), 8
 PSET ((x(i + 202) * 3) + 160, y(i + 202) + 120), 0

 'Alternative 3
CIRCLE (x(i) * 3 + 160, y(i) + 120), 1
FOR b = 1 TO 20: NEXT b
CIRCLE (x(i) * 3 + 160, y(i) + 120), 1, 0

