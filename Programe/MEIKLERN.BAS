SCREEN 12
RANDOMIZE TIMER
CLS
PRINT "               Tippen lernen fÅr absolute LOOSER (Dumpfbacken)"
PRINT "       ->also Versager, so richtig dumme Menschen der Kategorie Dreck..."
PRINT "         --- Wenn du denkst, du bist dumm genug, dann drÅcke Enter! ---"
PRINT "                  falls du NOCH DöMMER bist drÅcke Escape!"
LOCATE 20, 50: PRINT "...bitte Escape drÅcken..."
DO: LOOP UNTIL INKEY$ = CHR$(27)
CLS
DO
 z$ = CHR$(INT(RND * 26 + 65))
 'IF t$ = z$ THEN
 tim = TIMER
 DO
  LOCATE 1, 1: PRINT z$, "Punkte:"; pp, "Gesamt:"; pkt,
  IF anz <> 0 THEN PRINT "Durchschnitt:"; INT(10 * pkt / anz) / 10
  LOCATE 27, 5: COLOR 13: PRINT "Powered by Meik Rose     call me: 016092948191"
  LOCATE 28, 34: PRINT "USA: 0800-NAKED-BOYZ"
  COLOR 15
  FOR x = 0 TO 7
   FOR y = 1 TO 15
    LINE (200 + x * 25, y * 25 + 16)-STEP(25, 25), POINT(x, y), BF
   NEXT y
  NEXT x
  DO: t$ = UCASE$(INKEY$): LOOP WHILE t$ = ""
  IF t$ <> CHR$(27) AND t$ <> z$ THEN pkt = pkt - 400: pp = -400
  IF t$ = "." THEN pkt = pkt + 1000: pp = 1000
 LOOP UNTIL t$ = z$ OR t$ = CHR$(27)
 tim = TIMER - tim
 pp = INT(100 / tim)
 IF t$ = z$ THEN anz = anz + 1
 pkt = pkt + pp
 PLAY "l32t255cefdgbadcef"
 BEEP
LOOP UNTIL t$ = CHR$(27)

