CLS
INPUT "Wieviele Zahlenfelder soll es geben?"; b
c = CDBL(2 ^ b) - 1
PRINT "Also im Bereich von 1 bis "; CDBL(c)
FOR e = 1 TO b
 LOCATE 4, 1
 a = 2 ^ (e - 1)
 FOR d = 1 TO CDBL(c)
  FOR f = 1 TO CDBL(c) * 2 STEP 2
   IF d >= a * f AND d < a * (f + 1) THEN PRINT d;
  NEXT f
 NEXT d
 LOCATE 17, 20
 PRINT "Ist die gedachte Zahl dabei?(j/n)"
 DO: z$ = INKEY$: LOOP UNTIL z$ = "j" OR z$ = "n"
 IF z$ = "j" THEN o = o + a
 PRINT
 CLS
NEXT e
PRINT "Die gedachte Zahl ist "; o

