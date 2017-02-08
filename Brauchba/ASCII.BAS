CLS
FOR x = 1 TO 255
 PRINT RIGHT$("     " + STR$(x) + " ", 5);
 IF x <> 12 AND x <> 29 AND x <> 30 AND x <> 9 AND x <> 31 AND x <> 11 AND x <> 10 AND x <> 7 THEN
  PRINT CHR$(x);
 ELSE
  PRINT " ";
 END IF
NEXT x

