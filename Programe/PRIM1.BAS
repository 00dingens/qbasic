DEFDBL A-Z
e$ = "2"
erg = 2
z = 35000
t = TIMER
OPEN "c:\windows\desktop\prim.txt" FOR OUTPUT AS #1
PRINT #1, "Alle Primzahlen bis"; z; "multipliziert ergeben: 2";
CLS
PRINT "Primzahlen:"
FOR x = 3 TO z STEP 2
 FOR y = 3 TO SQR(x) STEP 2
  IF x MOD y = 0 THEN GOTO nicht
 NEXT y
 p$ = LTRIM$(STR$(x))
 e1$ = e$
 e$ = ""
 prl = LEN(p$) - 1                    'primzahll„nge
 FOR nn = 1 TO prl: e1$ = e1$ + "0": NEXT nn
 e1$ = "000000000" + e1$
 m = 0
 FOR i = LEN(e1$) - prl TO 1 STEP -1 'ergebnisl„nge
  FOR u = 0 TO prl
   m = m + VAL(MID$(e1$, i + u, 1)) * VAL(MID$(p$, prl + 1 - u, 1))
  NEXT u
  e$ = LTRIM$(STR$(m MOD 10)) + e$
  m = INT(m / 10)
 NEXT i
 e$ = LTRIM$(STR$(m)) + e$
 FOR te = 1 TO 10
  IF LEFT$(e$, 1) = "0" THEN e$ = RIGHT$(e$, LEN(e$) - 1)
 NEXT te
 CLS
 PRINT "Û"; p$; "Û"
 IF erg > 1D+48 THEN erg = erg / 1D+24
 erg = erg * x: PRINT erg
 PRINT LEFT$(e$, 20)
 PRINT "L„nge:"; LEN(e$)
 IF MID$(STR$(erg), 2, 1) <> LEFT$(e$, 1) THEN DO: LOOP WHILE INKEY$ = ""
 PRINT #1, "*"; p$;
nicht:
NEXT x
t = TIMER - t
PRINT LEN(e$)
PRINT #1, " = "; e$
PRINT #1, "Das Ergebnis ist"; LEN(e$); "Stellig. von Rafael Friesen. Zeit:"; t; "sec"
CLOSE

