
'Ein Alien schiesst auf einen Anderen

RANDOMIZE TIMER
CLS
INPUT "Um wieviele Pixel soll der eine den Anderen hîchstens verfehlen (1 - 200)?", m
SCREEN 7
DO
 FOR zz = 1 TO 2000: NEXT zz
 CLS
 PRINT jj, o
 CIRCLE (160, 60), 2, 15
 PAINT STEP(0, 0), 15, 15
 LINE STEP(0, 0)-STEP(-3, -3), 15
 LINE STEP(6, 0)-STEP(-3, 3), 15
 LINE STEP(0, 0)-STEP(0, 6), 15
 LINE STEP(0, 0)-STEP(-2, 2), 15
 LINE STEP(2, -2)-STEP(2, 2), 15
 LINE STEP(1, -4)-STEP(-5, 0), 15
 X = INT(RND * m - m / 2)
 c = INT(RND * m - m / 2)
 CIRCLE STEP(X + 2, c + 36), 4, 4
 PAINT STEP(0, 0), 4, 4
 LINE STEP(0, 0)-STEP(-X - 2, -c - 36), 4
 CIRCLE (160, 100), 4, 15
 PAINT STEP(0, 0), 15, 15
 LINE STEP(0, 0)-STEP(-5, -5), 15
 LINE STEP(10, 0)-STEP(-5, 5), 15
 LINE STEP(0, 0)-STEP(0, 12), 15
 LINE STEP(0, 0)-STEP(-4, 4), 15
 LINE STEP(4, -4)-STEP(4, 4), 15
 LINE STEP(2, -8)-STEP(-12, 0), 15
 IF POINT(160 + X, 100 + c) = 15 THEN o = o + 1
 jj = jj + 1
LOOP WHILE INKEY$ = ""
LOCATE 17, 8
PRINT jj; " SchÅsse, davon"
LOCATE 19, 8
PRINT o; " mal getroffen!"
COLOR 0

