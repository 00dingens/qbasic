
'Schablone (Halbkugel auf Zylinder)

SCREEN 12
WINDOW (-1600, -1200)-(1595, 1195)
pi = 3.141592653#
p = 180 / pi
FOR x = 1 TO 89
 w = 360 * ((SIN(x / p) * 2 * pi) / (x * 2 * pi))
 PSET (SIN(w / 2) * x * 2.5, COS(w / 2) * x * 2.5)
 PSET (-SIN(w / 2) * x * 2.5, COS(w / 2) * x * 2.5)
NEXT x
FOR x = 90 TO 360
 w = 360 * ((1 * 2 * pi) / (x * 2 * pi))
 PSET (SIN(w / 2) * x * 2.5, COS(w / 2) * x * 2.5)
 PSET (-SIN(w / 2) * x * 2.5, COS(w / 2) * x * 2.5)
NEXT x
CIRCLE (0, 0), 900, , pi * .3, pi * .7
CHAIN "c:\a\pict.bas"

