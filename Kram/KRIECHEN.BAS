SCREEN 7, , 1, 0
DIM q(30)
FOR x = 1 TO 30
 q(x) = INT(RND * 20)
NEXT x
DO
 k = (k + 1.5) MOD 190
 CLS
 FOR x = 1 TO 30: q(x) = q(x) MOD 20 + RND * 2: NEXT x
 PSET (0, k)
 FOR x = 1 TO 30
  IF q(x) < 11 THEN LINE -(x * 10, q(x) + k) ELSE LINE -(x * 10, 21 - q(x) + k)
  'IF q(x) < 11 THEN PSET (x * 10, q(x) + k) ELSE PSET (x * 10, 21 - q(x) + k)
 NEXT x
 LINE -(320, k)
 PAINT (0, 199), 15, 15
 PCOPY 1, 0
LOOP WHILE INKEY$ = ""

