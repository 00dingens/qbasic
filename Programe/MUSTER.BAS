DIM i(0) AS STRING * 3
DIM z(2) AS INTEGER
OPEN "c:\windows\desktop\muster.bmp" FOR BINARY AS #1
GET #1, 19, z(1)
GET #1, 23, z(2)
a = z(1)
b = INT(a / 2)
CLS
FOR c = 0 TO z(2)
 FOR d = 0 TO a
  IF (c * d) MOD a > b THEN i(0) = CHR$(255) + CHR$(255) + CHR$(255) ELSE i(0) = CHR$(0) + CHR$(0) + CHR$(0)
  PUT #1, 55 + (c * z(1) + d + c) * 3, i(0)
 NEXT d
 LOCATE 12, 30: PRINT c; "von"; z(2)
NEXT c
CLOSE

