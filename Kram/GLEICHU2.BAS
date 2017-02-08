ON ERROR GOTO er
DEFDBL A-Z
SCREEN 12
PRINT "Gleichung eingeben. Form: xý + px + q = 0"
PRINT "z. B.: xý + 1x - 6 = 0"
LOCATE 7, 1: INPUT "p ="; p
LOCATE 8, 1: INPUT "q ="; q
LOCATE 11, 5:
PRINT "xý ";
IF SGN(p) = 1 THEN PRINT "+";
PRINT STR$(p); "x ";
IF SGN(q) = 1 THEN PRINT "+";
PRINT q; "= 0"
PRINT : PRINT
e1 = -p / 2 + SQR((p / 2) ^ 2 - q)
e2 = -p / 2 - SQR((p / 2) ^ 2 - q)
IF e1 <> e2 THEN PRINT "x1 ="; e1; "und x2 ="; e2 ELSE PRINT "x ="; e1;
DO: LOOP WHILE INKEY$ = ""
END
er: COLOR 4: PRINT "Kein Ergebnis": DO: LOOP WHILE INKEY$ = "": END

