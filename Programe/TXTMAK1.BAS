ON ERROR GOTO e
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild.txt" FOR OUTPUT AS #2
DIM z(2) AS INTEGER, q(0) AS STRING * 1
GET #1, 19, z(1)
GET #1, 23, z(2)
DIM w(z(2)) AS STRING
a = 55
FOR y = 1 TO z(2)
 FOR x = 1 TO z(1)
  GET #1, a, q(0)
  c = ASC(q(0))
  GET #1, a + 1, q(0)
  c = c + ASC(q(0))
  GET #1, a + 2, q(0)
  c = c + ASC(q(0))
  c = CINT(c * 10 / 765)
  SELECT CASE c
  CASE 0: w(y) = w(y) + "#"
  CASE 1: w(y) = w(y) + "X"
  CASE 2: w(y) = w(y) + "%"
  CASE 3: w(y) = w(y) + "x"
  CASE 4: w(y) = w(y) + "+"
  CASE 5: w(y) = w(y) + "*"
  CASE 6: w(y) = w(y) + "°"
  CASE 7: w(y) = w(y) + ","
  CASE 8: w(y) = w(y) + "-"
  CASE 9: w(y) = w(y) + "."
  CASE 10: w(y) = w(y) + " "
  END SELECT
  a = a + 3
 NEXT x
 a = a + 3
NEXT y
FOR y = z(2) TO 1 STEP -1
 PRINT #2, w(y)
NEXT y
CLOSE
END
e: RESUME NEXT

