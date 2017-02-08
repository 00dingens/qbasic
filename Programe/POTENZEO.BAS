CLS
INPUT "Gib den exponent an:", po
INPUT "Soll das ergebnis in eine Datei geschrieben werden"; jn$
DIM a(32000) AS INTEGER
CLS
a(0) = 1
a(1) = 1
FOR x = 1 TO po
 v = 0
 FOR t = 1 TO a(0)
  b = a(t)
  b = b * 2 + v
  IF b > 9 THEN
   v = 1
   b = b MOD 10
  ELSE
   v = 0
  END IF
  a(t) = b
 NEXT t
 IF v = 1 THEN a(0) = a(0) + 1: a(a(0)) = 1
 LOCATE 1, 1: PRINT x
NEXT x
CLS
PRINT "2 ^" + STR$(po) + " = ";
FOR x = a(0) TO 1 STEP -1
 PRINT LTRIM$(RTRIM$(STR$(a(x))));
NEXT x
PRINT
IF jn$ = "j" THEN
 OPEN "C:\WINDOWS\DESKTOP\zweihoch.txt" FOR APPEND AS #1
 PRINT #1, "2 ^" + STR$(po) + " = ";
 FOR x = a(0) TO 1 STEP -1
  PRINT #1, LTRIM$(RTRIM$(STR$(a(x))));
 NEXT x
 PRINT #1, ""
 PRINT #1, "Das sind"; a(0); " Stellen."
 CLOSE
 PRINT "Dies steht nun in der Datei C:\WINDOWS\DESKTOP\zweihoch.txt"
END IF
PRINT "Das sind"; a(0); " Stellen."

