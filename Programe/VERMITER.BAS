RANDOMIZE TIMER
CLS
PRINT "                               €ﬂﬂﬂ‹ €ﬂﬂﬂﬂ €ﬂﬂﬂ‹                "
PRINT "                               €   € €‹‹‹  €‹‹‹ﬂ                "
PRINT "                               €   € €     € ﬂ‹                 "
PRINT "                               ﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂ ﬂ   ﬂ                "
PRINT "               €   € €ﬂﬂﬂﬂ €ﬂﬂﬂ‹ €‹ ‹€ € €ﬂﬂﬂﬂ ﬂﬂ€ﬂﬂ €ﬂﬂﬂﬂ €ﬂﬂﬂ‹ ©"
PRINT "               €   € €‹‹‹  €‹‹‹ﬂ € ﬂ € € €‹‹‹    €   €‹‹‹  €‹‹‹ﬂ"
PRINT "               ﬂ‹ ‹ﬂ €     € ﬂ‹  €   € € €       €   €     € ﬂ‹ "
PRINT "                 ﬂ   ﬂﬂﬂﬂﬂ ﬂ   ﬂ ﬂ   ﬂ ﬂ ﬂﬂﬂﬂﬂ   ﬂ   ﬂﬂﬂﬂﬂ ﬂ   ﬂ"
PRINT "                          Eine Wirtschaftssimulation            "
PRINT "                              von Rafael Friesen                "
DIM n(16) AS STRING, w(16), f(16)
n$(1) = "Berlin"
n$(2) = "Bremen"
n$(3) = "Dortmund"
n$(4) = "Dresden"
n$(5) = "Erfurt"
n$(6) = "Essen"
n$(7) = "Frankfurt"
n$(8) = "Hamburg"
n$(9) = "Hannover"
n$(10) = "Kîln"
n$(11) = "Leipzig"
n$(12) = "Lieme"
n$(13) = "Mannheim"
n$(14) = "MÅnchen"
n$(15) = "NÅrnberg"
n$(16) = "Stuttgart"
FOR x = 1 TO 16
 w(x) = INT(RND * 100 + 1) / 10
NEXT x
f(INT(RND * 16 + 1)) = INT(RND * 30 + 1)
g = 10000
DO
 DO: LOOP WHILE INKEY$ = ""
 CLS
 PRINT : PRINT : PRINT
 PRINT TAB(27); "         M E N ö"
 PRINT TAB(27); "BesitztÅmer ˙˙˙˙˙˙˙˙˙˙˙ 1"
 PRINT TAB(27); "Einkommen ˙˙˙˙˙˙˙˙˙˙˙˙˙ 2"
 PRINT TAB(27); "Kaufen ˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙˙ 3"
 PRINT TAB(27); "NÑchste Runde ˙˙˙˙˙˙˙˙˙ 4"
 PRINT TAB(27); "Spiel beenden ˙˙˙˙˙˙˙˙˙ 5"
 DO: t$ = INKEY$: LOOP UNTIL t$ < "6" AND t$ > "0"
 SELECT CASE t$
  CASE "1"
   CLS : PRINT : PRINT : PRINT
   PRINT TAB(29); "B E S I T Z T ö M E R"
   PRINT : PRINT
   FOR x = 1 TO 16
    IF f(x) <> 0 THEN PRINT TAB(15); "In " + n(x) + " besitzt du insgesamt"; f(x); "m˝ WohnflÑche."
   NEXT x
   PRINT : PRINT "Ausserdem besitzt du"; CDBL(g); "Reichsmark."
  CASE "2"
   CLS : PRINT : PRINT : PRINT
   PRINT TAB(31); "E I N K O M M E N"
   PRINT : PRINT
   ein = 0
   FOR x = 1 TO 16
    IF f(x) <> 0 THEN PRINT TAB(10); "In " + n(x) + " hast du ein Einkommen von"; CDBL(INT(f(x) * w(x) * 10)); "Reichsmark pro Runde.": ein = INT(ein + f(x) * w(x) * 10)
   NEXT x
   PRINT : PRINT "Das sind insgesamt"; CDBL(ein); "Reichsmark pro Runde."
  CASE "3"
   CLS : PRINT : PRINT : PRINT
   PRINT TAB(31); "K A U F E N"
   PRINT : PRINT
   FOR x = 1 TO 16
    LOCATE x + 5, 25: PRINT CHR$(x + 64) + ")" + n(x) + " ˙˙˙˙˙˙˙˙˙˙˙"
    LOCATE x + 5, 40: PRINT " Preis pro m˝:"; INT(w(x) * 830)
   NEXT x
   LOCATE 22, 5: PRINT "In welcher Stadt mîchtest du WohnflÑche kaufen?"
   DO: t$ = LCASE$(INKEY$): LOOP UNTIL t$ >= "a" AND t$ <= "p"
   q = INT(g / INT(w(ASC(t$) - 96) * 830))
   DO
    LOCATE 22, 5: PRINT SPACE$(75)
    LOCATE 23, 5: PRINT SPACE$(75)
    LOCATE 22, 5: PRINT "Du kannst in " + n(ASC(t$) - 96) + " hîchstens"; q; "m˝ WohnflÑche kaufen."
    LOCATE 23, 5: PRINT "Wieviel WohnflÑche mîchtest du in " + n(ASC(t$) - 96) + " kaufen";
    INPUT x
   LOOP UNTIL x >= 0 AND x <= q
   f(ASC(t$) - 96) = f(ASC(t$) - 96) + x
   g = g - x * INT(w(ASC(t$) - 96) * 830)
  CASE "4"
   CLS
   ein = 0
   FOR x = 1 TO 16
    IF f(x) <> 0 THEN ein = ein + f(x) * w(x) * 10
   NEXT x
   PRINT : PRINT "Du hast diese Runde"; CDBL(INT(ein)); "Reichsmark eingenommen."
   g = g + ein
   PRINT : PRINT "Jetzt hast du"; CDBL(INT(g)); "Reichsmark."
  CASE "5"
   CLS
   ein = 0
   FOR x = 1 TO 16
    IF f(x) <> 0 THEN ein = ein + f(x) * w(x) * 10
   NEXT x
   PRINT : PRINT "Du hast diese Runde"; CDBL(INT(ein)); "Reichsmark eingenommen."
   g = g + ein
   PRINT : PRINT "Jetzt hast du"; CDBL(INT(g)); "Reichsmark und das Spiel ist zuende."
   EXIT DO
 END SELECT
LOOP

