
DIM i(0) AS STRING * 1
DIM z(2) AS INTEGER
DIM u(4) AS STRING * 3
DIM px(100) AS INTEGER, py(100) AS INTEGER

dicke = 5
'streifenbreite

punte = 50
'zuweisungen von positionen

test:
SCREEN 13
INPUT "Replacement (zahl von 0 bis 3)?"; r
OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
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


OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild2.bmp" FOR OUTPUT AS #2

CLS
LOCATE 1, 1: PRINT "Dateien erstellen"
FOR x = 1 TO 55
 GET #1, x, i(0)
 PRINT #2, i(0);
 LOCATE 2, 1: PRINT INT(x / LOF(1) * 100); "%"
NEXT x
FOR x = 56 TO LOF(1)
 IF x + 100 >= LOF(1) THEN
  PRINT #2, CHR$(0);
 ELSE
  PRINT #2, SPACE$(100);
  x = x + 99
 END IF
 LOCATE 2, 1: PRINT INT(x / LOF(1) * 100); "%  "
NEXT x
CLOSE

OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild2.bmp" FOR BINARY AS #2


GET #1, 19, z(1)
xx = z(1)
GET #1, 23, z(2)
yy = z(2)

'zufallspunkte
FOR z = 1 TO punte
 px(z) = INT(RND * xx): py(z) = INT(RND * yy)
NEXT z

FOR x = 1 TO punte    'zentrumspunktkorrektur
 py(x) = yy - py(x)
NEXT x


'ringe s/w
LOCATE 1, 1: PRINT "Bild2 bearbeiten         "
FOR y = 0 TO yy
 FOR x = 0 TO xx
 
  'z = SQR((x - (xx / 2)) ^ 2 + (y - (yy / 2)) ^ 2)       'ringe zentriert
  'z = yy - y                      'linien S Åd (horiz)
  'z = x                           'linien O st (vert)
  'z = y                           'linien N ord (horiz)
  'z = xx - x                      'linien W est (vert)
  'z = (x + y) / SQR(2)           'linien NO
  'z = (x + yy - y) / SQR(2)      'linien SO
  'z = (xx - x + y) / SQR(2)      'linien NW
  'z = (xx + yy - x - y) / SQR(2) 'linien SW
  'z = SQR((x - (xx / 3)) ^ 2 + (y - (yy / 3)) ^ 2) + SQR((x - (xx * 2 / 3)) ^ 2 + (y - (yy * 2 / 3)) ^ 2) 'oval
 
  z = 100000
  FOR a = 1 TO punte
   zz = SQR((x - px(a)) ^ 2 + (y - py(a)) ^ 2)
   IF zz < z THEN z = zz
  NEXT a

  GET #1, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  c = (ASC(MID$(u(0), 1, 1)) + ASC(MID$(u(0), 2, 1)) + ASC(MID$(u(0), 3, 1))) / 3
  gre = (z MOD dicke) * 256 / (dicke - 1)
  IF c < gre THEN c = 0 ELSE c = 255
  u(0) = CHR$(c) + CHR$(c) + CHR$(c)
  PUT #2, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 2, 1: PRINT INT(y / yy * 100); "%  "
NEXT y

CLOSE

END

