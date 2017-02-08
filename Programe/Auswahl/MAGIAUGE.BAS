
'Magisches Auge Bild aus Buchstaben

SCREEN 12
COLOR 1
LINE (10, 2)-(16, 22), , BF
LINE (16, 2)-(22, 5), , BF
LINE (16, 9)-(22, 9), , BF
LINE (16, 12)-(28, 22)
LINE (28, 22)-(34, 22)
LINE (34, 22)-(22, 12)
CIRCLE (22, 7), 6, , 4.712, 1.57, 1 / 3
CIRCLE (22, 7), 12, , 4.712, 1.57, 1 / 3
PAINT (19, 11), 1, 1
LINE (40, 2)-(46, 22), , BF
LINE (40, 2)-(64, 5), , BF
LINE (40, 9)-(58, 12), , BF
DIM a(80, 60)
FOR x = 1 TO 80
 FOR y = 1 TO 60
  a(x, y) = POINT(x, y)
 NEXT y
NEXT x
SCREEN 0
FOR y = 1 TO 23
 FOR x = 1 TO 10
  LOCATE y, x: PRINT CHR$(INT(RND * 26 + 65))
 NEXT x
 FOR x = 1 TO 70
  LOCATE y, x + 10: PRINT CHR$(SCREEN(y, x + a(x, y)))
 NEXT x
NEXT y
STOP
OPEN "c:\windows\desktop\Initials.txt" FOR OUTPUT AS #1
FOR x = 1 TO 23
 FOR y = 1 TO 80
  PRINT #1, CHR$(SCREEN(x, y));
 NEXT y
 PRINT #1, ""
NEXT x
CLOSE

