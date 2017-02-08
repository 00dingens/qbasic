DEFDBL A-Z

CLS
INPUT "Bitte Zahl eingeben: ", zahl
INPUT "Sch„tzer eingeben: ", schaetzer
FOR x = 1 TO 20
 alterschaetzer = schaetzer
 schaetzer = (schaetzer + (zahl / schaetzer)) / 2
 PRINT "Neuer sch„tzer: "; schaetzer
 IF alterschaetzer = schaetzer THEN EXIT FOR
NEXT x
PRINT "Wurzel:"; SQR(zahl)

