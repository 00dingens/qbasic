DEFDBL A-Z
pi = 3.141592653589# / 30
SCREEN 9, , 0, 1
DO
CLS
tt$ = TIME$
MID$(tt$, 7, 2) = RIGHT$("00" + LTRIM$(STR$((60 - VAL(RIGHT$(tt$, 2))) MOD 60)), 2)
IF MID$(tt$, 7, 2) = "00" THEN mmm = 60 ELSE mmm = 59
MID$(tt$, 4, 2) = RIGHT$("00" + LTRIM$(STR$((mmm - VAL(MID$(tt$, 4, 2))) MOD 60)), 2)
IF MID$(tt$, 4, 2) = "00" AND mmm = 60 THEN mmm = 24 ELSE mmm = 23
MID$(tt$, 1, 2) = RIGHT$("00" + LTRIM$(STR$((mmm - VAL(MID$(tt$, 1, 2))) MOD 24)), 2)
IF TIME$ = "00:00:00" THEN tt$ = "24:00:00"
IF TIME$ = "24:00:00" THEN tt$ = "00:00:00"
'normale zahlen
LOCATE 17, 10: PRINT TIME$
LOCATE 17, 47: PRINT tt$
LOCATE 18, 10: PRINT CLNG(TIMER)
LOCATE 18, 47: PRINT CLNG(86400 - TIMER)
LOCATE 19, 10: PRINT TIMER
LOCATE 19, 47: PRINT CSNG(86400 - TIMER)
'zeiger
FOR t = 0 TO 59
 IF t MOD 15 = 0 THEN LINE (SIN(t * pi) * 100 + 100, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 80 + 100, COS(t * pi) * 80 + 100)
 IF t MOD 5 = 0 THEN LINE (SIN(t * pi) * 100 + 100, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 90 + 100, COS(t * pi) * 90 + 100) ELSE LINE (SIN(t * pi) * 100 + 100, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 95 + 100, COS(t * pi) * 95 + 100)
 IF t MOD 15 = 0 THEN LINE (SIN(t * pi) * 100 + 400, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 80 + 400, COS(t * pi) * 80 + 100)
 IF t MOD 5 = 0 THEN LINE (SIN(t * pi) * 100 + 400, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 90 + 400, COS(t * pi) * 90 + 100) ELSE LINE (SIN(t * pi) * 100 + 400, COS(t * pi) * 100 + 100)-(SIN(t * pi) * 95 + 400, COS(t * pi) * 95 + 100)
NEXT t
LINE (100, 100)-STEP(SIN(pi * TIMER * 60) * 100, -COS(pi * TIMER * 60) * 100), 8
LINE (100, 100)-STEP(SIN(pi * TIMER) * 90, -COS(pi * TIMER) * 90), 4
LINE (100, 100)-STEP(SIN(pi * TIMER / 60) * 80, -COS(pi * TIMER / 60) * 80), 7
LINE (100, 100)-STEP(SIN(pi * TIMER / 1440) * 60, -COS(pi * TIMER / 1440) * 60), 15
LINE (400, 100)-STEP(-SIN(pi * TIMER * 60) * 100, -COS(pi * TIMER * 60) * 100), 8
LINE (400, 100)-STEP(-SIN(pi * TIMER) * 90, -COS(pi * TIMER) * 90), 4
LINE (400, 100)-STEP(-SIN(pi * TIMER / 60) * 80, -COS(pi * TIMER / 60) * 80), 7
LINE (400, 100)-STEP(-SIN(pi * TIMER / 1440) * 60, -COS(pi * TIMER / 1440) * 60), 15


PCOPY 0, 1
LOOP WHILE INKEY$ = ""

