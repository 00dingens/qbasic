DECLARE SUB Spa (l!)
DECLARE SUB Mit (a$, l!)
RANDOMIZE TIMER
CLS
Mit "Wrfel-Spiel", 2
Mit "ออออออออออออออ", 3
DO
 Spa 5
 Mit "Wieviele Personen spielen mit (max. 15)", 5
 INPUT a
LOOP UNTIL a < 16 AND a > 0
DIM Nam(a) AS STRING, Geld(a) AS LONG, Tip(a) AS STRING * 1, Ein(a) AS LONG
FOR x = 1 TO a
 DO
  Spa 7 + x
  LOCATE 7 + x, 10
  COLOR x
  PRINT "Spieler"; x;
  INPUT "bitte Name eingeben (max. 15 Zeichen): ", Nam(x)
 LOOP WHILE Nam(x) = "" OR LEN(Nam(x)) > 15
 COLOR 7
 Geld(x) = 10
NEXT x
COLOR 7
Mit "Jeder Spieler erhlt 10 Geld.", 9 + a
Mit "Weiter mit einer beliebigen Taste.", 10 + a
DO: LOOP WHILE INKEY$ = ""
Los:
COLOR 7
CLS
Mit "Wrfel-Spiel", 2
Mit "ออออออออออออออ", 3
PRINT : PRINT ''179ณ180ดตถทธนบปผฝ190พฟภมยรฤลฦว200ศษสหฬอฮฯะั210าำิีึืฺุูÛ220Ü
PRINT "ษอออออออออออออออออหอออออออออหอออออัอออออออออป    Wurf:  ษออออออออออัออออออออออป"
PRINT "บ Name            บ Geld    บ Tip ณ Einsatz บ    ษอออป  บ          ณ          บ"
PRINT "ฬอออออออออออออออออฮอออออออออฮอออออุอออออออออน    บ ? บ  บ Ungerade ณ  Gerade  บ"
PRINT "                                                 ศอออผ  บ          ณ          บ"
PRINT "                                              ษอออออออออฮออออออออออุออออออออออน"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              บ    A    บ    1     ณ    2     บ"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              วฤฤฤฤฤฤฤฤฤืฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤถ"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              บ    B    บ    3     ณ    4     บ"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              วฤฤฤฤฤฤฤฤฤืฤฤฤฤฤฤฤฤฤฤลฤฤฤฤฤฤฤฤฤฤถ"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              บ    C    บ    5     ณ    6     บ"
PRINT "                                              บ         บ          ณ          บ"
PRINT "                                              ศอออออออออสออออออออออฯออออออออออผ"
FOR x = 1 TO a
 LOCATE x + 7, 1: PRINT "บ                 บ         บ     ณ         บ"
 COLOR x: LOCATE x + 7, 3: PRINT Nam(x)
 LOCATE x + 7, 28 - LEN(STR$(Geld(x))): PRINT Geld(x): COLOR 7
NEXT x
LOCATE a + 8, 1: PRINT "ศอออออออออออออออออสอออออออออสอออออฯอออออออออผ"
FOR x = 1 TO a
 IF Geld(x) > 0 THEN
Setz:
  LOCATE 22, 47: PRINT SPACE$(34)
  LOCATE 23, 47: PRINT SPACE$(34)
  LOCATE 22, 47: PRINT Nam(x); " ist dran."
  LOCATE 23, 47: PRINT "Setze auf A/B/C, G/U oder 1-6."
  LOCATE x + 7, 32, 1, 1, 31
  DO: t$ = UCASE$(INKEY$): LOOP UNTIL t$ = "U" OR t$ = "G" OR t$ = "A" OR t$ = "B" OR t$ = "C" OR t$ = "1" OR t$ = "2" OR t$ = "3" OR t$ = "4" OR t$ = "5" OR t$ = "6"
  Tip(x) = t$
  COLOR x: LOCATE x + 7, 32: PRINT Tip(x): COLOR 7
  LOCATE 23, 47: PRINT SPACE$(34)
  LOCATE 23, 47: PRINT "Gebe den Betrag ein, den du setzt!"
  Ein(x) = 0
  DO
   LOCATE x + 7, 43, 1, 1, 31
   DO: t$ = UCASE$(INKEY$): LOOP UNTIL t$ < ":" AND t$ > "/" OR t$ = CHR$(13) OR t$ = CHR$(8)
   SELECT CASE t$
   CASE CHR$(8): Ein(x) = INT(Ein(x) / 10)
   CASE CHR$(13): t$ = t$
   CASE ELSE:
   Ein(x) = Ein(x) * 10 + VAL(t$)
   IF Ein(x) > Geld(x) THEN Ein(x) = INT(Ein(x) / 10)
   END SELECT
   LOCATE x + 7, 44 - LEN(STR$(Ein(x))): PRINT Ein(x)
  LOOP UNTIL t$ = CHR$(13)
  IF Ein(x) = 0 THEN
  LOCATE x + 7, 32, 1, 1, 31: PRINT " "
  LOCATE x + 7, 43: PRINT " "
  GOTO Setz
  END IF
  COLOR x: LOCATE x + 7, 44 - LEN(STR$(Ein(x))): PRINT Ein(x): COLOR 7
 ELSE
  LOCATE x + 7, 32: PRINT "ฤ"
  LOCATE x + 7, 37: PRINT "ฤฤฤฤฤฤฤ"
 END IF
NEXT x
LOCATE 22, 47: PRINT SPACE$(34)
LOCATE 23, 47: PRINT SPACE$(34)
t = TIMER
LOCATE 7, 51, 0, 8, 9
DO
 ww = INT(RND * 6 + 1)
 LOCATE 7, 51: PRINT ww
 SOUND 1000, .023
LOOP UNTIL t + 1 < TIMER
FOR x = 1 TO 5
 SOUND 1000, 1
 LOCATE 7, 51: PRINT ww
 SOUND 2000, 1
NEXT x
COLOR 31
SELECT CASE ww
CASE 1
 w1$ = "1": w2$ = "A": w3$ = "U"
 LOCATE 7, 59: PRINT "Ungerade"
 LOCATE 11, 52: PRINT "A"
 LOCATE 11, 62: PRINT "1"
CASE 2
 w1$ = "2": w2$ = "A": w3$ = "G"
 LOCATE 7, 71: PRINT "Gerade"
 LOCATE 11, 52: PRINT "A"
 LOCATE 11, 73: PRINT "2"
CASE 3
 w1$ = "3": w2$ = "B": w3$ = "U"
 LOCATE 7, 59: PRINT "Ungerade"
 LOCATE 15, 52: PRINT "B"
 LOCATE 15, 62: PRINT "3"
CASE 4
 w1$ = "4": w2$ = "B": w3$ = "G"
 LOCATE 7, 71: PRINT "Gerade"
 LOCATE 15, 52: PRINT "B"
 LOCATE 15, 73: PRINT "4"
CASE 5
 w1$ = "5": w2$ = "C": w3$ = "U"
 LOCATE 7, 59: PRINT "Ungerade"
 LOCATE 19, 52: PRINT "C"
 LOCATE 19, 62: PRINT "5"
CASE 6
 w1$ = "6": w2$ = "C": w3$ = "G"
 LOCATE 7, 71: PRINT "Gerade"
 LOCATE 19, 52: PRINT "C"
 LOCATE 19, 73: PRINT "6"
END SELECT
LOCATE 23, 47: PRINT "Es wurde eine "; w1$; " geworfen!"
COLOR 7
FOR x = 1 TO a
 IF Tip(x) = w1$ OR Tip(x) = w2$ OR Tip(x) = w3$ THEN
  LOCATE x + 7, 32: PRINT " "
  COLOR x + 16: LOCATE x + 7, 32: PRINT Tip(x): COLOR 7
 END IF
NEXT x
DO: LOOP WHILE INKEY$ = ""
FOR x = 1 TO a
 Geld(x) = Geld(x) - Ein(x)
 IF Tip(x) = w1$ THEN Geld(x) = Geld(x) + Ein(x) * 6
 IF Tip(x) = w2$ THEN Geld(x) = Geld(x) + Ein(x) * 3
 IF Tip(x) = w3$ THEN Geld(x) = Geld(x) + Ein(x) * 2
 LOCATE x + 7, 1: PRINT "บ                 บ         บ     ณ         บ"
 COLOR x: LOCATE x + 7, 3: PRINT Nam(x)
 LOCATE x + 7, 28 - LEN(STR$(Geld(x))): PRINT Geld(x): COLOR 7
 Ein(x) = 0: Tip(x) = ""
NEXT x
LOCATE 22, 47: PRINT SPACE$(34)
LOCATE 23, 47: PRINT SPACE$(34)
LOCATE 23, 47: PRINT "Jetzt Escape drcken zum Beenden"
DO: t$ = INKEY$: LOOP WHILE t$ = ""
IF t$ <> CHR$(27) THEN GOTO Los
COLOR 7
CLS
Mit "Wrfel-Spiel", 2
Mit "ออออออออออออออ", 3
DIM p(a)
FOR x = 1 TO a
 p(x) = x
NEXT x
FOR x = 1 TO a
 FOR y = x TO a
  IF Geld(p(x)) < Geld(p(y)) THEN SWAP p(x), p(y)
 NEXT y
NEXT x
FOR x = 1 TO a
 COLOR p(x)
 LOCATE x + 4, 25: PRINT Nam(p(x))
 LOCATE x + 4, 55 - LEN(STR$(Geld(p(x)))): PRINT Geld(p(x)); "Geld"
NEXT x
COLOR 7
IF a = 1 THEN
 Mit "Spiel mal wieder", a + 7
ELSE
 Mit "Herzlichen Glckwunsch, " + Nam(p(1)), a + 6
 Mit "Spielt mal wieder", a + 8
END IF
DO: LOOP WHILE INKEY$ = ""

SUB Mit (a$, l)
LOCATE l, 40 - INT(LEN(a$) / 2)
PRINT a$;
END SUB

SUB Spa (l)
LOCATE l, 1
PRINT SPACE$(80)
END SUB

