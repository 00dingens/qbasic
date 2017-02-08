'spiel:
'gegeben ist gitter mit zahlen darin.
'um die zu verwendende farbe fr ein k„stchen zu erhalten,
'z„hle man die 4 angrenzenden zahlen zusammen, und ziehe die
'farbanzahl so oft wie m”glich ab. der rest ist die farbe (MOD)

'zu erstellen:
'die zahlen links, oben und unten werden per zufall erzeugt.
'dann spaltenweise(oder reihenweise) durchgehen, und die jeweils 4.
'zahl errechnen.

'l”sung als bitmap vorgegeben, r„tsel wird in htm geschrieben.

'ininialisierung
DIM a(1000) AS STRING * 3
DIM z(0) AS INTEGER
DIM o(201, 201) AS STRING * 1
SCREEN 13
INPUT "Dateiname Eingeben:", name$
RANDOMIZE TIMER
'l”sungsbild
OPEN "c:\windows\desktop\modbild\" + name$ + ".bmp" FOR BINARY AS #1
'bildgr”áe
GET #1, 19, z(0)
xx = z(0)
GET #1, 23, z(0)
yy = z(0)
IF xx > 200 OR yy > 200 THEN LOCATE 5, 1: PRINT "x ="; xx; "   y ="; yy; " -> Bild ist zu groá (max 200x200)": GOTO ende

'replace errechnen
r = (((LOF(1) - 54) / yy) - 3 * xx)
IF r <> INT(r) THEN PRINT r; : INPUT "Bitte replace eingeben:", r

FOR m = 0 TO yy - 1
 FOR n = 0 TO xx - 1
  GET #1, 55 + m * (3 * xx + r) + n * 3, a(0)
  FOR x = 1 TO fa
   IF a(0) = a(x) THEN GOTO gefunden
  NEXT x
  fa = fa + 1
  IF fa > 999 THEN LOCATE 5, 1: PRINT " Das Bild darf maximal 999 Farben haben!": GOTO ende
  x = fa
  a(fa) = a(0)
gefunden:
  PSET (n, yy - 1 - m), x
 NEXT n
NEXT m
CLOSE
FOR x = 1 TO fa
 OUT &H3C8, x
 OUT &H3C9, INT(ASC(MID$(a(x), 3, 1)) / 4)
 OUT &H3C9, INT(ASC(MID$(a(x), 2, 1)) / 4)
 OUT &H3C9, INT(ASC(MID$(a(x), 1, 1)) / 4)
NEXT x

'jetzt wird das r„tsel erzeugt

'zahlen berechnen
FOR x = 0 TO xx + 1
 o(x, 0) = CHR$(INT(RND * fa))
 o(x, 1) = CHR$(INT(RND * fa))
NEXT x
FOR y = 2 TO yy + 1
 o(0, y) = CHR$(INT(RND * fa))
 FOR x = 1 TO xx
  ppp = POINT(x - 1, y - 2) - 1 + fa * 4 - ASC(o(x - 1, y - 1)) - ASC(o(x, y - 2)) - ASC(o(x + 1, y - 1))
  o(x, y) = CHR$((ppp) MOD fa)
 NEXT x
 o(xx + 1, y) = CHR$(INT(RND * fa))
NEXT y

'zahlen in datei schreiben
OPEN "c:\windows\desktop\modbild\" + name$ + ".htm" FOR OUTPUT AS #1
PRINT #1, "<html><head><title>Zahlen-R&auml;tsel ("; name$; ") von Rafael</title></head><body>"
PRINT #1, "<h1>Zahlen-R&auml;tsel ("; name$; ") von Rafael Friesen</h1>"
PRINT #1, "Bei diesem R&auml;tsel geht es darum, alle K&auml;stchen mit";
PRINT #1, " der richtigen Farbe auszumalen. Um die zu verwendende Farbe";
PRINT #1, " f&uuml;r ein K&auml;stchen zu erhalten, z&auml;hle man die Zahlen";
PRINT #1, " aus den 4 angrenzenden K&auml;stchen zusammen (also die von";
PRINT #1, " dr&uuml;ber, drunter, rechts und links), und teile das Ergebnis";
PRINT #1, " durch die Gesamtfarbenzahl ("; fa; "). Der Rest der Division ist";
PRINT #1, " die Nummer der Farbe f&uuml;r das K&auml;stchen.<br><br>"
PRINT #1, "Gesamtfarbenzahl:"; fa; "<br>"
PRINT #1, "RGB-Werte in HEX (#RRGGBB) <br>"
PRINT #1, "<table border=0 cellspacing=0 width=50%>"
FOR x = 1 TO fa
 fff$ = RIGHT$("00" + HEX$(ASC(MID$(a(x), 3, 1))), 2) + RIGHT$("00" + HEX$(ASC(MID$(a(x), 2, 1))), 2) + RIGHT$("00" + HEX$(ASC(MID$(a(x), 1, 1))), 2)
 ffc$ = RIGHT$("00" + HEX$(255 - ASC(MID$(a(x), 3, 1))), 2) + RIGHT$("00" + HEX$(255 - ASC(MID$(a(x), 2, 1))), 2) + RIGHT$("00" + HEX$(255 - ASC(MID$(a(x), 1, 1))), 2)
 PRINT #1, "<tr><td width=40%>Farbe"; x - 1; "("; x - 1 + fa; ","; x - 1 + fa + fa; "):</td><td bgcolor=#"; fff$; "><font color=#"; ffc$; "><small> #"; fff$; "</small></font></td><tr>"
NEXT x
PRINT #1, "</table><br>"

PRINT #1, "<tt><small><nobr>"
PRINT #1, "+";
FOR x = 0 TO xx + 1
 PRINT #1, "---+";
NEXT x
PRINT #1, "<br>"
FOR y = 0 TO yy + 1
 PRINT #1, "|";
 FOR x = 0 TO xx + 1
  IF fa < 11 THEN PRINT #1, ASC(o(x, y)); "|";
 NEXT x
 PRINT #1, "<br>"
 PRINT #1, "+";
 FOR x = 0 TO xx + 1
  PRINT #1, "---+";
 NEXT x
 PRINT #1, "<br>"
NEXT y
PRINT #1, "</nobr></small></tt></body></html>"

ende:
DO: LOOP WHILE INKEY$ = ""
CLOSE
END

