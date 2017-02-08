
'Autofahren

CLS
RANDOMIZE TIMER
PRINT
PRINT TAB(20); "F A H R S C H U L E"
PRINT TAB(19); "====================="
PRINT
PRINT TAB(10); "Du steuerst deinen Wagen mit den Tasten"
PRINT TAB(13); "1 (nach links) und 3 (nach rechts)"
PRINT TAB(11); "mit 2 wird's schneller, mit 5 langsamer"
PRINT TAB(15); "drÅcke jetzt eine Taste!"
DO: LOOP WHILE INKEY$ = ""

LET br = 80: li = 300: re = li + br: p = (li + re) / 2
LET me = 0: un = 0: q = 512
SCREEN 9

FOR aa = 1 TO 24
PRINT "."
NEXT aa

DO
FOR qq = 320 TO 333
LET t$ = INKEY$
IF t$ = "1" THEN LET p = p - 1
IF t$ = "2" THEN LET q = q / 2
IF t$ = "3" THEN LET p = p + 1
IF t$ = "5" THEN LET q = q * 2
IF p <= li OR p >= re THEN un = -1
LET me = me + 1
LET zz = INT(RND * 7) - 3
LET li = li + zz: re = li + br
PSET (li, qq), 4: PSET (p, qq), 14: PSET (re, qq), 4
FOR h = 1 TO q: NEXT h
NEXT qq
PRINT me
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

