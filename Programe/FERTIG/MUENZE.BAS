RANDOMIZE TIMER
geld = 10
SCREEN 12

COLOR 11
PRINT : PRINT : PRINT
PRINT TAB(28); "M  N Z E N W E R F E N"
PRINT TAB(27); "อออออออออออออออออออออออออ"
PRINT : PRINT : PRINT
PRINT TAB(18); "Willst du die Spielregeln kennenlernen? (j/n)"
DO: t$ = INKEY$: t$ = LCASE$(t$): LOOP UNTIL t$ = "j" OR t$ = "n"

IF t$ = "j" THEN
 CLS
 COLOR 10
 PRINT : PRINT : PRINT
 PRINT TAB(29); "S P I E L R E G E L N"
 PRINT TAB(28); "อออออออออออออออออออออออ"
 PRINT : PRINT : PRINT
 PRINT TAB(23); "Zuerst wird dein Einsatz abgefragt."
 PRINT TAB(17); "Danach gibst du deinen Tip ab. (Kopf/Zahl/Rand)"
 PRINT TAB(15); "Stimmt dein Tip mit dem Wurf berein, bekommst du:"
 PRINT TAB(29); "Bei Kopf das 2 - fache"
 PRINT TAB(29); "Bei Zahl das 2 - fache"
 PRINT TAB(28); "Bei Rand das 1000 - fache"
 PRINT : PRINT : PRINT
 COLOR 2
 PRINT TAB(19); "Drcke eine beliebige Taste, um fortzufahren"
 DO: LOOP WHILE INKEY$ = ""
END IF

DO
ein = 0: tip$ = "": q$ = ""
COLOR 14
CLS
PRINT : PRINT : PRINT
PRINT TAB(33); "A B F R A G E"
PRINT TAB(32); "อออออออออออออออ"
PRINT : PRINT : PRINT
PRINT TAB(28); "Du besitzt "; geld; " Mnzen."
PRINT TAB(23); "Wieviele von ihnen setzt du ein";
DO
LOCATE 10, 54: PRINT SPACE$(27)
LOCATE 10, 54: INPUT ein
LOOP UNTIL ein > 0 AND ein <= geld
PRINT TAB(16); "Was meinst du, wie wird die Mnze fallen (k/z/r)"
DO
tip$ = INKEY$: tip$ = LCASE$(tip$)
LOOP UNTIL tip$ = "k" OR tip$ = "z" OR tip$ = "r"
LOCATE 12, 40: PRINT tip$
PRINT : PRINT : PRINT
COLOR 6
PRINT TAB(19); "Drcke eine beliebige Taste, um fortzufahren"
DO: LOOP WHILE INKEY$ = ""

COLOR 12
CLS
PRINT : PRINT : PRINT
PRINT TAB(35); "S P I E L"
PRINT TAB(34); "อออออออออออ"
PRINT : PRINT : PRINT
PRINT TAB(30); "Die Mnze fliegt !!!"
FOR x = 37 TO 1000 STEP .5: SOUND x, .027: NEXT x
PRINT TAB(29); "Die Spannung steigt !!!"
FOR x = 537 TO 1600 STEP .5: SOUND x, .027: NEXT x
PRINT TAB(33); "Es ist:"
FOR x = 1037 TO 2400 STEP .5: SOUND x, .027: NEXT x
m = INT(RND * 101)
LOCATE 11, 43
SELECT CASE m
 CASE 0
  PRINT "Rand"
  q$ = "r"
 CASE 1 TO 50
  PRINT "Kopf"
  q$ = "k"
 CASE 51 TO 100
  PRINT "Zahl"
  q$ = "z"
END SELECT
FOR x = 3000 TO 37 STEP -3: SOUND x, .027: NEXT x
IF q$ = tip$ THEN PRINT TAB(26); "Du hast diese Runde gewonnen!"
IF q$ <> tip$ THEN PRINT TAB(20); "Du hast diese Runde leider nicht gewonnen!"
PRINT : PRINT : PRINT
COLOR 4
PRINT TAB(19); "Drcke eine beliebige Taste, um fortzufahren"
DO: LOOP WHILE INKEY$ = ""

COLOR 13
CLS
PRINT : PRINT : PRINT
PRINT TAB(29); "V E R R E C H N U N G"
PRINT TAB(28); "อออออออออออออออออออออออ"
PRINT : PRINT : PRINT
PRINT TAB(22); "Geld vor Einsatz:"
LOCATE 9, 58 - LEN(STR$(geld)): PRINT geld
PRINT TAB(22); "Einsatz:"
LOCATE 10, 58 - LEN(STR$(ein)): PRINT ein
geld = geld - ein
PRINT TAB(22); "Geld Nach Einsatz:"
LOCATE 11, 58 - LEN(STR$(geld)): PRINT geld
PRINT TAB(22); "Gewinn:"
IF q$ <> tip$ THEN ein = 0
SELECT CASE q$
 CASE "k": w = 2
 CASE "z": w = 2
 CASE "r": w = 1000
END SELECT
LOCATE 12, 58 - LEN(STR$(ein * w)): PRINT ein * w
PRINT TAB(21); "ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ"
PRINT TAB(22); "Gesamt:"
geld = geld + ein * w
LOCATE 14, 58 - LEN(STR$(geld)): PRINT geld
PRINT TAB(21); "ออออออออออออออออออออออออออออออออออออออ"
PRINT : PRINT : PRINT
COLOR 5
PRINT TAB(21); "Willst du eine weitere Runde spielen"
DO
LOCATE 19, 58: PRINT SPACE$(22)
LOCATE 19, 58: INPUT noch$
noch$ = LCASE$(noch$)
LOOP UNTIL noch$ = "n" OR noch$ = "j"
LOOP WHILE noch$ = "j" AND geld > 0
IF geld <= 0 AND noch$ = "j" THEN PRINT TAB(21); "Leider hast du jetzt kein Geld mehr. Tja!"
IF noch$ = "n" AND geld > 0 THEN PRINT TAB(23); "Schade, dass du nun aufh”ren willst."
IF geld <= 0 AND noch$ = "n" THEN
 PRINT TAB(21); "Schade, dass du jetzt aufh”ren m”chtest,"
 PRINT TAB(20); "aber du hattest ja sowieso kein Geld mehr !"
END IF
PRINT TAB(14); "Bis zum Nchstenmal! Ich hoffe, du spielst bald wieder!"
COLOR 0

