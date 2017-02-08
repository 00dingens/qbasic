FOR x1 = 1 TO 48
 LOCATE 1, 1: PRINT x1;
 FOR x2 = x1 + 1 TO 49
  LOCATE 1, 5: PRINT x2;
  FOR x3 = x2 + 1 TO 50
   LOCATE 1, 9: PRINT x3;
   FOR x4 = x3 + 1 TO 51
    LOCATE 1, 13: PRINT x4;
    FOR x5 = x4 + 1 TO 52
     LOCATE 1, 17: PRINT x5;
     a = a + 1
     LOCATE 2, 1: PRINT a;
    NEXT x5
   NEXT x4
  NEXT x3
 NEXT x2
 LOCATE 1, 1: PRINT x1
NEXT x1
PRINT a

