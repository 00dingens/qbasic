RANDOMIZE TIMER
SCREEN 12
DIM q(1000)
LOCATE 2, 2: PRINT "@@@@@"
LOCATE 3, 2: PRINT "@@@@@"
LOCATE 4, 2: PRINT "@@@@@"
LINE (7, 16)-(48, 62), 12, B
GET (2, 11)-(53, 67), q
CLS : PAINT (10, 10), 15
x = 320: y = 240
DO
n = RND * 4 - 2
m = RND * 4 - 2
B = INT(RND * 50) + 3
FOR v = 0 TO B
x = x + n: y = y + m
IF x > 580 THEN x = x - 2 * n
IF x < 2 THEN x = x - 2 * n
IF y > 400 THEN y = y - 2 * m
IF y < 2 THEN y = y - 2 * m
FOR l = 1 TO 10: NEXT l
PUT (x, y), q, PSET
NEXT v
LOOP WHILE INKEY$ = ""

