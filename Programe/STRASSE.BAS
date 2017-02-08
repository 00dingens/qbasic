
'™ffnet eine Bitmap mit Strassen

name$ = "c:\a\panzer.bmp"
SCREEN 7

OPEN name$ FOR BINARY AS #1
DIM z(2) AS INTEGER, q(1) AS STRING * 3
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
FOR y = 1 TO z(2)
 FOR x = 1 TO z(1)
  GET #1, a, q(1)
  SELECT CASE q(1)
  CASE CHR$(0) + CHR$(0) + CHR$(0): f = 0
  CASE CHR$(0) + CHR$(255) + CHR$(0): f = 10
  CASE CHR$(0) + CHR$(128) + CHR$(0): f = 2
  CASE ELSE: PRINT ASC(MID$(q(1), 1, 1)); ASC(MID$(q(1), 2, 1)); ASC(MID$(q(1), 3, 1))
  END SELECT
  PSET (x - 1, z(2) - y), f
  a = a + 3
 NEXT x
 'a = a + 2
NEXT y
CLOSE

OPEN "c:\a\panzer.bas" FOR OUTPUT AS #1
FOR y = 0 TO z(2)
 a$ = ""
 FOR x = 0 TO z(1)
  a$ = a$ + CHR$(65 + POINT(x, y))
 NEXT x
 PRINT #1, "DATA " + a$
NEXT y
CLOSE

