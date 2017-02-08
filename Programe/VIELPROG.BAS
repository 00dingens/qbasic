FOR x = 0 TO 999
 DATE$ = "12-31-1999": TIME$ = "23:59:59"
 OPEN "c:\a\programe\prog_" + RIGHT$("000" + LTRIM$(RTRIM$(STR$(x))), 3) + ".com" FOR OUTPUT AS #1
 PRINT #1, "Ã Dies ist ein Programm, das ohne Fehlermeldung abbricht!!!  ¸©Rafael Friesen. ´";
 CLOSE #1
 LOCATE 12, 39: PRINT x;
NEXT x

