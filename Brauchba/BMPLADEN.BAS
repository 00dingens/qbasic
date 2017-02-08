OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
DIM z(2) AS INTEGER, q(1) AS STRING * 1
GET #1, 19, z(1)
GET #1, 23, z(2)
a = 55
IF z(1) < 321 AND z(2) < 201 THEN
 SCREEN 13: qq = 0
ELSE
 SCREEN 12: qq = 1
END IF
SELECT CASE qq
CASE 0
 FOR x = 1 TO 255
  OUT &H3C8, x
  OUT &H3C9, INT(x / 4)
  OUT &H3C9, INT(x / 4)
  OUT &H3C9, INT(x / 4)
 NEXT x
 FOR y = 1 TO z(2)
  FOR x = 1 TO z(1)
   GET #1, a, q(1)
   PSET (x, z(2) - y), ASC(q(1))
   a = a + 3
  NEXT x
  'a = a + 2
 NEXT y
 CASE 1
 FOR x = 1 TO 15
  OUT &H3C8, x
  OUT &H3C9, x * 4
  OUT &H3C9, x * 4
  OUT &H3C9, x * 4
 NEXT x
 FOR y = 1 TO z(2)
  FOR x = 1 TO z(1)
   GET #1, a, q(1)
   PSET (x, z(2) - y), INT(ASC(q(1)) / 16)
   a = a + 3
  NEXT x
  a = a + 3
 NEXT y
END SELECT
CLOSE
SLEEP

