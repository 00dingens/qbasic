DECLARE FUNCTION det! (index())
'errechnet determinante
DIM SHARED matrix(100, 100)
DIM aa(100)

COMMON SHARED size
size = 3: aa(0) = size: FOR x = 1 TO size: aa(x) = x: NEXT x
CLS

'einheitsmatrix
FOR x = 1 TO size: matrix(x, size - x + 1) = 1: NEXT x


'Matrix ausgeben
PRINT "Matrix:"
FOR x = 1 TO size
 FOR y = 1 TO size
  LOCATE y, x * 3: PRINT matrix(x, y)
 NEXT y
NEXT x

deter = det(aa())
PRINT "Determinante="; deter

FUNCTION det (index())
 DIM a(100)
 anz = index(0)
 a(0) = anz - 1
 STATIC determinante
 determinante = 0
 IF anz = 0 THEN
  determinante = 1
  'PRINT "1";
 ELSE
  FOR x = 1 TO anz - 1
   a(x) = index(x + 1)
  NEXT x
 
  FOR x = 1 TO anz
   IF x > 1 THEN a(x - 1) = index(x - 1)
   'COLOR 3: FOR z = 1 TO anz - 1: PRINT "a("; z; ")="; a(z); : NEXT z: PRINT : COLOR 7
   IF x MOD 2 = 0 THEN vorz = -1 ELSE vorz = 1
   IF x > 1 AND vorz = 1 THEN PRINT "+";
   IF x > 1 AND vorz = -1 THEN PRINT "-";
   PRINT : PRINT SPACE$(size - anz);
   PRINT "("; matrix(index(x), anz);
   COLOR 4: PRINT determinante; : COLOR 7
   IF anz > 1 THEN PRINT "*";
   dete = det(a())
   PRINT ")";
   determinante = determinante + vorz * matrix(index(x), anz) * dete
   'COLOR 4: PRINT determinante; : COLOR 7


   'PRINT dete
'   LOCATE anz, x * 3: PRINT matrix(x, anz)
  NEXT x
 END IF
det = determinante
END FUNCTION

