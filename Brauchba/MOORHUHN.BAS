SCREEN 12
OPEN "c:\spiele\kopie\moorhuhn.exe" FOR BINARY AS #1
DIM i(0) AS STRING * 1, a(10000)
FOR x = 1 TO 15
 OUT &H3C8, x
 OUT &H3C9, x * 4 + 3
 OUT &H3C9, x * 4 + 3
 OUT &H3C9, x * 4 + 3
NEXT x
FOR y = 100 TO 200
 FOR x = 0 TO 199
  GET #1, 220050 + y * 200 + x, i(0)
  PSET (10 + x, 480 - y), INT(ASC(i(0)) / 16)
  PSET (220 + x, 480 - y), INT(ASC(i(0)) / 16)
 NEXT x
NEXT y
LOCATE 1, 1: PRINT "¸ by Rafael Friesen."
GET (0, 0)-(160, 16), a
PUT (245, 365), a
LINE (0, 0)-(160, 16), 0, BF
FOR y = 100 TO 200
 FOR x = 0 TO 199
  IF POINT(10 + x, 480 - y) <> POINT(220 + x, 480 - y) THEN
   GET #1, 220050 + y * 200 + x, i(0)
   i(0) = CHR$((ASC(i(0)) + 3) MOD 256)
   PUT #1, 220050 + y * 200 + x, i(0)
  END IF
 NEXT x
NEXT y
CLOSE

