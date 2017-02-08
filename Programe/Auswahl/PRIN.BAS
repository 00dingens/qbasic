
'Errechnet die Primzahlen bis zur angegebenen Zahl

SCREEN 12
DIM a%(32760)
u = 1
INPUT "Bis zu welcher Zahl soll gerechnet werden (5-100000)"; bis
PRINT "2 ";
FOR z = 3 TO bis STEP 2
 w = 1
 FOR x = 0 TO u - 1
  IF z MOD a%(x) = 0 THEN w = 0
 NEXT x
 IF w = 1 THEN PRINT z; : a%(u) = z: u = u + 1
NEXT z
PRINT : PRINT u
              

