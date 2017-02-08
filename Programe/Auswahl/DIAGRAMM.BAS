
'Sich bewegendes Diagramm

RANDOMIZE TIMER
q = 14                    'Anzahl der Kurven (1 - 14)
DIM a(q + 1), w%(32000)
SCREEN 7
PAINT (1, 1), 15
FOR x = 1 TO q
 a(x) = INT(RND * 5 - 2)
 LINE (x, a(x) + 100)-(x, 100), x
NEXT x
DO
 FOR x = 1 TO q
  a(x) = a(x) + INT(RND * 3 - 1)
  SELECT CASE a(x)
   CASE IS > 0
    PSET (x, a(x) + 101), 15
    PSET (x, a(x) + 100), x
   CASE 0
    PSET (x, a(x) + 101), 15
    PSET (x, a(x) + 100), x
    PSET (x, a(x) + 99), 15
   CASE IS < 0
    PSET (x, a(x) + 100), x
    PSET (x, a(x) + 99), 15
  END SELECT
  PSET (q + 5, a(x) + 100), x
 NEXT x
 GET (q + 5, 20)-(q + 300, 180), w%
 PUT (q + 6, 20), w%, PSET
 LINE (q + 5, 20)-(q + 5, 180), 15
LOOP WHILE INKEY$ = ""

