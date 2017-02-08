FOR x = 1 TO 999
 a$ = a$ + CHR$(1)
NEXT x
a$ = a$ + CHR$(2)
OPEN "smile.exe" FOR OUTPUT AS #1
FOR x = 1 TO 1000
 PRINT #1, a$;
 LOCATE 1, 1: PRINT USING "####"; x
NEXT x
CLOSE

