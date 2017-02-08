DO
CLS
PRINT TAB(35); "V I E L E C K"
PRINT TAB(34); "---------------"
PRINT : PRINT
rad = 0: eck = 0
INPUT "Radius ( 10...225 )    "; rad
IF rad = 1 THEN rad = INT(RND * 225)
IF rad = 0 THEN rad = 225
INPUT "Eckenzahl ( 3...400 )   "; eck
IF eck = 1 THEN eck = INT(RND * 40)
IF eck = 0 THEN eck = 19
REDIM x(eck), y(eck)
win = 2 * 3.141593 / eck

FOR i = 0 TO eck - 1
 x(i) = 320 + rad * COS(i * win)
 y(i) = 225 + rad * SIN(i * win)
NEXT i
n = 4: m = 5
SCREEN 9
COLOR 15
CLS
WINDOW (1, 1)-(640, 450)
FOR i = 0 TO eck - 2
 LINE (x((i * n) MOD eck), y((i * n) MOD eck))-(x((i * m) MOD eck), y((i * m) MOD eck))
 LINE (x((i * n + eck / 2) MOD eck), y((i * n + eck / 2) MOD eck))-(x((i * m + eck / 2) MOD eck), y((i * m + eck / 2) MOD eck))
NEXT i
DO: LOOP WHILE INKEY$ = ""
COLOR 5: INPUT "Noch ein Vieleck (j/n)"; zz$
LOOP WHILE zz$ = "j"

