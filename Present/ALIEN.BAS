RANDOMIZE TIMER
CLS
PRINT "Gleich wird ein Alien auf einen anderen schiessen."
INPUT "Um wieviel soll der eine den anderen hîchstens verfehlen (1 - 200 z.B. 15)?", m
SCREEN 7
DO
 CLS
 PRINT jj, o, "Taste drÅcken"
 CIRCLE (160, 60), 2, 15
 PAINT STEP(0, 0), 15, 15
 LINE STEP(0, 0)-STEP(-3, -3), 15
 LINE STEP(6, 0)-STEP(-3, 3), 15
 LINE STEP(0, 0)-STEP(0, 6), 15
 LINE STEP(0, 0)-STEP(-2, 2), 15
 LINE STEP(2, -2)-STEP(2, 2), 15
 LINE STEP(1, -4)-STEP(-5, 0), 15
 x = INT(RND * m - m / 2)
 c = INT(RND * m - m / 2)
 CIRCLE STEP(x + 2, c + 36), 4, 4
 PAINT STEP(0, 0), 4, 4
 LINE STEP(0, 0)-STEP(-x - 2, -c - 36), 4
 CIRCLE (160, 100), 4, 15
 PAINT STEP(0, 0), 15, 15
 LINE STEP(0, 0)-STEP(-5, -5), 15
 LINE STEP(10, 0)-STEP(-5, 5), 15
 LINE STEP(0, 0)-STEP(0, 12), 15
 LINE STEP(0, 0)-STEP(-4, 4), 15
 LINE STEP(4, -4)-STEP(4, 4), 15
 LINE STEP(2, -8)-STEP(-12, 0), 15
 FOR zz = 1 TO 10000: NEXT zz
 IF POINT(160 + x, 100 + c) = 15 THEN o = o + 1
 jj = jj + 1
LOOP WHILE INKEY$ = ""
LOCATE 17, 8
PRINT jj; " SchÅsse, davon"
LOCATE 19, 8
PRINT o; " mal getroffen!"
COLOR 0

