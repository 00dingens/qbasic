
'Galgenm„nnchen

RANDOMIZE TIMER
s = 1
CLS
LOCATE 12, 5
PRINT "Wieviele Mitspieler (1-2)?"
DO
 m = VAL(INKEY$)
LOOP UNTIL m > 0 AND m < 3
LOCATE 12, 30: PRINT m
SELECT CASE m
 CASE 1
  READ q
  FOR x = 1 TO INT(RND * q) + 1
   READ w$
  NEXT x
 CASE 2
  LOCATE 15, 1
  PRINT "Spieler "; s; " bitte Wort eingeben!"
  LOCATE 15, 35: INPUT "", w$
  w$ = UCASE$(w$)
END SELECT
FOR x = 1 TO LEN(w$)
 a$ = a$ + "ú"
NEXT x
DO UNTIL a$ = w$
los:
 CLS
 PRINT "ÉÍÍÍÍÍÍÍÍÍÍ»"
 PRINT "º          º"
 PRINT "ÈÍÍÍÍÍÍÍÍÍÍ¼"
 LOCATE 2, 2
 FOR x = 1 TO y: PRINT "Û"; : NEXT x
 LOCATE 5, 15: PRINT "Das Wort bis jetzt:"; a$
 LOCATE 10, 15: PRINT "Bereits geratene Buchstaben:"; z$
 SELECT CASE m
  CASE 1
   LOCATE 15, 15: PRINT "Bitte einen Buchstaben eingeben";
  CASE 2
   LOCATE 15, 15: PRINT "Spieler"; 3 - s; "bitte einen Buchstaben eingeben";
 END SELECT
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 t$ = UCASE$(t$)
 IF t$ = "" THEN LOCATE 20, 20: PRINT "Aufgegeben !": END
 FOR x = 1 TO LEN(z$)
  IF t$ = MID$(z$, x, 1) THEN
   LOCATE 17, 10: PRINT "Buchstabe wurde bereits eingegeben!"
   DO: LOOP WHILE INKEY$ = ""
   GOTO los
  END IF
 NEXT x
 IF ASC(t$) > 90 OR ASC(t$) < 65 THEN
  LOCATE 17, 10: PRINT "Buchstabe ist unzul„ssig!"
  DO: LOOP WHILE INKEY$ = ""
  GOTO los
 END IF
 z$ = z$ + t$: p = 1
 FOR x = 1 TO LEN(w$)
  'IF MID$(w$, x, 1) = t$ THEN MID$(a$, x, 1) = t$
  IF MID$(w$, x, 1) = t$ THEN
   p = 0
   a$ = LEFT$(a$, x - 1) + t$ + RIGHT$(a$, LEN(a$) - x)
  END IF
 NEXT x
 IF p = 1 THEN y = y + 1
 IF y = 10 THEN LOCATE 13, 20: COLOR 4: PRINT "N I C H T   G E S C H A F F T !": GOSUB ende
LOOP
LOCATE 5, 15: PRINT "Das Wort bis jetzt:"; a$
LOCATE 20, 20: PRINT "Gewonnen !": END
ende:
LOCATE 23, 15: PRINT "Das Wort heisst:"; w$
COLOR 0

DATA 4,HAUS,WEIHNACHTEN,KRANKENHAUS,HEINZELMAENNCHEN

