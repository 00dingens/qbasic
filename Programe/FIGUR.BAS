DECLARE SUB strich (x1!, y1!, z1!, x2!, y2!, z2!, col!)
DIM x(23), y(23), z(23), v(1, 23), cc(23)
SCREEN 9, , 0, 1
rx = .8
e = 20
RESTORE punkte
r1 = SIN(rx): r2 = COS(rx)
FOR t = 0 TO 7
 READ xx, yy, zz
 x(t) = xx
 y(t) = yy * r2 - zz * r1
 z(t) = yy * r1 + zz * r2
NEXT t

RESTORE linien
FOR t = 0 TO 7
 READ v1, v2
 v(0, t) = v1
 v(0, t + 8) = v1 + 8
 v(0, t + 16) = v1 + 16
 v(1, t) = v2
 v(1, t + 8) = v2 + 8
 v(1, t + 16) = v2 + 16
 cc(t) = 9
 cc(t + 8) = 10
 cc(t + 16) = 12

NEXT t

w = 3.14159265# * 2 / 3
a1 = SIN(w / 5): a2 = COS(w / 5)
b1 = SIN(w): b2 = COS(w)

DO
 FOR t = 0 TO 7
   xx = x(t) * a2 - z(t) * a1
   zz = x(t) * a1 + z(t) * a2
   x(t) = xx: z(t) = zz
   xx = x(t) * b2 - z(t) * b1
   zz = x(t) * b1 + z(t) * b2
   x(t + 8) = xx: z(t + 8) = zz
   xx = x(t + 8) * b2 - z(t + 8) * b1
   zz = x(t + 8) * b1 + z(t + 8) * b2
   x(t + 16) = xx: z(t + 16) = zz
   y(t + 8) = y(t): y(t + 16) = y(t)
 NEXT t
 CLS
 PAINT (0, 0), 15
 FOR t = 0 TO 22
  FOR g = t + 1 TO 23
   IF (z(v(0, t)) + z(v(1, t))) / 2 < (z(v(0, g)) + z(v(1, g))) / 2 THEN
    SWAP v(0, t), v(0, g)
    SWAP v(1, t), v(1, g)
    SWAP cc(t), cc(g)
   END IF
  NEXT g
 NEXT t
 FOR t = 0 TO 23
  'LINE (160 + 15 * x(v(0, t)) * e / (e + z(v(0, t))), 100 + 15 * y(v(0, t)) * e / (e + z(v(0, t))))-(160 + 15 * x(v(1, t)) * e / (e + z(v(1, t))), 100 + 15 * y(v(1, t)) * e / (e + z(v(1, t))))
 
  strich x(v(0, t)), y(v(0, t)), z(v(0, t)), x(v(1, t)), y(v(1, t)), z(v(1, t)), cc(t)
 NEXT t
 PCOPY 0, 1
 DO: LOOP UNTIL INKEY$ = " "
LOOP
punkte:
DATA  1, 4,0
DATA  1, 2,0
DATA -1, 1,0
DATA -1,-1,0
DATA  3, 1,0
DATA  3,-1,0
DATA  1,-2,0
DATA  1,-4,0

linien:
DATA 0,1, 1,2, 2,3, 3,6, 1,4, 4,5, 5,6, 6,7

SUB strich (x1, y1, z1, x2, y2, z2, col)
e = 10
lin = 30
dd = 16
x3 = (x2 - x1) / lin
y3 = (y2 - y1) / lin
z3 = (z2 - z1) / lin
FOR t = 0 TO lin
 x = x1 + t * x3: y = y1 + t * y3: z = z1 + t * z3
 xx = 180 + 35 * x * e / (z + e)
 yy = 150 + 35 * y * e / (z + e)
 d = dd * e / (z + e)
 CIRCLE (xx, yy), d, 15
 'PAINT (xx, yy), col, 15
 CIRCLE (xx, yy), d, col
NEXT t
END SUB

