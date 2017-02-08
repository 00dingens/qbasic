CLS
INPUT "Gib den exponent an:", po
INPUT "Soll das ergebnis in eine Datei geschrieben werden"; jn$
CLS
a$ = "1"
FOR x = 1 TO po
 v = 0
 FOR t = LEN(a$) TO 1 STEP -1
  b = VAL(MID$(a$, t, 1))
  b = b * 2 + v
  IF b > 9 THEN v = 1 ELSE v = 0
  b = b MOD 10
  MID$(a$, t, 1) = RTRIM$(LTRIM$(STR$(b)))
 NEXT t
 IF v = 1 THEN a$ = "1" + a$
 LOCATE 1, 1: PRINT x
NEXT x
CLS
PRINT "2 ^" + STR$(po) + " = " + a$
IF jn$ = "j" THEN
 OPEN "C:\WINDOWS\DESKTOP\zweihoch.txt" FOR OUTPUT AS #1
 PRINT #1, "2 ^" + STR$(po) + " = " + a$
 PRINT #1, "Das sind" + STR$(LEN(a$)) + " Stellen."
 CLOSE
 PRINT "Dies steht nun in der Datei C:\WINDOWS\DESKTOP\zweihoch.txt"
END IF
PRINT "Das sind" + STR$(LEN(a$)) + " Stellen."

