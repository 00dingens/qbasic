RANDOMIZE TIMER
SCREEN 7, , 1, 0
s = .02                 'speed
e = 200                 'entfernung
p = 2 * 3.14159265359#
g = .065                 'fl„chengr”áe
ss = .5                 'verschiebung der fl„chen nach aussen
DIM x(20, 3), y(20, 3), z(20, 3), r(20), c(20)
FOR i = 1 TO 20
 FOR t = 1 TO 3
  READ x(i, t), y(i, t), z(i, t)
  x(i, t) = x(i, t) * g
  y(i, t) = y(i, t) * g
  z(i, t) = z(i, t) * g
 NEXT t
 READ c(i)
 x(i, 0) = (x(i, 1) + x(i, 2) + x(i, 3)) / 3
 y(i, 0) = (y(i, 1) + y(i, 2) + y(i, 3)) / 3
 z(i, 0) = (z(i, 1) + z(i, 2) + z(i, 3)) / 3
NEXT i

'fl„chen nach aussen verschieben
FOR i = 1 TO 20
 FOR t = 1 TO 3
  x(i, t) = x(i, t) + x(i, 0) * ss
  y(i, t) = y(i, t) + y(i, 0) * ss
  z(i, t) = z(i, t) + z(i, 0) * ss
 NEXT t
 x(i, 0) = x(i, 0) + x(i, 0) * ss
 y(i, 0) = y(i, 0) + y(i, 0) * ss
 z(i, 0) = z(i, 0) + z(i, 0) * ss
NEXT i

xd = p + .05: yd = p + .1: zd = p + .15
DO
 a1 = SIN(xd): a2 = COS(xd)
 b1 = SIN(yd): b2 = COS(yd)
 c1 = SIN(zd): c2 = COS(zd)
 FOR i = 1 TO 20
  FOR t = 0 TO 3
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

FOR xx = 0 TO 319
 FOR yy = 0 TO 199
  FOR t = 1 TO 20
   x3 = x(t, 3) - x(t, 1): y3 = y(t, 3) - y(t, 1): z3 = z(t, 3) - z(t, 1)
   x2 = x(t, 2) - x(t, 1): y2 = y(t, 2) - y(t, 1): z2 = z(t, 2) - z(t, 1)
   x1 = x(t, 1): y1 = y(t, 1): z1 = z(t, 1) + 1000
  
   '           (0)     (xx-160)
   'gerade : x=(0) + k (yy-100)
   '           (1)     (e     )
   '           ( x(t,1) )   (
   'ebene:   x=( y(t,1) ) +
   '           ( z(t,1) )
  NEXT t
 NEXT yy
NEXT xx


' FOR t = 1 TO 20
'  r(t) = t
' NEXT t
' FOR t = 1 TO 20
'  FOR i = t + 1 TO 20
'   IF z(r(t), 0) < z(r(i), 0) THEN SWAP r(t), r(i)
'  NEXT i
' NEXT t
' CLS
' FOR t = 1 TO 20
'  n = r(t)
'  x1 = 160 + x(n, 1) / (z(n, 1) + e) * e
'  y1 = 100 + y(n, 1) / (z(n, 1) + e) * e
'  x2 = 160 + x(n, 2) / (z(n, 2) + e) * e
'  y2 = 100 + y(n, 2) / (z(n, 2) + e) * e
'  x3 = 160 + x(n, 3) / (z(n, 3) + e) * e
'  y3 = 100 + y(n, 3) / (z(n, 3) + e) * e
'  x0 = 160 + x(n, 0) / (z(n, 0) + e) * e
'  y0 = 100 + y(n, 0) / (z(n, 0) + e) * e
'  LINE (x1, y1)-(x2, y2), 11
'  LINE (x2, y2)-(x3, y3), 11
'  LINE (x3, y3)-(x1, y1), 11
'  PAINT (x0, y0), 11, 11
'  LINE (x1, y1)-(x2, y2), c(n) + 8
'  LINE (x2, y2)-(x3, y3), c(n) + 8
'  LINE (x3, y3)-(x1, y1), c(n) + 8
'  PAINT (x0, y0), c(n), c(n) + 8
' NEXT t


 IF POINT(0, 0) = 0 THEN PCOPY 1, 0

 xd = xd + RND * s - s / 2
 IF xd < p - s * 4 THEN xd = p - s * 4
 IF xd > p + s * 4 THEN xd = p + s * 4
 yd = yd + RND * s - s / 2
 IF yd < p - s * 4 THEN yd = p - s * 4
 IF yd > p + s * 4 THEN yd = p + s * 4
 zd = zd + RND * s - s / 2
 IF zd < p - s * 4 THEN zd = p - s * 4
 IF zd > p + s * 4 THEN zd = p + s * 4
LOOP UNTIL INKEY$ = CHR$(27)


DATA    0, 851, 433, 809, 263, 433,   0,   0, 959,1
DATA  809, 263, 433, 500,-688, 433,   0,   0, 959,2
DATA  500,-688, 433,-500,-688, 433,   0,   0, 959,4
DATA -500,-688, 433,-809, 263, 433,   0,   0, 959,1
DATA -809, 263, 433,   0, 851, 433,   0,   0, 959,2
DATA    0, 851, 433, 500, 688,-433, 809, 263, 433,2
DATA  500, 688,-433, 809, 263, 433, 809,-263,-433,1
DATA  809, 263, 433, 809,-263,-433, 500,-688, 433,4
DATA  809,-263,-433, 500,-688, 433,   0,-851,-433,1
DATA  500,-688, 433,   0,-851,-433,-500,-688, 433,2
DATA    0,-851,-433,-500,-688, 433,-809,-263,-433,1
DATA -500,-688, 433,-809,-263,-433,-809, 263, 433,4
DATA -809,-263,-433,-809, 263, 433,-500, 688,-433,2
DATA -809, 263, 433,-500, 688,-433,   0, 851, 433,1
DATA -500, 688,-433,   0, 851, 433, 500, 688,-433,4
DATA    0,-851,-433, 809,-263,-433,   0,   0,-959,2
DATA  809,-263,-433, 500, 688,-433,   0,   0,-959,4
DATA  500, 688,-433,-500, 688,-433,   0,   0,-959,2
DATA -500, 688,-433,-809,-263,-433,   0,   0,-959,1
DATA -809,-263,-433,   0,-851,-433,   0,   0,-959,4



