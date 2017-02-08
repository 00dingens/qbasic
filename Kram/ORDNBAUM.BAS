DECLARE SUB mach (s$)

ON ERROR GOTO e

CHDIR "c:\"
MKDIR "c:\x"
CHDIR "c:\x"
mach "c:\x"
SHELL "dir"

END


e:
RESUME NEXT

SUB mach (s$)
'PRINT s$
MKDIR s$
IF LEN(s$) < 18 THEN
 FOR x = 0 TO 9
  mach (s$ + "\" + LTRIM$(STR$(x)))
 NEXT x
ELSE
 OPEN s$ + "\file.txt" FOR OUTPUT AS #1
 FOR x = 1 TO INT(RND * 40)
  PRINT #1, CHR$(65 + INT(RND * 26) + INT(RND * 2) * 32);
 NEXT x
 CLOSE #1
 'PRINT "-> " + s$
END IF


END SUB

