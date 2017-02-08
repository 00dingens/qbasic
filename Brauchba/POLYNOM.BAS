DEFDBL A-Z
CLS
ll = 3
DIM i(1000)
FOR x = 1 TO ll
 READ a
 IF a = -1000 THEN EXIT FOR
 i(x) = a
NEXT x
DIM u(-1 TO ll + 1)
u(0) = 1
FOR x = 1 TO ll
 FOR y = x TO 0 STEP -1
  u(y) = i(x) * u(y) + u(y - 1)
 NEXT y
NEXT x
FOR x = 0 TO ll
 IF x > 0 THEN PRINT " + ";
 PRINT LTRIM$(STR$(u(x)));
 IF x > 0 THEN PRINT "x";
 IF x > 1 THEN PRINT "^"; LTRIM$(STR$(x));
NEXT x

DATA -1,1,1,-1000
DATA -3.8, 4.1, 5.23, 2596, 756.43 ,2.125,-1000
DATA 1.25, .1, 23.23, 1596, 756.34 ,2.125,-1000

