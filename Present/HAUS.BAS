
'Undurchsichtiges Haus dreht sich

RANDOMIZE TIMER
SCREEN 7, , 1, 0
e = 500
p = 2 * 3.14159265359#
READ ss
DIM x(ss, 4), y(ss, 4), z(ss, 4), r(ss)
FOR i = 1 TO ss
 FOR t = 0 TO 4
  READ x(i, t), y(i, t), z(i, t)
  x(i, t) = x(i, t) * 40
  y(i, t) = y(i, t) * 40
  z(i, t) = z(i, t) * 40
 NEXT t
NEXT i
xd = p: yd = p: zd = p
DO
 a1 = SIN(xd): a2 = COS(xd)
 b1 = SIN(yd): b2 = COS(yd)
 c1 = SIN(zd): c2 = COS(zd)
 FOR i = 1 TO ss
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
 FOR t = 1 TO ss
  r(t) = t
 NEXT t
 FOR t = 1 TO ss
  FOR i = t + 1 TO ss
   IF z(r(t), 0) < z(r(i), 0) THEN SWAP r(t), r(i)
  NEXT i
 NEXT t
 PAINT (160, 100), 0, 0    'CLS dauert l„nger
 FOR t = 1 TO ss
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
  LINE (x1, y1)-(x2, y2), n
  LINE (x2, y2)-(x3, y3), n
  LINE (x3, y3)-(x4, y4), n
  LINE (x4, y4)-(x1, y1), n
  PAINT (x0, y0), n, n
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


DATA 11
DATA   0, 0,-1,-1,-1,-1, 1,-1,-1, 1, 1,-1,-1, 1,-1
DATA   0, 0, 1,-1,-1, 1, 1,-1, 1, 1, 1, 1,-1, 1, 1
DATA -.5,-1.5, 0,-1,-1,-1, 0,-2,-1, 0,-2, 1,-1,-1, 1
DATA  .5,-1.5, 0, 1,-1,-1, 0,-2,-1, 0,-2, 1, 1,-1, 1
DATA   0, 1, 0,-1, 1,-1, 1, 1,-1, 1, 1, 1,-1, 1, 1
DATA  -1, 0, 0,-1,-1,-1,-1,-1, 1,-1, 1, 1,-1, 1,-1
DATA   1, 0, 0, 1,-1,-1, 1,-1, 1, 1, 1, 1, 1, 1,-1

DATA -.6,-1.75,0,-.6,-1.4,-.1,-.6,-1.4,.1,-.6,-2.1,.1,-.6,-2.1,-.1
DATA -.4,-1.85,0,-.4,-1.6,-.1,-.4,-1.6,.1,-.4,-2.1,.1,-.4,-2.1,-.1
DATA -.5,-1.8,-.1,-.6,-1.4,-.1,-.4,-1.6,-.1,-.4,-2.1,-.1,-.6,-2.1,-.1
DATA -.5,-1.8,.1,-.6,-1.4,.1,-.4,-1.6,.1,-.4,-2.1,.1,-.6,-2.1,.1

