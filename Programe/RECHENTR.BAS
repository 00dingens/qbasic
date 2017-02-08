'Kopfrechentrainer

PRINT "Rechenart (Zahlen auch zusammenz„hlbar)"
PRINT " 1 +  Addition"
PRINT " 2 -  Subtraktion"
PRINT " 4 *  Multiplikation"
PRINT " 8 /  Division"
PRINT "16 ^  Exponieren"
PRINT "32 v- Wurzel"
INPUT art

INPUT "Stufe (1 - 10): "; st

SELECT CASE art
CASE 1
 DO
  a = INT(RND * 10 ^ st)
  b = INT(RND * 10 ^ st)
  PRINT a; "+"; b; "=";
  INPUT c
 LOOP UNTIL c <> a + b

END SELECT

