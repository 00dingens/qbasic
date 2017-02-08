CLS
ber = 8200          'Bereich zu durchsuchen
DIM q(ber)
FOR x = 1 TO ber
 CLS
 b = 0
 PRINT "Zahl:"; x
 PRINT "Teilbar durch:";
 FOR s = 1 TO x - 1
  IF x MOD s = 0 THEN
   b = b + 1
   q(b) = s
   PRINT s;
  END IF
 NEXT s
 t = 0
 FOR a = 1 TO b
  t = t + q(a)
 NEXT a
 PRINT : PRINT "Anzahl der Teiler:"; b
 PRINT "Summe:"; t
 IF t = x THEN COLOR 12: PRINT "Perfekte Zahl:"; x: COLOR 7
 IF t = x THEN DO: LOOP WHILE INKEY$ = ""
NEXT x

