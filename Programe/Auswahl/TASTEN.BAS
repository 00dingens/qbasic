
'Zeigt ASCII-Code der eingegebenen Tasten. Ende mit #

CLS
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 q = ASC(t$): b$ = ""
 FOR x = 1 TO 8
  b$ = STR$(q MOD 2) + b$: q = (q - (q MOD 2)) / 2
 NEXT x
 PRINT b$, ASC(t$)
LOOP UNTIL t$ = "#"

