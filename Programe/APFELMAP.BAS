DEFDBL A-Z
DIM z(2) AS INTEGER
DIM i(0) AS STRING * 1
DIM u(0) AS STRING * 1
DIM fd(1536, 3) AS STRING * 1


INPUT "Iterative Recheng„nge (ca.256)"; it
IF it = 0 THEN it = 256
INPUT "Farbenanzahl (ca. 64 - max. 1536)"; ff
IF ff = 0 THEN ff = 256

FOR x = 0 TO 1535
 IF x < 256 THEN fd(x, 0) = CHR$(x): fd(x, 1) = CHR$(255): fd(x, 2) = CHR$(0)
 IF x > 255 AND x < 512 THEN fd(x, 0) = CHR$(255): fd(x, 1) = CHR$(511 - x): fd(x, 2) = CHR$(0)
 IF x > 511 AND x < 768 THEN fd(x, 0) = CHR$(255): fd(x, 1) = CHR$(0): fd(x, 2) = CHR$(x - 512)
 IF x > 767 AND x < 1024 THEN fd(x, 0) = CHR$(1023 - x): fd(x, 1) = CHR$(0): fd(x, 2) = CHR$(255)
 IF x > 1023 AND x < 1280 THEN fd(x, 0) = CHR$(0): fd(x, 1) = CHR$(x - 1024): fd(x, 2) = CHR$(255)
 IF x > 1279 THEN fd(x, 0) = CHR$(0): fd(x, 1) = CHR$(255): fd(x, 2) = CHR$(1535 - x)
NEXT x


test:
SCREEN 13
INPUT "Replacement (zahl von 0 bis 3)?"; re
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
GET #1, 19, z(1)
GET #1, 23, z(2)
FOR x = 1 TO 255
 OUT &H3C8, x
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
NEXT x
FOR ya = z(2) TO 0 STEP -z(2) / 200
 FOR xa = 0 TO z(1) STEP z(1) / 320
  x = INT(xa): y = INT(ya)
  cc = 0
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * re, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(1) * 3 + 56 + y * re, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(1) * 3 + 57 + y * re, i(0)
  cc = (cc + ASC(i(0))) / 3
  LINE (x * 320 / z(1), 200 - y * 200 / z(2))-STEP(3, 3), cc, BF
 NEXT xa
NEXT ya
CLOSE
COLOR 255
INPUT "War das Bild gerade und streifenfrei (j/n)?", jn$
IF jn$ = "n" THEN GOTO test
SCREEN 0

'aussuchen:
xu = -2.5: xo = 1.5: yu = -1.5: yo = 1.5
SCREEN 13
FOR i = 0 TO 255
 r = INT(ASC(fd(i * 6, 2)) / 4)
 g = INT(ASC(fd(i * 6, 1)) / 4)
 B = INT(ASC(fd(i * 6, 0)) / 4)
 OUT &H3C8, i
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, B
 LINE (i, 0)-(i, 200), i
NEXT i
neu:
t$ = ""
xu = -2.5: xo = 1.5: yu = -1.5: yo = 1.5
FOR t = 1 TO LEN(a$)
 xd = (xo - xu) / 4
 yd = (yo - yu) / 4
 SELECT CASE VAL(MID$(a$, t, 1))
 CASE 1: xm = 0: ym = 2
 CASE 2: xm = 1: ym = 2
 CASE 3: xm = 2: ym = 2
 CASE 4: xm = 0: ym = 1
 CASE 5: xm = 1: ym = 1
 CASE 6: xm = 2: ym = 1
 CASE 7: xm = 0: ym = 0
 CASE 8: xm = 1: ym = 0
 CASE 9: xm = 2: ym = 0
 END SELECT
 xu = xu + xm * xd
 xo = xu + 2 * xd
 yu = yu + ym * yd
 yo = yu + 2 * yd
NEXT t

xd = (xo - xu) / 320
yd = (yo - yu) / 200
FOR gg = 3 TO 0 STEP -1
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
   i = (i * 256 / ff) MOD 256
   PSET (x, y), i
   IF ge > 0 THEN LINE (x, y)-STEP(ge, ge), i, BF
  NEXT x
  IF INKEY$ <> "" THEN GOTO nolupe
 NEXT y
NEXT gg

DO: LOOP WHILE INKEY$ = ""
nolupe:
t$ = ""
COLOR 64
LINE (79, 0)-(79, 199), 64, , &H1111
LINE (159, 0)-(159, 199), 64, , &H1111
LINE (239, 0)-(239, 199), 64, , &H1111
LINE (319, 0)-(319, 199), 64, , &H1111
LINE (0, 49)-(319, 49), 64, , &H1111
LINE (0, 99)-(319, 99), 64, , &H1111
LINE (0, 149)-(319, 149), 64, , &H1111
LINE (0, 199)-(319, 199), 64, , &H1111
LOCATE 19, 10: PRINT "1"
LOCATE 19, 20: PRINT "2"
LOCATE 19, 30: PRINT "3"
LOCATE 13, 10: PRINT "4"
LOCATE 13, 20: PRINT "5"
LOCATE 13, 30: PRINT "6"
LOCATE 7, 10: PRINT "7"
LOCATE 7, 20: PRINT "8"
LOCATE 7, 30: PRINT "9"

LOCATE 1, 1: PRINT a$
IF t$ = "" THEN
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
END IF
IF VAL(t$) <> 0 THEN a$ = a$ + t$: GOTO neu
SELECT CASE t$
CASE "0": a$ = LEFT$(a$, LEN(a$) - 1)
CASE CHR$(27): END
CASE CHR$(13): GOTO jo
CASE ELSE:  t$ = "": GOTO nolupe
END SELECT
GOTO neu


jo:

OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1

GET #1, 19, z(1)
xxx = z(1)
GET #1, 23, z(2)
yyy = z(2)

xd = (xo - xu) / xxx
yd = (yo - yu) / yyy

FOR y = 0 TO yyy
 yy = yo - yd * y
 FOR x = 0 TO xxx
  xx = xu + xd * x
  x0 = 0: y0 = 0
  FOR i = 1 TO it
   x1 = x0 * x0 - y0 * y0 + xx
   y1 = 2 * x0 * y0 + yy
   x0 = x1: y0 = y1
   IF x0 * x0 + y0 * y0 > 4 THEN GOTO punktb
  NEXT i
  i = 1
punktb:
  i = (i * 1536 / ff) MOD 1536
  PUT #1, x * 3 + y * xxx * 3 + 55 + y * re, fd(i, 0)
  PUT #1, x * 3 + y * xxx * 3 + 56 + y * re, fd(i, 1)
  PUT #1, x * 3 + y * xxx * 3 + 57 + y * re, fd(i, 2)
 NEXT x
 LOCATE 4, 1: PRINT INT(y / yyy * 100); "%  "; CDBL(y); "von"; CDBL(yyy); "Reihen"
NEXT y

CLOSE

