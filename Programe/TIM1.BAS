SCREEN 7
start:
CLS
b$ = ""
DO
 DO: t$ = INKEY$: LOOP WHILE t$ <> ""
 b$ = b$ + STR$(INT(RND * 9 + 1))
 CLS
 LOCATE 5, 5: PRINT b$
 t = TIMER
 DO: LOOP UNTIL t + 2 < TIMER
 CLS
 FOR q = 1 TO LEN(b$)
  DO: t$ = INKEY$: LOOP WHILE t$ = ""
  PRINT t$, b$
 
  IF t$ <> MID$(b$, q, 1) THEN BEEP: GOTO start
 NEXT q
LOOP
GOTO start

