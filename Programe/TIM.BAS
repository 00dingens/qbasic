ON ERROR GOTO e
DO
 t$ = INKEY$
 IF t$ = CHR$(27) THEN END
 IF LEN(t$) = 1 THEN SOUND ASC(t$) * 100 - 7000, 2
LOOP
END
e: t$ = "A": RESUME

