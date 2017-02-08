DEFDBL A-Z

DIM i(0) AS STRING * 1
DIM z(2) AS INTEGER
DIM u(4) AS STRING * 3

INPUT "Zerrdividend"; zer
test:
SCREEN 13
INPUT "Replacement (zahl von 0 bis 3)?"; r
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
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * r, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * r, i(0)
  cc = cc + ASC(i(0))
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * r, i(0)
  cc = (cc + ASC(i(0))) / 3
  LINE (x * 320 / z(1), 200 - y * 200 / z(2))-STEP(3, 3), cc, BF
 NEXT xa
NEXT ya
CLOSE
COLOR 255
INPUT "War das Bild gerade und streifenfrei (j/n)?", jn$
IF jn$ = "n" THEN GOTO test
SCREEN 0

OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild3da.bmp" FOR OUTPUT AS #2
OPEN "c:\windows\desktop\bild3db.bmp" FOR OUTPUT AS #3

CLS
LOCATE 1, 1: PRINT "Dateien erstellen"
FOR x = 1 TO 55
 GET #1, x, i(0)
 PRINT #2, i(0);
 PRINT #3, i(0);
 LOCATE 2, 1: PRINT INT(x / LOF(1) * 100); "%"
NEXT x
FOR x = 56 TO LOF(1)
 IF x + 100 >= LOF(1) THEN
  PRINT #2, CHR$(0);
  PRINT #3, CHR$(0);
 ELSE
  PRINT #2, SPACE$(100);
  PRINT #3, SPACE$(100);
  x = x + 99
 END IF
 LOCATE 2, 1: PRINT INT(x / LOF(1) * 100); "%  "; CDBL(x); "von"; CDBL(LOF(1)); "Bytes"
NEXT x
CLOSE

OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\form.bmp" FOR BINARY AS #2
OPEN "c:\windows\desktop\bild3da.bmp" FOR BINARY AS #3
OPEN "c:\windows\desktop\bild3db.bmp" FOR BINARY AS #4

GET #1, 19, z(1)
xx = z(1)
GET #1, 23, z(2)
yy = z(2)

LOCATE 3, 1: PRINT "3D-Bilder bearbeiten         "
FOR y = 0 TO yy
 FOR x = 0 TO xx
  GET #2, x * 3 + y * xx * 3 + 55 + y * r, i(0)
  GET #1, (x + INT(ASC(i(0)) / zer)) * 3 + y * xx * 3 + 55 + y * r, u(0)
  PUT #3, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  GET #1, (x - INT(ASC(i(0)) / zer)) * 3 + y * xx * 3 + 55 + y * r, u(0)
  PUT #4, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 4, 1: PRINT INT(y / yy * 100); "%  "; CDBL(y); "von"; CDBL(yy); "Reihen"
NEXT y
CLOSE

