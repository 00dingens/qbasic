q$ = "Hallo, Wie geht's? "
a = 1: s = 1
SCREEN 12
COLOR 15
FOR c = 1 TO LEN(q$)
 LOCATE 3, c
 PRINT MID$(q$, c, 1)
 LOCATE 28, 79
 PRINT MID$(q$, c, 1)
 FOR x = 1 TO 7
  d = 0
  FOR y = 1 TO 15
   IF POINT(x + 624, y + 432) = 15 THEN PSET (a, s + y), 15: d = 1
  NEXT y
  IF d = 1 THEN a = a + 1
 NEXT x
 a = a + 1
 IF MID$(q$, c, 1) = " " THEN a = a + 1
NEXT c

