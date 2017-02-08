DEFDBL A-Z

CLS
PRINT "FÅr Programmende 0 eingeben"
DO
 PRINT : PRINT
 INPUT z
 n = 0
 FOR x = 2 TO SQR(z)
  IF z MOD x = 0 THEN n = 1: EXIT FOR
 NEXT x
 IF z = 0 OR z = 1 THEN n = 1
 IF n = 0 THEN PRINT z; "ist eine Primzahl" ELSE PRINT z; "ist keine Primzahl"
 IF z = 0 THEN EXIT DO

 PRINT "Teiler: ";
 FOR x = 1 TO z
  IF z MOD x = 0 THEN PRINT x;
 NEXT x
 PRINT

 PRINT "Faktoren: ";
 DO
  FOR x = 2 TO z
   IF z MOD x = 0 THEN PRINT x; : z = z / x: EXIT FOR
  NEXT x
 LOOP UNTIL z = 1

LOOP UNTIL z = 0
PRINT "Ende"

