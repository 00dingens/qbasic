b = 2          'Streifenbreite
speed = 5
DIM a(15000)
p = 3.14159
SCREEN 7, , 0, 0
FOR x = 0 TO 32
 FOR y = 0 TO 19
  LINE (x * 10, y * 10)-STEP(9, 9), INT(RND * 15), BF
 NEXT y
NEXT x
CIRCLE (160, 100), 80, 15, , , 1
CIRCLE (160, 100), 70, 15, , , 1
PAINT (160, 25), 15, 15
CIRCLE (140, 70), 6, 15, , , 1
CIRCLE (180, 70), 6, 15, , , 1
PAINT (140, 70), 15, 15
PAINT (180, 70), 15, 15
CIRCLE (120, 100), 5, 15, 0, p, 1
CIRCLE (200, 100), 5, 15, 0, p, 1
CIRCLE (160, 100), 35, 15, p, p * 2, 1
CIRCLE (160, 100), 45, 15, p, p * 2, 1
PAINT (160, 140), 15, 15
FOR x = 0 TO b * ((200 / b) - 1) STEP b
 w = x / b
  GET (0, x)-STEP(318, b - 1), a
 IF w MOD 2 = 0 THEN
  SCREEN 7, , 2, 0
 ELSE
  SCREEN 7, , 3, 0
 END IF
 PUT (0, x), a
 SCREEN 7, , 0, 0
NEXT x
DO: LOOP WHILE INKEY$ = ""
FOR x = 0 TO 319 STEP speed
 SCREEN 7, , 2, 0
 GET (0, 0)-(x, 199), a
 SCREEN 7, , 1, 0
 CLS
 PUT (319 - x, 0), a
 SCREEN 7, , 3, 0
 GET (319 - x, 0)-(319, 199), a
 SCREEN 7, , 1, 0
 PUT (0, 0), a, XOR
 SCREEN 7, , 0, 0
 PCOPY 1, 0
NEXT x
SCREEN 7, , 2, 0
GET (0, 0)-(319, 199), a
SCREEN 7, , 1, 0
CLS
PUT (0, 0), a
SCREEN 7, , 3, 0
GET (0, 0)-(319, 199), a
SCREEN 7, , 1, 0
PUT (0, 0), a, XOR
SCREEN 7, , 0, 0
CLS
PCOPY 1, 0
FOR z = 1 TO 100000: NEXT z
FOR x = 319 TO 0 STEP -speed
 SCREEN 7, , 3, 0
 GET (0, 0)-(x, 199), a
 SCREEN 7, , 1, 0
 CLS
 PUT (319 - x, 0), a
 SCREEN 7, , 2, 0
 GET (319 - x, 0)-(319, 199), a
 SCREEN 7, , 1, 0
 PUT (0, 0), a, XOR
 SCREEN 7, , 0, 0
 PCOPY 1, 0
NEXT x


'FOR v = 0 TO 3
' SCREEN 7, , 0, v
' DO: LOOP WHILE INKEY$ = ""
'NEXT v
DO: LOOP WHILE INKEY$ = ""

