CLS
RANDOMIZE TIMER
PRINT
PRINT TAB(20); "F A H R S C H U L E"
PRINT TAB(19); "====================="
PRINT
PRINT TAB(10); "Du steuerst deinen Wagen mit den Tasten"
PRINT TAB(13); "1 (nach links) und 3 (nach rechts)"
PRINT TAB(11); "mit 2 wird's schneller, mit 5 langsamer"
PRINT TAB(15); "dr�cke jetzt eine Taste!"
DO: LOOP WHILE INKEY$ = ""

br = 20: li = 30: re = li + br: p = (li + re) / 2
me = 0: un = 0: q = 512

DO
COLOR INT(RND * 16)
t$ = INKEY$
IF t$ = "1" THEN p = p - 1
IF t$ = "2" THEN q = q / 2
IF t$ = "3" THEN p = p + 1
IF t$ = "5" THEN q = q * 2
IF p <= li OR p >= re THEN un = -1
me = me + 1
zz = INT(RND * 3) - 1
IF zz = -1 THEN z$ = "/"
IF zz = 0 THEN z$ = "I"
IF zz = 1 THEN z$ = "\"
li = li + zz: re = li + br
IF li < 3 THEN li = 3
PRINT CDBL(512 / q); "km/h"; TAB(li); z$; TAB(p); "W"; TAB(re); z$
FOR h = 1 TO q: NEXT h
LOOP WHILE NOT un
COLOR 4
PRINT
PRINT TAB(p + 2); CHR$(186)
PRINT TAB(p); CHR$(205); CHR$(205); CHR$(206); CHR$(205); CHR$(205)
PRINT TAB(p + 2); CHR$(186)
PRINT TAB(p + 2); CHR$(186)
PRINT
COLOR 14
PRINT "In den Graben gefahren!!!"
PRINT "Du kamst "; me; " Meter weit!"
FOR h = 1 TO 3000: NEXT h

