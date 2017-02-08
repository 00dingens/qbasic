CLS
x = 12: z = 12
LOCATE 12, 29: PRINT "² ²"
DO
 LOCATE 10, 30: PRINT x, z
 LOCATE 12, 30, 1, x, z
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": x = x MOD 31 + 1
 CASE CHR$(0) + "P": x = (x + 29) MOD 31 + 1
 CASE CHR$(0) + "M": z = z MOD 31 + 1
 CASE CHR$(0) + "K": z = (z + 29) MOD 31 + 1
 CASE ELSE: END
 END SELECT
LOOP

