ON ERROR GOTO 1
RANDOMIZE TIMER
SCREEN 7
FOR z = 1 TO 10
 x(z) = RND * 100 - 100
 y(z) = RND * 100 - 100
 l(z) = SQR(x(z) ^ 2 + y(z) ^ 2)
 PSET (x(z) + 160, y(z) + 100), z
NEXT z
PSET (160, 100)
pi = 3.14159265358979#
w = pi / 180
FOR k = 1 TO 360
 FOR z = 1 TO 10
  xx(z) = COS((ATN(x(z) / -y(z)) + w * k + pi * .5)) * l(z)
  yy(z) = SIN((ATN(x(z) / -y(z)) + w * k + pi * .5)) * l(z)
  ' xx = SIN((ATN(y / x) + w) MOD (w * 360)) * l
  'yy = COS((ATN(y / x) + w) MOD (w * 360)) * l
  'x = xx: y = yy
  PSET (xx(z) + 160, yy(z) + 100), z
  IF INT(xx(z)) = INT(x(z)) AND INT(yy(z)) = INT(y(z)) THEN LOCATE z, 1: PRINT k; SGN(x(z)); SGN(y(z))
 NEXT z
NEXT k
1 : END

