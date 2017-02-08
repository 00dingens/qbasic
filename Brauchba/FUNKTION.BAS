ON ERROR GOTO er
SCREEN 12
xl = -4: xr = 4    'hier x-koordinaten eingeben
yo = -3: yu = 3    'hier y-koordinaten eingeben
WINDOW (xl, yo)-(xr, yu)
LINE (0, -1200)-(0, 1200), 7
LINE (-1000, 0)-(1000, 0), 7
FOR x = -10 TO 10 STEP 1
 FOR y = -12 TO 12 STEP 1
  PSET (x, y), 8
 NEXT y
NEXT x
FOR x = xl TO xr STEP (xr - xl) / 6400

 e = 0
 y1 = (x + 1) ^ 3                    'hier funktionen eingeben
 y2 = (x - 1)          'hier funktionen eingeben
 y3 = y1 * y2'hier funktionen eingeben
 'IF e = 1 THEN GOTO n
 PSET (x, y1), 1
 PSET (x, y2), 2
 PSET (x, y3), 3
n:
NEXT x
DO: LOOP WHILE INKEY$ = ""
END
er: e = 1: RESUME NEXT

