
'Errechnet die Primzahlen zwischen zwei angegebenen Zahlen

SCREEN 12
INPUT "Ab welcher Zahl soll gerechnet werden"; ab
INPUT "Bis zu welcher Zahl soll gerechnet werden"; bis
ab = INT(ab / 2) * 2 + 1
FOR z = ab TO bis STEP 2
 pz = z: gr = INT(SQR(pz + 1)): pt = 1: prim = -1
 WHILE pt < gr AND prim
  pt = pt + 1: prim = pz MOD pt <> 0
 WEND
 IF prim THEN PRINT CDBL(z);
NEXT z

