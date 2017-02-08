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
  c = INT(c * 2 / 765)
  SELECT CASE c
  CASE 0: w(y) = w(y) + CHR$(INT(RND * 26 + 65))
  CASE 1: w(y) = w(y) + " "'CHR$(INT(RND * 26 + 97))
  CASE 2: w(y) = w(y) + " "
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

