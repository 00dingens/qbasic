CLS
PRINT "Gib deinen Namen ein!"
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 IF ASC(t$) < 128 THEN PRINT CHR$(ASC(t$) + 120);
 IF ASC(t$) > 128 THEN PRINT CHR$(ASC(t$) - 120);
LOOP UNTIL t$ = CHR$(13)
PRINT "  Daknesc”n  !!!"

