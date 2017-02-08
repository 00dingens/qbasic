CLS
PRINT : PRINT TAB(30); "S U P E R H I R N"
PRINT TAB(29); "-------------------"

'############################### HAUPTPROGRAMM ##############################

GOSUB 17             'Spielbeschreibung
WHILE NOT schluss
 GOSUB 38            'Anfangsbedingungen
 GOSUB 51            'Spielgeschehen
 GOSUB 67            'Gewinnentscheid
 GOSUB 78            'Wiederholung?
WEND
GOSUB 87             'Verabschiedung
END

'############################################################################

17 : '************************ SPIELBESCREIBUNG *****************************

PRINT : PRINT
PRINT "Mîchtest du die Spielregeln Kennenlernen?(j,n)"
DO: t$ = INKEY$: LOOP WHILE t$ <> "j" AND t$ <> "n"
IF t$ = "n" THEN RETURN

PRINT : PRINT
PRINT "   Ich denke mir eine 4 - Stellige Zahl"
PRINT "   aus lauter verschiedenen Ziffern,"
PRINT "   die du erraten sollst."
PRINT "   Wenn eine Ziffer erraten wurde, aber nicht"
PRINT "   an der richtigen Stelle, zÑhlt dies als"
PRINT "   Halbtreffer, sonst als Volltreffer."
PRINT : PRINT "     DrÅcke nun eine Taste!"
DO: LOOP WHILE INKEY$ = ""
RETURN

'****************************************************************************

38 : '********************** ANFANGSBEDINGUNGEN *****************************

RANDOMIZE TIMER
FOR i = 1 TO 9: u(i) = i: NEXT i
FOR i = 9 TO 2 STEP -1
 k = INT(RND * i) + 1
 SWAP u(i), u(k)
NEXT i
abbruch = 0
RETURN

'****************************************************************************

51 : '************************ SPIELGESCHEHEN *******************************

versuche = 0
DO
 versuche = versuche + 1
 PRINT : PRINT versuche; ". Versuch:"
 INPUT "Gib deine Zahl ein ( Aufgabe mit @ ) ", l$
 IF l$ = "@" THEN abbruch = -1: RETURN
 l$ = LEFT$(l$, 4)
 GOSUB 96
 IF volltr = 4 THEN RETURN
 PRINT : PRINT "Du erreichtest"; volltr; "Volltreffer und"; halbtr; "Halbtreffer"
LOOP

'****************************************************************************

67 : '************************ GEWINNENTSCHEID ******************************

PRINT
IF abbruch THEN PRINT "Aufgegeben!": hhhh = 1
IF hhhh <> 1 THEN PRINT "Du hast die unbekannte Zahl in"; versuche; "Versuchen erraten"
PRINT : PRINT "Die Zahl war ";
FOR i = 1 TO 4: PRINT u(i); : NEXT i
RETURN

'****************************************************************************

78 : '************************ WIEDERHOLUNG ? *******************************

PRINT : PRINT : PRINT "Noch einmal ? (j/n)"
DO: t$ = INKEY$: LOOP WHILE t$ <> "j" AND t$ <> "n"
IF t$ = "n" THEN schluss = -1
RETURN

'****************************************************************************

87 : '************************ VERABSCHIEDUNG *******************************

PRINT : PRINT
PRINT "Es war schîn mit dir zu spielen."
PRINT "           Bis bald !"
RETURN

'****************************************************************************

96 : '+++++++++++++++++++++++ TREFFERBESTIMMUNG +++++++++++++++++++++++++++++

FOR i = 1 TO 4
 l(i) = VAL(MID$(l$, i, 1))
 c(i) = u(i)
NEXT i
volltr = 0
FOR i = 1 TO 4
 IF l(i) = c(i) THEN volltr = volltr + 1: l(i) = -1: c(i) = -2
NEXT i
halbtr = 0
FOR i = 1 TO 4
 FOR j = 1 TO 4
  IF l(i) = c(j) THEN halbtr = halbtr + 1: l(i) = -1: c(j) = -2
 NEXT j
NEXT i
RETURN

'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

