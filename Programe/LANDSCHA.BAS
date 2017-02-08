OPEN "c:\windows\desktop\testbild.bmp" FOR BINARY AS #1
DIM z(2) AS INTEGER, q(1) AS STRING * 1
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
 SCREEN 13
 FOR x = 1 TO 255
  OUT &H3C8, x
  OUT &H3C9, INT(x / 4)
  OUT &H3C9, INT(x / 4)
  OUT &H3C9, INT(x / 4)
 NEXT x
 FOR y = 1 TO z(2)
  FOR x = 1 TO z(1)
   GET #1, a, q(1)
   LINE (x - y * .4, y)-STEP(0, -ASC(q(1)) / 10), ASC(q(1))
   a = a + 3
  NEXT x
  'a = a + 2
 NEXT y
CLOSE
SLEEP

