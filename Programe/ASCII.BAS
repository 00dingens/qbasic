s$ = "www.rafaelfriesen.de.vu"

OPEN "c:\ascii.txt" FOR OUTPUT AS #1
FOR x = 1 TO LEN(s$)
 PRINT #1, ASC(MID$(s$, x, 1));
NEXT x
CLOSE

