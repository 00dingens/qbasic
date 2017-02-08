ON ERROR GOTO e
CLS
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild.txt" FOR OUTPUT AS #2
DIM z(2) AS INTEGER, q(0) AS STRING * 1
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
v = 2                  'Verschiebung
FOR y = z(2) - 1 TO 0 STEP -1
 w$ = ""
 FOR x = 0 TO z(1) - 1
  a = 55 + y * (z(1) * 3 + v) + x * 3
  GET #1, a, q(0)
  c = ASC(q(0))
  GET #1, a + 1, q(0)
  c = c + ASC(q(0))
  GET #1, a + 2, q(0)
  c = c + ASC(q(0))
  c = CINT(c * 10 / 765)
  SELECT CASE c
  CASE 0: w$ = w$ + "#"
  CASE 1: w$ = w$ + "X"
  CASE 2: w$ = w$ + "%"
  CASE 3: w$ = w$ + "x"
  CASE 4: w$ = w$ + "+"
  CASE 5: w$ = w$ + "*"
  CASE 6: w$ = w$ + "°"
  CASE 7: w$ = w$ + ","
  CASE 8: w$ = w$ + "-"
  CASE 9: w$ = w$ + "."
  CASE 10: w$ = w$ + " "
  END SELECT
 NEXT x
 PRINT #2, w$
 LOCATE 1, 1: PRINT "Noch "; INT(y / z(2) * 100); "%"
NEXT y
PRINT "Fertig"
CLOSE
END
e: RESUME NEXT

