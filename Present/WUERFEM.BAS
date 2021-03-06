
'Undurchsichtiger W�rfel dreht sich (mit 100 Bildern in 14 Sekunden)

RANDOMIZE TIMER
SCREEN 7, , 1, 0
e = 100
p = 2 * 3.14159265359#
DIM x(12, 4), y(12, 4), z(12, 4), r(12), f(12)
FOR i = 1 TO 12
 FOR t = 0 TO 4
  READ x(i, t), y(i, t), z(i, t)
  x(i, t) = x(i, t) * 20
  y(i, t) = y(i, t) * 20
  z(i, t) = z(i, t) * 20
 NEXT t
 READ f(i)
NEXT i
xd = p + .05: yd = p + .1: zd = p + .15
DO
 a1 = SIN(xd): a2 = COS(xd)
 b1 = SIN(yd): b2 = COS(yd)
 c1 = SIN(zd): c2 = COS(zd)
 FOR i = 1 TO 12
  FOR t = 0 TO 4
   yy = y(i, t) * a2 - z(i, t) * a1
   zz = y(i, t) * a1 + z(i, t) * a2
   y(i, t) = yy: z(i, t) = zz
   xx = x(i, t) * b2 - z(i, t) * b1
   zz = x(i, t) * b1 + z(i, t) * b2
   x(i, t) = xx: z(i, t) = zz
   xx = x(i, t) * c2 - y(i, t) * c1
   yy = x(i, t) * c1 + y(i, t) * c2
   x(i, t) = xx: y(i, t) = yy
  NEXT t
 NEXT i
 FOR t = 1 TO 12
  r(t) = t
 NEXT t
 FOR t = 1 TO 12
  FOR i = t + 1 TO 12
   IF z(r(t), 0) < z(r(i), 0) THEN SWAP r(t), r(i)
  NEXT i
 NEXT t
 CLS
 'PAINT (160, 100), 0, 0    'CLS dauert l�nger
 FOR t = 1 TO 12
  n = r(t)
  x1 = 160 + x(n, 1) / (z(n, 1) + e) * e
  y1 = 100 + y(n, 1) / (z(n, 1) + e) * e
  x2 = 160 + x(n, 2) / (z(n, 2) + e) * e
  y2 = 100 + y(n, 2) / (z(n, 2) + e) * e
  x3 = 160 + x(n, 3) / (z(n, 3) + e) * e
  y3 = 100 + y(n, 3) / (z(n, 3) + e) * e
  x4 = 160 + x(n, 4) / (z(n, 4) + e) * e
  y4 = 100 + y(n, 4) / (z(n, 4) + e) * e
  x0 = 160 + x(n, 0) / (z(n, 0) + e) * e
  y0 = 100 + y(n, 0) / (z(n, 0) + e) * e
  LINE (x1, y1)-(x2, y2), f(n)
  LINE (x2, y2)-(x3, y3), f(n)
  LINE (x3, y3)-(x4, y4), f(n)
  LINE (x4, y4)-(x1, y1), f(n)
  PAINT (x0, y0), f(n), f(n)
 NEXT t
 IF POINT(0, 0) = 0 THEN PCOPY 1, 0
 xd = xd + RND * .04 - .02
 IF xd < p - .15 THEN xd = p - .15
 IF xd > p + .15 THEN xd = p + .15
 yd = yd + RND * .04 - .02
 IF yd < p - .15 THEN yd = p - .15
 IF yd > p + .15 THEN yd = p + .15
 zd = zd + RND * .04 - .02
 IF zd < p - .15 THEN zd = p - .15
 IF zd > p + .15 THEN zd = p + .15
LOOP UNTIL INKEY$ = CHR$(27)



DATA   0,-1,-1, 0,-2,-2, 0,-2, 0, 0, 0, 0, 0, 0,-2, 9
DATA   0, 1,-1, 0, 2,-2, 0, 2, 0, 0, 0, 0, 0, 0,-2, 9
DATA   0,-1, 1, 0,-2, 2, 0,-2, 0, 0, 0, 0, 0, 0, 2, 9
DATA   0, 1, 1, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 9

DATA  -1,-1, 0,-2,-2, 0,-2, 0, 0, 0, 0, 0, 0,-2, 0,10
DATA   1,-1, 0, 2,-2, 0, 2, 0, 0, 0, 0, 0, 0,-2, 0,10
DATA  -1, 1, 0,-2, 2, 0,-2, 0, 0, 0, 0, 0, 0, 2, 0,10
DATA   1, 1, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0,10

DATA  -1, 0,-1,-2, 0,-2, 0, 0,-2, 0, 0, 0,-2, 0, 0,12
DATA  -1, 0, 1,-2, 0, 2, 0, 0, 2, 0, 0, 0,-2, 0, 0,12
DATA   1, 0,-1, 2, 0,-2, 0, 0,-2, 0, 0, 0, 2, 0, 0,12
DATA   1, 0, 1, 2, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0,12

