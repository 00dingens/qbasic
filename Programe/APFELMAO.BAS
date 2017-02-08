DEFDBL A-Z

'xe = -.374442087627469#: ye = .660100563982715#
xe = .384726341661541#: ye = -.109282935271099#

'startbild
sz = .5
xu = xe - 4 * sz: xo = xe + 4 * sz: yu = ye - 3 * sz: yo = ye + 3 * sz
ge = 1
spd = .1

xu = -.3747: xo = -.3731: yu = .6591: yo = .6603

SCREEN 13
FOR i = 0 TO 255
 r = ABS(191 - i)
 IF r > 63 THEN r = 63
 r = 63 - r
 g = ABS(159 - i)
 IF g > 63 THEN g = 63
 g = 63 - g
 B = ABS(63 - i)
 IF B > 63 THEN B = 63
 B = 63 - B
 OUT &H3C8, i
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, B
NEXT i
ge = ge - 1

neu:

xd = (xo - xu) / 320
yd = (yo - yu) / 200
FOR y = 90 TO 109 STEP ge + 1        '0 to 199
 yy = yu + yd * y
 FOR x = 140 TO 179 STEP ge + 1      '0 to 319
  xx = xu + xd * x

  x0 = 0: y0 = 0

  FOR i = 1 TO 256
   x1 = x0 * x0 - y0 * y0 + xx
   y1 = 2 * x0 * y0 + yy
   x0 = x1: y0 = y1
   IF x0 * x0 + y0 * y0 > 4 THEN GOTO punkt
  NEXT i
  i = 1
punkt:
  PSET (x, y), i MOD 256
  IF ge > 0 THEN LINE (x, y)-STEP(ge, ge), i MOD 256, BF
 NEXT x
NEXT y
sz = sz * (1 - spd)
xu = xe - 4 * sz: xo = xe + 4 * sz: yu = ye - 3 * sz: yo = ye + 3 * sz
IF INKEY$ = CHR$(27) THEN END
GOTO neu

