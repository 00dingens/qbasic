ON ERROR GOTO weiter
RANDOMIZE TIMER
SCREEN 7, , 1, 0
WINDOW (-160, -100)-(159, 99)
anz = 1000   'Sternezahl   max3000
d = .01      'drehgeschwindigkeit
g = 5        'fluggeschwindigkeit
DIM x(3000), y(3000), z(3000)
FOR q = 1 TO anz
 x(q) = RND * 320 - 160
 y(q) = RND * 320 - 160
 z(q) = RND * 210 - 10
 PSET (x(q) * 200 / z(q), y(q) * 200 / z(q))
NEXT q
DO
 xd = xd + RND * d / 5 - d / 10
 IF xd > d THEN xd = d
 IF xd < -d THEN xd = -d
 yd = yd + RND * d / 5 - d / 10
 IF yd > d THEN yd = d
 IF yd < -d THEN yd = -d
 zd = zd + RND * d / 2.5 - d / 5
 IF zd > 2 * d THEN zd = 2 * d
 IF zd < -2 * d THEN zd = -2 * d

 CLS
 xdc = COS(xd): xds = SIN(xd)
 ydc = COS(yd): yds = SIN(yd)
 zdc = COS(zd): zds = SIN(zd)
 FOR q = 1 TO anz
  z(q) = z(q) - g
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
weiter:
  END IF
 NEXT q
 PCOPY 1, 0
LOOP WHILE INKEY$ = ""

