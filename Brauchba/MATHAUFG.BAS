anz = 6
mm = 31
DIM a(anz)
DIM i(mm)
FOR x = 1 TO anz - 1
 READ a(x)
NEXT x
FOR q = 0 TO mm
 FOR x = 0 TO mm
  i(x) = 0
 NEXT x
 a(anz) = q
 CLS
 FOR x = 1 TO anz
  FOR y = 1 TO anz
   LOCATE x, y * 3
   t = (mm + a(x) - a(y)) MOD mm
   PRINT t
   i(t) = i(t) + 1
  NEXT y
 NEXT x
 PRINT
 er = 1
 FOR x = 1 TO mm - 1
  PRINT x; i(x),
  IF i(x) <> 1 THEN er = 0
  'IF i(x) <> 0 AND i(x) <> 2 THEN er = 0
 NEXT x
 IF er = 1 THEN DO: LOOP WHILE INKEY$ = ""
 'DO: LOOP WHILE INKEY$ = ""
NEXT q

DATA 1,5,24,25,27
DATA 0,2,3,4,8

