DIM i(600) AS INTEGER
SCREEN 13
a = 2
b = 50
FOR x = 1 TO 10000
 z = b * (1 - RND) ^ (-1 / a)
 IF z > 600 THEN z = 600
 i(INT(z)) = i(INT(z)) + 1
NEXT x
FOR x = 1 TO 599
 LINE (x, 479)-(x, 479 - i(x))
NEXT x
DO: LOOP WHILE INKEY$ = ""

