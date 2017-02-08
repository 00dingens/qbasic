OPEN "c:\windows\desktop\zahlen.txt" FOR OUTPUT AS #1

FOR z = 2 TO 13
 IF z MOD 2 = 1 THEN br = INT(SQR(2 ^ (z - 1))) ELSE br = INT(SQR(2 ^ (z - 2)))
 ll = LEN(STR$(2 ^ z))
 FOR y = 0 TO z - 1
  q = 0
  FOR x = 1 TO 2 ^ z - 1
   IF (x AND (2 ^ y)) = 2 ^ y THEN PRINT #1, RIGHT$(SPACE$(100) + STR$(x), ll); : q = q + 1
   IF q = br THEN PRINT #1, "": q = 0
  NEXT x
  PRINT #1, ""
  LOCATE 5, 1: PRINT z, y
 NEXT y
 PRINT #1, ""
 PRINT #1, ""
NEXT z
CLOSE

