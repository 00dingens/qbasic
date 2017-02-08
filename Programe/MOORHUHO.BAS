SCREEN 12
OPEN "c:\spiele\kopie\moorhuhn.dat" FOR BINARY AS #1
DIM i(0) AS STRING * 1, a(10000)
FOR x = 1 TO 15
 OUT &H3C8, x
 OUT &H3C9, x * 4 + 3
 OUT &H3C9, x * 4 + 3
 OUT &H3C9, x * 4 + 3
NEXT x
FOR h = 0 TO 10
 FOR l = 0 TO 2
  FOR y = 0 TO 479
   FOR x = 0 TO 199
    GET #1, 1 + h * 288000 + y * 200 + l * 96000 + x, i(0)
    PSET (x + l * 200, 479 - y), INT(ASC(i(0)) / 16)
   NEXT x
  NEXT y
 NEXT l
 DO: LOOP WHILE INKEY$ = ""
NEXT h
CLOSE
DO: LOOP WHILE INKEY$ = ""

