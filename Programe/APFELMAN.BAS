DEFDBL A-Z

INPUT "Iterative Recheng„nge (20 - 1000) bei Zweifel: Enter"; it
IF it = 0 THEN it = 256

'startbild
xu = -2.5: xo = 1.5: yu = -1.5: yo = 1.5       'Alles
xe = -.374442087627469#: ye = .660100563982715#

'xu = -.3747: xo = -.3731: yu = .6591: yo = .6603

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

neu:

xd = (xo - xu) / 320
yd = (yo - yu) / 200
FOR gg = 3 TO 2 STEP -1
 ge = 2 ^ gg - 1
 FOR y = 0 TO 199 STEP ge + 1
  yy = yu + yd * y
  FOR x = 0 TO 319 STEP ge + 1
   xx = xu + xd * x
 
   x0 = 0: y0 = 0
 
   FOR i = 1 TO it
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

NEXT gg

COLOR 64
LOCATE 1, 1: PRINT xu; xo; yu; yo
LINE (107, 67)-(213, 131), 64, B
DO: t$ = INKEY$: LOOP WHILE t$ = ""
xd = (xo - xu) / 3
yd = (yo - yu) / 3
SELECT CASE VAL(t$)
CASE 1: xu = xu: yu = yu + 2 * yd
CASE 2: xu = xu + xd: yu = yu + 2 * yd
CASE 3: xu = xu + 2 * xd: yu = yu + 2 * yd
CASE 4: xu = xu: yu = yu + yd
CASE 5: xu = xu + xd: yu = yu + yd
CASE 6: xu = xu + 2 * xd: yu = yu + yd
CASE 7: xu = xu: yu = yu
CASE 8: xu = xu + xd: yu = yu
CASE 9: xu = xu + 2 * xd: yu = yu
CASE ELSE: END
END SELECT
xo = xu + xd: yo = yu + yd
GOTO neu

