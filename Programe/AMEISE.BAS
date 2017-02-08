OPEN "c:\windows\desktop\wave1.wav" FOR BINARY AS #1
l = 20   'l„nge der laust„rkephase
                    ' V das ist l
DIM a(1) AS STRING * 20, q(1) AS STRING * 1
FOR x = 200 TO 200000
 GET #1, x, a(1)
 GET #1, x, q(1)
 t = 0: zz = 0
 FOR y = 1 TO l
  t = ASC(MID$(a(1), y, 1)) - 128
  IF t ^ 2 > zz ^ 2 THEN zz = t
 NEXT y
 zz = zz * SGN(zz)
 ww = ((ASC(q(1)) - 128) * 128 / zz) + 128
 IF ww < 0 THEN ww = 0
 IF ww > 255 THEN ww = 255
 q(1) = CHR$(ww)
 PUT #1, x, q(1)
 IF x MOD 100 = 0 THEN LOCATE 1, 1: PRINT x
NEXT x
CLOSE

