DIM a(10000)
FOR x = 1 TO 100
 FOR y = 1 TO x
  z = INT(10000 * y / x)
  'PRINT z;
  a(z) = a(z) + 1
 NEXT y
 LOCATE 1, 1: PRINT x
NEXT x
OPEN "c:\windows\desktop\brueche.txt" FOR OUTPUT AS #1
FOR x = 1 TO 10000
 s$ = ""
 FOR y = 1 TO a(x)
  s$ = s$ + "-"
 NEXT y
 PRINT #1, s$
NEXT x
CLOSE

