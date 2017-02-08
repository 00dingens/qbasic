
'Errechnet PI

CLS
WIDTH 80, 50
DEFDBL A-D
eck = 6
r = 1: a = r / 2
DO
 b = SQR(a ^ 2 + (r - SQR(r ^ 2 - a ^ 2)) ^ 2)
 FOR z = 1 TO 30
  LOCATE INT(RND * 48 + 1), INT(RND * 60 + 1)
  PRINT b * eck
 NEXT z
 eck = eck * 2: a = b / 2
LOOP UNTIL eck > 1000000000
COLOR 28
LOCATE INT(RND * 48 + 1), INT(RND * 60 + 1)
PRINT "PI ="; b * eck / 2,
COLOR 0

