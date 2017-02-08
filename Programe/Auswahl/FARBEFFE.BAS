    RANDOMIZE TIMER
    SCREEN 12
    DIM Box%(1 TO 900)
    x1% = 0: x2% = 30: y1% = 0: y2% = 30: a = INT(RND * 15)
    CIRCLE (15, 15), 14, a
    PAINT STEP(0, 0), a + 1, a
    GET (x1%, y1%)-(x2%, y2%), Box%
    DO
        FOR c = 1 TO 1: NEXT c
        x1% = RND * 560
        y1% = RND * 400
        PUT (x1%, y1%), Box%
    LOOP WHILE INKEY$ = ""

