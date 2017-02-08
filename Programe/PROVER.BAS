SCREEN 12
DIM a(480)
LINE (0, 0)-(90, 480), 15, BF
FOR x = 0 TO 479
 FOR y = 0 TO 479
  a(y) = 15
 NEXT y
 FOR y = 0 TO x
1 z = INT(RND * 480)
  IF a(z) = 0 THEN GOTO 1
  a(z) = 0
 NEXT y
 FOR y = 0 TO 479
  PSET (x + 90, y), a(y)
 NEXT y
NEXT x
SLEEP

