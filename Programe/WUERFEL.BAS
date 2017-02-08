
'Undurchsichtige WÅrfel drehen sich (mit 1 Bild in 0,3 Sekunden)

RANDOMIZE TIMER
SCREEN 7, , 1, 0
e = 200
p = 2 * 3.14159265359#
g = 10
DIM x(6, 4), y(6, 4), z(6, 4), r(6)
FOR i = 1 TO 6
 FOR t = 0 TO 4
  READ x(i, t), y(i, t), z(i, t)
  x(i, t) = x(i, t) * g
  y(i, t) = y(i, t) * g
  z(i, t) = z(i, t) * g
 NEXT t
NEXT i
xd = p + .05: yd = p + .1: zd = p + .15
DO
 a1 = SIN(xd): a2 = COS(xd)
 b1 = SIN(yd): b2 = COS(yd)
 c1 = SIN(zd): c2 = COS(zd)
 FOR i = 1 TO 6
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
 FOR t = 1 TO 6
  r(t) = t
 NEXT t
 FOR t = 1 TO 6
  FOR i = t + 1 TO 6
   IF z(r(t), 0) < z(r(i), 0) THEN SWAP r(t), r(i)
  NEXT i
 NEXT t
 CLS 'PAINT (160, 100), 0, 0    'CLS dauert lÑnger
 FOR t = 1 TO 6
  n = r(t)
  x1 = x(n, 1) / (z(n, 1) + e) * e
  y1 = y(n, 1) / (z(n, 1) + e) * e
  x2 = x(n, 2) / (z(n, 2) + e) * e
  y2 = y(n, 2) / (z(n, 2) + e) * e
  x3 = x(n, 3) / (z(n, 3) + e) * e
  y3 = y(n, 3) / (z(n, 3) + e) * e
  x4 = x(n, 4) / (z(n, 4) + e) * e
  y4 = y(n, 4) / (z(n, 4) + e) * e
  x0 = x(n, 0) / (z(n, 0) + e) * e
  y0 = y(n, 0) / (z(n, 0) + e) * e
  FOR xa = g * 2 TO 320 STEP g * 4
   FOR xb = g * 2 TO 200 STEP g * 4
    LINE (xa + x1, xb + y1)-(xa + x2, xb + y2), n
    LINE (xa + x2, xb + y2)-(xa + x3, xb + y3), n
    LINE (xa + x3, xb + y3)-(xa + x4, xb + y4), n
    LINE (xa + x4, xb + y4)-(xa + x1, xb + y1), n
    PAINT (xa + x0, xb + y0), n, n
   NEXT xb
  NEXT xa
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



DATA  0, 0,-1,-1,-1,-1, 1,-1,-1, 1, 1,-1,-1, 1,-1
DATA  0, 0, 1,-1,-1, 1, 1,-1, 1, 1, 1, 1,-1, 1, 1
DATA  0,-1, 0,-1,-1,-1, 1,-1,-1, 1,-1, 1,-1,-1, 1
DATA  0, 1, 0,-1, 1,-1, 1, 1,-1, 1, 1, 1,-1, 1, 1
DATA -1, 0, 0,-1,-1,-1,-1,-1, 1,-1, 1, 1,-1, 1,-1
DATA  1, 0, 0, 1,-1,-1, 1,-1, 1, 1, 1, 1, 1, 1,-1

