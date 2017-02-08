OPEN "c:\windows\desktop\faktoren.txt" FOR OUTPUT AS #1
FOR p = 2 TO 100000
 LOCATE 1, 1: PRINT p
 PRINT #1, p;
 z = p
 DO
  FOR x = 2 TO z
   IF z MOD x = 0 THEN PRINT #1, x; : z = z / x: EXIT FOR
  NEXT x
 LOOP UNTIL z = 1
 PRINT #1, ""
NEXT p

