DIM a(1000) AS STRING
OPEN "c:\windows\desktop\filme.txt" FOR INPUT AS #1
OPEN "c:\windows\desktop\filmsort.txt" FOR OUTPUT AS #2
DO
 LINE INPUT #1, z$
 i = i + 1
 a(i) = z$
LOOP UNTIL EOF(1)
FOR x = 1 TO i - 1
 FOR y = x TO i
  IF a(x) > a(y) THEN SWAP a(x), a(y)
 NEXT y
NEXT x
FOR y = 1 TO i
 PRINT #2, a(y)
NEXT y
CLOSE

