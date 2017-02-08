ON ERROR GOTO e
SCREEN 12
xl = -32: xr = 32    'hier x-koordinaten eingeben
yo = -24: yu = 24    'hier y-koordinaten eingeben
WINDOW (xl, yo)-(xr, yu)
LINE (0, -1000)-(0, 1000), 7
LINE (-1000, 0)-(1000, 0), 7
FOR x = -100 TO 100
 FOR y = -100 TO 100
  PSET (x, y), 8
 NEXT y
NEXT x
FOR x = xl TO xr STEP (xr - xl) / 100000

 e = 0
 y1 = SQR(400 - (x - 3) ^ 2) + 2    'hier funktionen eingeben
 y2 = -SQR(400 - (x - 3) ^ 2) + 2   'hier funktionen eingeben
 IF e = 1 THEN GOTO n
 PSET (x, y1), 10
 PSET (x, y2), 9
n:
NEXT x
e: e = 1: RESUME NEXT

