SCREEN 7, , 0, 1
DIM i(100, 2)   'positionen
DIM u(100, 100) 'verbindungen

RESTORE anzahl
READ i(0, 0)
RESTORE positionen
FOR x = 1 TO i(0, 0)
 FOR y = 0 TO 2
  READ i(x, y)
 NEXT y
NEXT x
RESTORE verbindungen
FOR x = 1 TO i(0, 0)
 FOR y = 1 TO i(0, 0)
  READ u(x, y)
 NEXT y
NEXT x

DO
 CLS
 FOR x = 1 TO i(0, 0)
  FOR y = 1 TO i(0, 0)
   n = (i(y, 1) - i(x, 1)) / 2
   m = (i(y, 2) - i(x, 2)) / 2
   IF u(x, y) = -2 THEN c = 12
   IF u(x, y) = -1 THEN c = 4
   IF u(x, y) = 0 THEN c = 8
   IF u(x, y) = 1 THEN c = 2
   IF u(x, y) = 2 THEN c = 10
   IF c <> 8 THEN LINE (i(x, 1), i(x, 2))-STEP(n, m), c
  NEXT y
 NEXT x
 FOR x = 1 TO i(0, 0)
  CIRCLE (i(x, 1), i(x, 2)), 3, i(x, 0)
 NEXT x
 PCOPY 0, 1
 FOR x = 1 TO i(0, 0)
  FOR y = 1 TO i(0, 0)
   IF x <> y THEN
    a = i(y, 1) - i(x, 1)
    b = i(y, 2) - i(x, 2)
    e = a ^ 2 + b ^ 2
    a = a * 1000 / e
    b = b * 1000 / e
    aa = a * 100000 / e ^ 2
    bb = b * 100000 / e ^ 2
    a = a * u(x, y)
    b = b * u(x, y)
    IF aa * SGN(aa) > 5 THEN aa = 5 * SGN(aa)
    IF bb * SGN(bb) > 5 THEN bb = 5 * SGN(bb)
    IF a * SGN(a) > 3 THEN a = 3 * SGN(a)
    IF b * SGN(b) > 3 THEN b = 3 * SGN(b)
    i(x, 1) = i(x, 1) + a - aa
    i(x, 2) = i(x, 2) + b - bb
    
   END IF
  NEXT y
 NEXT x
 t$ = INKEY$
 IF t$ = " " THEN FOR x = 1 TO i(0, 0): i(x, 1) = i(x, 1) + RND * 40 - 20: i(x, 2) = i(x, 2) + RND * 40 - 20: NEXT x

LOOP UNTIL t$ = CHR$(27)

''viereck
'anzahl:         'anzahl der punkte
'DATA 4   
'positionen:     'farbe,x,y
'DATA 1,200,200
'DATA 2,205,200
'DATA 3,205,205
'DATA 4,200,205
'verbindungen:   'verbindung von punkt 1 zu punkten 1,2,3,4
'DATA 0,2,2,2
'DATA 2,0,-1,-1
'DATA 2,-1,0,-1
'DATA 2,-1,-1,0

'ethanol
anzahl:
DATA 9
positionen:
DATA 1,110,110
DATA 1,120,110
DATA 15,100,110
DATA 15,140,110
DATA 15,110,100
DATA 15,120,100
DATA 15,110,120
DATA 15,120,120
DATA 4,130,110
verbindungen:
DATA   ,1,1, ,1, ,1, ,
DATA  1, , , , ,1, ,1,1
DATA  1, , , , , , , ,
DATA   , , , , , , , ,1
DATA  1, , , , , , , ,
DATA   ,1, , , , , , ,
DATA  1, , , , , , , ,
DATA   ,1, , , , , , ,
DATA   ,1, ,1, , , , ,

