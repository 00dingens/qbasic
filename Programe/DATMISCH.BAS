DIM i(11)
'CLS
SCREEN 12
FOR x = 1 TO 11
 i(x) = 65
NEXT x
DO
 ii = ii + 1

 i(1) = i(1) + 1
 IF i(1) > 90 THEN i(1) = 65: i(2) = i(2) - 1': LOCATE 1, 1: PRINT a$; CDBL(ii)
 i(2) = i(2) + 1
 IF i(2) > 100 THEN i(2) = 65: i(3) = i(3) - 1
 i(3) = i(3) + 1
 IF i(3) > 100 THEN i(3) = 65: i(4) = i(4) - 1
 i(4) = i(4) + 1
 IF i(4) > 100 THEN i(4) = 65: i(5) = i(5) - 1
 i(5) = i(5) + 1
 IF i(5) > 100 THEN i(5) = 65': i(6) = i(6) - 1

 a$ = CHR$(i(1))
 IF i(2) < 91 THEN a$ = a$ + CHR$(i(2)) ELSE a$ = a$ + CHR$(i(2) - 43)
 IF i(3) < 91 THEN a$ = a$ + CHR$(i(3)) ELSE a$ = a$ + CHR$(i(3) - 43)
 IF i(4) < 91 THEN a$ = a$ + CHR$(i(4)) ELSE a$ = a$ + CHR$(i(4) - 43)
 IF i(5) < 91 THEN a$ = a$ + CHR$(i(5)) ELSE a$ = a$ + CHR$(i(5) - 43)
LOOP UNTIL a$ = "AAAAA"
PRINT ii

