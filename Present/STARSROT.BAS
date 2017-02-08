RANDOMIZE TIMER
SCREEN 7, , 1, 0
WINDOW (-160, -100)-(159, 99)
anz = 300
DIM x(3000), y(3000), z(3000)
FOR q = 1 TO anz
 x(q) = RND * 320 - 160
 y(q) = RND * 320 - 160
 z(q) = RND * 210 - 10
 PSET (x(q) * 200 / z(q), y(q) * 200 / z(q))
NEXT q
DO
 xd = xd + RND * .002 - .001
 IF xd > .01 THEN xd = .01
 IF xd < -.01 THEN xd = -.01
 yd = yd + RND * .002 - .001
 IF yd > .01 THEN yd = .01
 IF yd < -.01 THEN yd = -.01
 zd = zd + RND * .004 - .002
 IF zd > .02 THEN zd = .02
 IF zd < -.02 THEN zd = -.02

 CLS
 xdc = COS(xd): xds = SIN(xd)
 ydc = COS(yd): yds = SIN(yd)
 zdc = COS(zd): zds = SIN(zd)
 FOR q = 1 TO anz
  z(q) = z(q) - 5
  xx = x(q) * zdc - y(q) * zds
  yy = x(q) * zds + y(q) * zdc
  x(q) = xx: y(q) = yy
  xx = x(q) * ydc - z(q) * yds
  zz = x(q) * yds + z(q) * ydc
  x(q) = xx: z(q) = zz
  yy = z(q) * xds + y(q) * xdc
  zz = z(q) * xdc - y(q) * xds
  x(q) = xx: z(q) = zz
  IF x(q) < -160 THEN x(q) = x(q) + 320
  IF x(q) > 160 THEN x(q) = x(q) - 320
  IF y(q) < -160 THEN y(q) = y(q) + 320
  IF y(q) > 160 THEN y(q) = y(q) - 320
  IF z(q) < -10 THEN z(q) = 200
  IF z(q) > 0 THEN
   c = 15
   IF z(q) > 140 THEN c = 7
   IF z(q) > 170 THEN c = 8
   PSET (x(q) * 200 / z(q), y(q) * 200 / z(q)), c
  END IF
 NEXT q
 PCOPY 1, 0
LOOP WHILE INKEY$ = ""

