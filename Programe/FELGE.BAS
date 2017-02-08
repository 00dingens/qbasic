SCREEN 12
a = 17: b = 8
DIM x(5000), y(5000)
los:
CLS
p = 3.141592 * 2 / a
FOR q = 0 TO a
 x(q) = 230 * SIN(p * q)
 y(q) = 230 * COS(p * q)
NEXT q
FOR q = 0 TO a
 LINE (320 + x(q), 240 + y(q))-(320 + x((q + b) MOD a), 240 + y((q + b) MOD a))
NEXT q
DO: t$ = INKEY$: LOOP WHILE t$ = ""
IF t$ = CHR$(0) + "H" THEN a = a + 1: GOTO los
IF t$ = CHR$(0) + "P" THEN a = a - 1: GOTO los
IF t$ = CHR$(0) + "K" THEN b = b - 1: GOTO los
IF t$ = CHR$(0) + "M" THEN b = b + 1: GOTO los

