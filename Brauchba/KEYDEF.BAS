CLS
PRINT "Ende mit A"
PRINT "DrÅcke eine Taste!"
DO
 t$ = INKEY$
 IF t$ <> "" THEN
  FOR x = 1 TO LEN(t$)
   PRINT ASC(MID$(t$, x, 1));
  NEXT x
  PRINT "          ";
  FOR x = 1 TO LEN(t$)
   PRINT MID$(t$, x, 1);
  NEXT x
  PRINT
 END IF
LOOP UNTIL t$ = "A"

