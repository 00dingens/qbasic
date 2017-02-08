'auf dem desktop mÅssen 2 bilder sein. 1. bild.bmp, eine vorlage, die dann
'verzerrt in guckrohr.bmp ausgegeben wird.

DIM z(4) AS INTEGER
DIM i(0) AS STRING * 3

leer$ = CHR$(255) + CHR$(255) + CHR$(255)
zz = 1          'streckfaktor, und den bild.bmp vergrî·ert wird
r = 0           'replace fÅr bilder

test1:
SCREEN 13
INPUT "Bild.bmp: Replacement (zahl von 0 bis 3)?"; r1
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
GET #1, 19, z(0)
GET #1, 23, z(1)
FOR x = 1 TO 255
 OUT &H3C8, x
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
NEXT x
FOR ya = z(1) TO 0 STEP -z(1) / 200
 FOR xa = 0 TO z(0) STEP z(0) / 320
  x = INT(xa): y = INT(ya)
  cc = 0
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r1, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r1, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r1, i(0)
  cc = (cc + ASC(i(0))) / 3
  LINE (x * 320 / z(0), 200 - y * 200 / z(1))-STEP(3, 3), cc, BF
 NEXT xa
NEXT ya
CLOSE
COLOR 255
INPUT "War das Bild gerade und streifenfrei (j/n)?", jn$
IF jn$ = "n" THEN GOTO test1
CLS
test2:
SCREEN 13
INPUT "Guckrohr.bmp: Replacement (zahl von 0 bis 3)?"; r2
OPEN "c:\windows\desktop\guckrohr.bmp" FOR BINARY AS #1
GET #1, 19, z(0)
GET #1, 23, z(1)
FOR x = 1 TO 255
 OUT &H3C8, x
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
NEXT x
FOR ya = z(1) TO 0 STEP -z(1) / 200
 FOR xa = 0 TO z(0) STEP z(0) / 320
  x = INT(xa): y = INT(ya)
  cc = 0
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r2, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r2, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(0) * 3 + 55 + y * r2, i(0)
  cc = (cc + ASC(i(0))) / 3
  LINE (x * 320 / z(0), 200 - y * 200 / z(1))-STEP(3, 3), cc, BF
 NEXT xa
NEXT ya
CLOSE
COLOR 255
INPUT "War das Bild gerade und streifenfrei (j/n)?", jn$
IF jn$ = "n" THEN GOTO test2



OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\guckrohr.bmp" FOR BINARY AS #2
GET #1, 19, z(0)
GET #1, 23, z(1)
GET #2, 19, z(2)
GET #2, 23, z(3)
xpos = z(0) / 2: ypos = z(1) / 2
ra = z(2) * zz / 6.283 'radius des kreises
w = 3.141592653# * 2 / z(2)
CLS
FOR x = 1 TO z(2)
 FOR y = 1 TO z(3)
  xx = INT(SIN(w * x) * z(3) * ra / y + xpos)
  yy = INT(COS(w * x) * z(3) * ra / y + ypos)
  IF xx < 0 OR xx > z(0) OR yy < 0 OR yy > z(1) THEN
   i(0) = leer$
  ELSE
   GET #1, 55 + 3 * yy * z(0) + yy * r1 + 3 * xx, i(0)
   PSET (xx * 320 / z(0), 200 - yy * 200 / z(1)), ASC(MID$(i(0), 1, 1))
  END IF
  yr = z(3) - y
  PUT #2, 55 + 3 * yr * z(2) + yr * r2 + 3 * x, i(0)
 NEXT y
 LOCATE 1, 1: PRINT INT(100 * x / z(2)); "%"
NEXT x
CLOSE

