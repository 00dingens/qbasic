name$ = "c:\windows\desktop\hinter~1.bmp"

OPEN name$ FOR BINARY AS #1
SCREEN 13
DIM z(2) AS INTEGER, q(1) AS STRING * 1
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
FOR y = 1 TO z(2)
 FOR x = 1 TO z(1)
  GET #1, a, q(1)
  PSET (x, z(2) - y), ASC(q(1))
  a = a + 3
 NEXT x
 'a = a + 2
NEXT y
CLOSE

