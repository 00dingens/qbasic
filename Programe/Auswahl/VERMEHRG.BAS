ON ERROR GOTO 1
CHDIR "c:\"
MKDIR "a"
CHDIR "c:\a\"
q$ = CHR$(34)
OPEN "c:\a\prog000.bas" FOR OUTPUT AS #1
PRINT #1, "a$ = " + q$ + "000" + q$
PRINT #1, "LOCATE 12, 38: PRINT a$"
PRINT #1, "b$ = RIGHT$(" + q$ + "000" + q$ + " + RTRIM$(LTRIM$(STR$(VAL(a$) + 1))), 3)"
PRINT #1, "q$ = CHR$(34)"
PRINT #1, "OPEN " + q$ + "c:\a\pro" + q$ + " + a$ + " + q$ + ".bas" + q$ + " FOR OUTPUT AS #1"
PRINT #1, "PRINT #1, " + q$ + "OPEN " + q$ + " + q$ + " + q$ + "c:\a\prog" + q$ + " + a$ + " + q$ + ".bas" + q$ + " + q$ + " + q$ + " FOR INPUT AS #1"
PRINT #1, "PRINT #1, " + q$ + "OPEN " + q$ + " + q$ + " + q$ + "c:\a\prog" + q$ + " + b$ + " + q$ + ".bas" + q$ + " + q$ + " + q$ + " FOR OUTPUT AS #2" + q$
PRINT #1, "PRINT #1, " + q$ + "LINE INPUT #1, a$" + q$
PRINT #1, "PRINT #1, " + q$ + "PRINT #2, " + q$ + " + q$ + " + q$ + "a$ = " + q$ + " + q$ + " + q$ + " + CHR$(34) + " + q$ + " + q$ + b$ + q$ + " + q$ + " + CHR$(34)" + q$
PRINT #1, "PRINT #1, " + q$ + "DO" + q$
PRINT #1, "PRINT #1, " + q$ + " LINE INPUT #1, a$" + q$
PRINT #1, "PRINT #1, " + q$ + " PRINT #2, a$" + q$
PRINT #1, "PRINT #1, " + q$ + "LOOP WHILE NOT EOF(1)" + q$ + ""
PRINT #1, "PRINT #1, " + q$ + "CLOSE" + q$
PRINT #1, "PRINT #1, " + q$ + "RUN " + q$ + " + q$ + " + q$ + "c:\a\prog" + q$ + " + b$ + " + q$ + ".bas" + q$ + " + q$"
PRINT #1, "CLOSE"
PRINT #1, "RUN " + q$ + "c:\a\pro" + q$ + " + a$ + " + q$ + ".bas" + q$
CLOSE
RUN "c:\a\prog000.bas"
END
1 RESUME NEXT

