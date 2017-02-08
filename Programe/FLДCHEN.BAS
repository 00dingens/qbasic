a = 55
DIM q(15) AS STRING * 3
FOR x = 0 TO 15
 READ r, g, b
 q(x) = CHR$(b) + CHR$(g) + CHR$(r)
NEXT x
OPEN "c:\windows\desktop\Textur.bmp" FOR BINARY AS #1


FOR y = 200 TO 0 STEP -1
 FOR x = 0 TO 200
  PUT #1, a, q(POINT(x, y))
  a = a + 3
 NEXT x
 PSET (300, y), 15
 a = a + 1
NEXT y
CLOSE
DATA 0,0,0, 0,0,128, 0,128,0, 0,128,128, 128,0,0, 128,0,128, 128,128,0, 128,128,128, ,,, ,,, ,,, ,,, ,,, ,,, ,,, 255,255,255

