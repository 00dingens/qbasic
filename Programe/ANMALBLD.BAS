DEFDBL A-Z

DIM i(0) AS STRING * 1
DIM z(2) AS INTEGER
DIM u(4) AS STRING * 3


rs = 4: gs = 4: bs = 4        'farbstufen (rot/grn/blau). am besten 2^n
                    'also 2, (3), 4, (5), (6), 8, (12), 16, (48), 32, 64, 128.


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
SCREEN 12


sr = INT(256 / rs)
sg = INT(256 / gs)
sb = INT(256 / bs)

OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild2.bmp" FOR OUTPUT AS #2
OPEN "c:\windows\desktop\bild3.bmp" FOR OUTPUT AS #3
OPEN "c:\windows\desktop\bild4.bmp" FOR OUTPUT AS #4
OPEN "c:\windows\desktop\bild5.bmp" FOR OUTPUT AS #5

GET #1, 23, z(2)
yy = z(2)

s = LOF(1) / 7470
CLS
LOCATE 1, 1: PRINT "Geschtzte Dauer ca."; INT(s / 60); "Minuten und "; INT(s MOD 60); "Sekunden."
LOCATE 2, 1: PRINT "Dateien erstellen"
LOCATE 3, 3: PRINT "0 %  0 von"; CDBL(LOF(1)); "Bytes"
LOCATE 4, 1: PRINT "Bild2 bearbeiten"
LOCATE 5, 3: PRINT "0 %  0 von"; CDBL(yy); "Reihen"
LOCATE 6, 1: PRINT "Bild3 bearbeiten"
LOCATE 7, 3: PRINT "0 %  0 von"; CDBL(yy); "Reihen"
LOCATE 8, 1: PRINT "Bild4 bearbeiten"
LOCATE 9, 3: PRINT "0 %  0 von"; CDBL(yy); "Reihen"
LOCATE 10, 1: PRINT "Bild5 bearbeiten"
LOCATE 11, 3: PRINT "0 %  0 von"; CDBL(yy); "Reihen"
LOCATE 13, 1: PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
LOCATE 14, 1: PRINT "บ                                                                              บ"
LOCATE 15, 1: PRINT "ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ"

LOCATE 14, 2 + INT(78 * prz): PRINT "Û"

FOR x = 1 TO 55
 GET #1, x, i(0)
 PRINT #2, i(0);
 PRINT #3, i(0);
 PRINT #4, i(0);
 PRINT #5, i(0);
 LOCATE 3, 3: PRINT INT(x / LOF(1) * 100); "%"
 LOCATE 14, 2 + INT(5 * (x / LOF(1))): PRINT "Û"
NEXT x
FOR x = 56 TO LOF(1)
 IF x + 100 >= LOF(1) THEN
  PRINT #2, CHR$(0);
  PRINT #3, CHR$(0);
  PRINT #4, CHR$(0);
  PRINT #5, CHR$(0);
 ELSE
  PRINT #2, SPACE$(100);
  PRINT #3, SPACE$(100);
  PRINT #4, SPACE$(100);
  PRINT #5, SPACE$(100);
  x = x + 99
 END IF
 LOCATE 3, 3: PRINT INT(x / LOF(1) * 100); "%  "; CDBL(x); "von"; CDBL(LOF(1)); "Bytes"
 LOCATE 14, 2 + INT(5 * (x / LOF(1))): PRINT "Û"
NEXT x
CLOSE

OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild2.bmp" FOR BINARY AS #2
OPEN "c:\windows\desktop\bild3.bmp" FOR BINARY AS #3
OPEN "c:\windows\desktop\bild4.bmp" FOR BINARY AS #4
OPEN "c:\windows\desktop\bild5.bmp" FOR BINARY AS #5

'1 orig. 3 schw rand+fllung 4 schw.rand 2 nur fllung 5 bunter rand

GET #1, 19, z(1)
xx = z(1)
GET #1, 23, z(2)
yy = z(2)

LOCATE 4, 1: PRINT "Bild2 bearbeiten"
FOR y = 0 TO yy
 FOR x = 0 TO xx
  GET #1, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  MID$(u(0), 1, 1) = CHR$(INT(ASC(MID$(u(0), 1, 1)) / sb) * sb + sb - 1)
  MID$(u(0), 2, 1) = CHR$(INT(ASC(MID$(u(0), 2, 1)) / sg) * sg + sg - 1)
  MID$(u(0), 3, 1) = CHR$(INT(ASC(MID$(u(0), 3, 1)) / sr) * sr + sr - 1)
  PUT #2, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 5, 3: PRINT INT(y / yy * 100); "%  "; CDBL(y); "von"; CDBL(yy); "Reihen"
 LOCATE 14, 8 + INT(17 * (y / yy)): PRINT "Û"
NEXT y

LOCATE 6, 1: PRINT "Bild3 bearbeiten"
FOR y = 0 TO yy
 FOR x = 0 TO xx
  GET #2, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  GET #2, x * 3 + (y + 1) * xx * 3 + 55 + (y + 1) * r, u(1)
  IF y > 0 THEN GET #2, x * 3 + (y - 1) * xx * 3 + 55 + (y - 1) * r, u(2)
  IF x > 0 THEN GET #2, (x - 1) * 3 + y * xx * 3 + 55 + y * r, u(3)
  GET #2, (x + 1) * 3 + y * xx * 3 + 55 + y * r, u(4)
  'mitte, oben, unten, links, rechts
  IF y < yy AND u(0) <> u(1) THEN u(0) = CHR$(0) + CHR$(0) + CHR$(0)
  IF y > 0 AND u(0) <> u(2) THEN u(0) = CHR$(0) + CHR$(0) + CHR$(0)
  IF x > 0 AND u(0) <> u(3) THEN u(0) = CHR$(0) + CHR$(0) + CHR$(0)
  IF x < xx AND u(0) <> u(4) THEN u(0) = CHR$(0) + CHR$(0) + CHR$(0)
  PUT #3, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 7, 3: PRINT INT(y / yy * 100); "%  "; CDBL(y); "von"; CDBL(yy); "Reihen"
 LOCATE 14, 26 + INT(17 * (y / yy)): PRINT "Û"
NEXT y

LOCATE 8, 1: PRINT "Bild4 bearbeiten"
FOR y = 0 TO yy
 FOR x = 0 TO xx
  GET #3, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  IF u(0) <> CHR$(0) + CHR$(0) + CHR$(0) THEN u(0) = CHR$(255) + CHR$(255) + CHR$(255)
  PUT #4, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 9, 3: PRINT INT(y / yy * 100); "%  "; CDBL(y); "von"; CDBL(yy); "Reihen"
 LOCATE 14, 44 + INT(17 * (y / yy)): PRINT "Û"
NEXT y

LOCATE 10, 1: PRINT "Bild5 bearbeiten"
FOR y = 0 TO yy
 FOR x = 0 TO xx
  GET #4, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  IF u(0) = CHR$(0) + CHR$(0) + CHR$(0) THEN GET #2, x * 3 + y * xx * 3 + 55 + y * r, u(0)
  PUT #5, x * 3 + y * xx * 3 + 55 + y * r, u(0)
 NEXT x
 LOCATE 11, 3: PRINT INT(y / yy * 100); "%  "; CDBL(y); "von"; CDBL(yy); "Reihen"
 LOCATE 14, 62 + INT(17 * (y / yy)): PRINT "Û"
NEXT y

CLOSE

