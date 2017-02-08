RANDOMIZE TIMER
ON ERROR GOTO er
DIM x(100, 2), y(100, 2), z(100, 2), a(100, 2), b(100, 2), c(100, 2), cc(100)
nr = 2
los:
SCREEN 9, , 0, 1
fl = nr
FOR t = 1 TO fl
 FOR r = 0 TO 2
  x(t, r) = INT(RND * 638 + 1)
  y(t, r) = INT(RND * 348 + 1)
  z(t, r) = INT(RND * 99 + 1)
  a(t, r) = INT(RND * 11 - 5)
  b(t, r) = INT(RND * 11 - 5)
  c(t, r) = INT(RND * 7 - 3)
 NEXT r
 cc(t) = t MOD 15


 x(t, 1) = x(t, 1) - x(t, 0)
 y(t, 1) = y(t, 1) - y(t, 0)
 z(t, 1) = z(t, 1) - z(t, 0)
 x(t, 2) = x(t, 2) - x(t, 0)
 y(t, 2) = y(t, 2) - y(t, 0)
 z(t, 2) = z(t, 2) - z(t, 0)
NEXT t

cc(0) = 15
sx = 0: sy = 0: ex = 639: ey = 349: ss = 2

DO
CLS
FOR a = sx TO ex STEP ss
 FOR b = sy TO ey STEP ss
  zzz = 1000: ff = 0
  FOR t = 1 TO fl
  
   n = (y(t, 2) * (a - x(t, 0)) + x(t, 2) * (y(t, 0) - b)) / (x(t, 1) * y(t, 2) - x(t, 2) * y(t, 1))
   m = (y(t, 1) * (a - x(t, 0)) + x(t, 1) * (y(t, 0) - b)) / (x(t, 2) * y(t, 1) - x(t, 1) * y(t, 2))
  
   IF n < 0 OR m < 0 OR n + m > 1 THEN GOTO nf
   zz = z(t, 0) + n * z(t, 1) + m * z(t, 2)
   IF zz < zzz THEN zzz = zz: ff = t
nf:
  NEXT t
  IF ss = 1 THEN PSET (a, b), cc(ff) ELSE LINE (a - ss / 2, b - ss / 2)-STEP(ss - 1, ss - 1), cc(ff), BF
 NEXT b
NEXT a

 FOR t = 1 TO fl
   x(t, 0) = x(t, 0) + a(t, 0)
   IF x(t, 0) < 1 OR x(t, 0) > 638 THEN x(t, 0) = x(t, 0) - a(t, 0): a(t, 0) = INT(RND * 5) * -SGN(a(t, 0))
   y(t, 0) = y(t, 0) + b(t, 0)
   IF y(t, 0) < 1 OR y(t, 0) > 348 THEN y(t, 0) = y(t, 0) - b(t, 0): b(t, 0) = INT(RND * 5) * -SGN(b(t, 0))
   z(t, 0) = z(t, 0) + c(t, 0)
   IF z(t, 0) < 1 OR z(t, 0) > 99 THEN z(t, 0) = z(t, 0) - c(t, 0): c(t, 0) = INT(RND * 3) * -SGN(c(t, 0))
  FOR u = 1 TO 2
   x(t, u) = x(t, u) + a(t, u)
   IF x(t, u) - x(t, 0) < 1 OR x(t, u) - x(t, 0) > 638 THEN x(t, u) = x(t, u) - a(t, u): a(t, u) = a(t, u)
   y(t, u) = y(t, u) + b(t, u)
   IF y(t, u) - y(t, 0) < 1 OR y(t, u) - y(t, 0) > 348 THEN y(t, u) = y(t, u) - b(t, u): b(t, u) = -b(t, u)
   z(t, u) = z(t, u) + c(t, u)
   IF z(t, u) - z(t, 0) < 1 OR z(t, u) - z(t, 0) > 99 THEN z(t, u) = z(t, u) - c(t, u): c(t, u) = -c(t, u)
  NEXT u
 NEXT t
PCOPY 0, 1

LOOP WHILE INKEY$ = ""

END
er: RESUME NEXT

