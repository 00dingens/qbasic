'in 22 min geschrieben                                    

DIM a AS STRING * 1
OPEN "c:\windows\desktop\sw.bmp" FOR BINARY AS #1
SCREEN 13
PRINT : PRINT
PRINT LOF(1)
FOR y = 0 TO 66
 FOR x = 0 TO 63
  GET #1, 63 + y * 64 + x, a
  IF ASC(a) > 0 THEN c = 0 ELSE c = 15
  PSET (100 + x, 140 - y), c
 NEXT x
NEXT y
CLOSE
OPEN "c:\windows\desktop\sw.txt" FOR OUTPUT AS #2
FOR y = 0 TO 65
 FOR x = 0 TO 63 STEP 8
  c = 0
  FOR z = 0 TO 7
   c = c + (POINT(x + z + 100, y + 75) / 15) * 2 ^ (7 - z)
   PSET (x + z + 100, y + 75), POINT(x + z + 100, y + 75) + 6
  NEXT z
  PRINT #2, c,
 NEXT x
 PRINT #2, ""
NEXT y
CLOSE

