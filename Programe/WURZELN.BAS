OPEN "c:\windows\desktop\wurz.txt" FOR OUTPUT AS #1
FOR x = 1 TO 200
 PRINT #1, RIGHT$("   " + STR$(x), 3); "=";
 IF x < 100 THEN PRINT #1, USING "#.####"; SQR(x) ELSE PRINT #1, USING "##.####"; SQR(x)
NEXT x
CLOSE

