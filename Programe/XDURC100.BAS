FOR x1 = 1 TO 6
FOR x2 = 1 TO 6
FOR x3 = 1 TO 6
FOR x4 = 1 TO 6
FOR x5 = 1 TO 6
 z = x1 * x2 * x3 * x4 * x5
 a = a + 1
 IF z MOD 100 = 0 THEN PRINT x1; x2; x3; x4; x5, : b = b + 1

NEXT x5
NEXT x4
NEXT x3
NEXT x2
NEXT x1
PRINT a, b

