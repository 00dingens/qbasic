DECLARE SUB ausgabe (a!())
'zur erstellung von zyklischen codes mittels erzeugendem polynom.

COMMON SHARED n
n = 17       'l„nge der Worte
DIM a(n)     'p(x)
DIM g(n)     'g(x)
DIM erg(2 ^ n) AS INTEGER
CLS

'g(x) einlesen
RESTORE gx
FOR x = 0 TO n - 1
 READ gg
 g(x) = gg
NEXT x

'g(x) anzeigen
PRINT "g(x) = ";
ausgabe g()
PRINT

FOR x = 0 TO (2 ^ n) - 1
 pp = x
 FOR y = 0 TO n - 1
  p(y) = pp MOD 2
  pp = INT(pp / 2)
 NEXT y
' ausgabe p()
' PRINT

NEXT x


'gx:
DATA 1, 0, 1  
   'l„nge 3; entspricht 1+x^2
gx:
DATA 1,0,0,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0

SUB ausgabe (a())
horst = 0
FOR x = 0 TO n - 1
 IF a(x) = 1 THEN
  IF horst = 1 THEN PRINT " + ";
  IF x > 0 THEN PRINT "x";  ELSE PRINT "1";
  IF x > 1 THEN PRINT "^"; LTRIM$(STR$(x));
  horst = 1
 END IF
NEXT x
END SUB

