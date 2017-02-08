SCREEN 12
PAINT (10, 10), 8
LINE (100, 50)-(540, 200), 0, B
PAINT (150, 100), 15, 0
LINE (100, 50)-(110, 150), 8, BF
LINE (100, 150)-(110, 150), 0
LINE (110, 150)-(110, 50), 0
LINE (140, 50)-(140, 200), 0
LINE (180, 50)-(180, 200), 0
LINE (220, 50)-(220, 200), 0
LINE (260, 50)-(260, 200), 0
LINE (300, 50)-(300, 200), 0
LINE (340, 50)-(340, 200), 0
LINE (380, 50)-(380, 200), 0
LINE (420, 50)-(420, 200), 0
LINE (460, 50)-(460, 200), 0
LINE (500, 50)-(500, 200), 0
LINE (530, 50)-(540, 150), 8, BF
LINE (530, 50)-(530, 150), 0
LINE (530, 150)-(540, 150), 0, BF
LINE (130, 50)-(150, 150), 0, BF
LINE (210, 50)-(230, 150), 0, BF
LINE (250, 50)-(270, 150), 0, BF
LINE (330, 50)-(350, 150), 0, BF
LINE (370, 50)-(390, 150), 0, BF
LINE (410, 50)-(430, 150), 0, BF
LINE (490, 50)-(510, 150), 0, BF
COLOR 15
LOCATE 2, 18: PRINT "a         d    f         h    j    k         ”"
COLOR 15
LOCATE 3, 16: PRINT "<    y    x    c    v    b    n    m    ,    .    -"
LOCATE 25, 20: PRINT "Ende mit Leertaste"

PLAY "T255O3ceg>c<gec"
DO
t$ = INKEY$
IF t$ = "<" THEN PLAY "O2a"
IF t$ = "a" THEN PLAY "O2a+"
IF t$ = "y" THEN PLAY "O2b"
IF t$ = "x" THEN PLAY "O3c"
IF t$ = "d" THEN PLAY "O3c+"
IF t$ = "c" THEN PLAY "O3d"
IF t$ = "f" THEN PLAY "O3d+"
IF t$ = "v" THEN PLAY "O3e"
IF t$ = "b" THEN PLAY "O3f"
IF t$ = "h" THEN PLAY "O3f+"
IF t$ = "n" THEN PLAY "O3g"
IF t$ = "j" THEN PLAY "O3g+"
IF t$ = "m" THEN PLAY "O3a"
IF t$ = "k" THEN PLAY "O3a+"
IF t$ = "," THEN PLAY "O3b"
IF t$ = "." THEN PLAY "O4c"
IF t$ = "”" THEN PLAY "O4c+"
IF t$ = "-" THEN PLAY "O4d"
LOOP UNTIL t$ = " "

