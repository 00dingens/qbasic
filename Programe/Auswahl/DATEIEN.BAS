
'Erstellt viele Dateien in c:\dateien

CLS
PRINT "               Was soll in den Dateien stehen? W„hle aus!"
PRINT : PRINT : PRINT
PRINT "1  :  Diese Datei brauchst du nicht l”schen, denn es lohnt sich nicht!"
PRINT "              Der Grund: Sie hat eine Gr”sse von NUR 140 Byte!"
PRINT
PRINT "2  :  L ™ S C H   M I C H !"
PRINT
PRINT "3  :"
PRINT "  (Garnichts - diese variante ist die schnellste)"
DO: t = VAL(INKEY$): LOOP UNTIL t < 4 AND t > 0

SELECT CASE t
 CASE 1: GOTO nr1
 CASE 2: GOTO nr2
 CASE 3: GOTO nr3
END SELECT
END

nr1:
MKDIR "C:\DATEIEN"
CHDIR "C:\DATEIEN"
a$ = "100"
DO
 OPEN "datei_nr." + a$ FOR OUTPUT AS #1
 PRINT #1, "        Diese Datei brauchst du nicht l”schen, denn es lohnt sich nicht!"
 PRINT #1, "                Der Grund: Sie hat eine Gr”sse von NUR 140 Byte!"
 CLOSE
 LOCATE 12, 38: PRINT a$
 a$ = RIGHT$(STR$(VAL(a$) + 1), 3)
LOOP WHILE INKEY$ = ""
CHDIR "C:\"
END

nr2:
MKDIR "C:\DATEIEN"
CHDIR "C:\DATEIEN"
a$ = "100"
DO
 OPEN "datei_nr." + a$ FOR OUTPUT AS #1
 PRINT #1, "L ™ S C H   M I C H !"
 CLOSE
 LOCATE 12, 38: PRINT a$
 a$ = RIGHT$(STR$(VAL(a$) + 1), 3)
LOOP WHILE INKEY$ = ""
CHDIR "C:\"
END

nr3:
MKDIR "C:\DATEIEN"
CHDIR "C:\DATEIEN"
a$ = "100"
DO
 OPEN "datei_nr." + a$ FOR OUTPUT AS #1
 CLOSE
 LOCATE 12, 38: PRINT a$
 a$ = RIGHT$(STR$(VAL(a$) + 1), 3)
LOOP WHILE INKEY$ = ""
CHDIR "C:\"
END

