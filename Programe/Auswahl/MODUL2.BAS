
'Farbenspiel

SCREEN 9, , 0, 1
FOR a = 101 TO 1000 STEP 4
 b = INT(a / 2)
 FOR c = 1 TO a
  FOR d = 1 TO a
   IF (c * d) MOD a > b THEN PSET (d, c), 14
  NEXT d
 NEXT c
 PCOPY 0, 1
 CLS
 IF INKEY$ <> "" THEN EXIT FOR
NEXT a
SLEEP

