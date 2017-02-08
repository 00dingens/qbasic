RANDOMIZE TIMER
neu:
SCREEN 12
anz = 2
DIM z(20, 20, 20) AS INTEGER
DIM a(anz, 4)
FOR x = 1 TO anz
 a(x, 0) = INT(RND * 20)
 a(x, 1) = INT(RND * 20)
 a(x, 2) = INT(RND * 20)
 a(x, 3) = INT(RND * 6)
 z(a(x, 0), a(x, 1), a(x, 2)) = 1
 ff = ff + 1
NEXT x
DO
FOR x = 1 TO anz
 z(a(x, 0), a(x, 1), a(x, 2)) = 1
 ff = ff + 1
 r = a(x, 3)
 q = 0
rich1:
 q = q + 1
 a(x, 3) = INT(RND * 6)
 IF r = (a(x, 3) + 3) MOD 3 THEN GOTO rich1
 xx = a(x, 0): yy = a(x, 1): zz = a(x, 2)
 SELECT CASE a(x, 3)
 CASE 0: xx = xx + 1
 CASE 1: yy = yy + 1
 CASE 2: zz = zz + 1
 CASE 3: xx = xx - 1
 CASE 4: yy = yy - 1
 CASE 5: zz = zz - 1
 END SELECT
 nn = 0
 IF xx > 20 THEN xx = 0: nn = 1
 IF xx < 0 THEN xx = 20: nn = 1
 IF yy > 20 THEN yy = 0: nn = 1
 IF yy < 0 THEN yy = 20: nn = 1
 IF zz > 20 THEN zz = 0: nn = 1
 IF zz < 0 THEN zz = 20: nn = 1

 IF z(xx, yy, zz) = 1 THEN
  IF q < 100 THEN
   GOTO rich1
  ELSE
   nn = 1
   DO
    a(x, 0) = INT(RND * 20)
    a(x, 1) = INT(RND * 20)
    a(x, 2) = INT(RND * 20)
    a(x, 3) = INT(RND * 6)
   LOOP WHILE z(a(x, 0), a(x, 1), a(x, 2)) = 1
   z(a(x, 0), a(x, 1), a(x, 2)) = 1
  ff = ff + 1
  END IF
 END IF
 LOCATE 1, 1: PRINT ff
 IF nn = 0 THEN
  LINE (a(x, 0) * 9 + a(x, 2) * 4, 470 - a(x, 1) * 9 - a(x, 2) * 4)-(xx * 9 + zz * 4, 470 - yy * 9 - zz * 4)
  LINE (300 + a(x, 0) * 9 + a(x, 2) * 2, 470 - a(x, 1) * 9 - a(x, 2) * 4)-(300 + xx * 9 + zz * 2, 470 - yy * 9 - zz * 4)
 ELSE
  PSET (a(x, 0) * 9 + a(x, 2) * 4, 470 - a(x, 1) * 9 - a(x, 2) * 4)
  PSET (300 + a(x, 0) * 9 + a(x, 2) * 2, 470 - a(x, 1) * 9 - a(x, 2) * 4)
  PSET (xx * 9 + zz * 4, 470 - yy * 9 - zz * 4)
  PSET (300 + xx * 9 + zz * 2, 470 - yy * 9 - zz * 4)
 END IF
 a(x, 0) = xx: a(x, 1) = yy: a(x, 2) = zz
NEXT x
'FOR t = 1 TO 10000: NEXT t
t$ = INKEY$
IF t$ = " " THEN CLS : t$ = ""
LOOP WHILE t$ = ""

