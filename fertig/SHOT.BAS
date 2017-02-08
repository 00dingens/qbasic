RANDOMIZE TIMER
 SCREEN 7, , 1, 1
CLS
PRINT "     S C H U S S S I M U L A T O R"
PRINT "    -------------------------------"
PRINT
PRINT : PRINT "   Du darfst 20x schiessen, aus immer"
PRINT : PRINT "   grîsserer Entfernung."
PRINT : PRINT "   Bitte eine Taste drÅcken!"
DO: LOOP WHILE INKEY$ = ""
FOR e = 1 TO 20
 SCREEN 7, , 1, 1
 CLS
 PRINT "     S C H U S S S I M U L A T O R"
 PRINT "    -------------------------------"
 PRINT
 PRINT : PRINT "  Entfernung:"; e * 10; "Meter"
 PRINT : PRINT "  Bitte warten!": SLEEP 2
 SCREEN 7, , 0, 1
 x = 130 + INT(RND * 60): z = 70 + INT(RND * 60)
 DO
  t$ = INKEY$
  SELECT CASE t$
  CASE CHR$(0) + "H": z = z - e
  CASE CHR$(0) + "P": z = z + e
  CASE CHR$(0) + "K": x = x - e
  CASE CHR$(0) + "M": x = x + e
  END SELECT
  x = x + INT(RND * (2 * e + 1) - e)
  z = z + INT(RND * (2 * e + 1) - e)
  CLS
  CIRCLE (160, 100), 50, 14
  PAINT (160, 100), 14, 14
  CIRCLE (160, 100), 30, 6
  PAINT (160, 100), 6, 6
  CIRCLE (160, 100), 10, 4
  PAINT (160, 100), 4, 4
  CIRCLE (x, z), 5, 8
  LINE (x, z + 5)-(x, z + 20), 8
  LINE (x, z - 5)-(x, z - 20), 8
  LINE (x + 5, z)-(x + 20, z), 8
  LINE (x - 5, z)-(x - 20, z), 8
  PCOPY 0, 1
 LOOP UNTIL t$ = " "
 CLS
 CIRCLE (160, 100), 50, 14
 PAINT (160, 100), 14, 14
 CIRCLE (160, 100), 30, 6
 PAINT (160, 100), 6, 6
 CIRCLE (160, 100), 10, 4
 PAINT (160, 100), 4, 4
 f = INT(SQR((x - 160) ^ 2 + (z - 100) ^ 2))
 SELECT CASE f
 CASE IS < 2: p = 50
 CASE IS < 5: p = 30
 CASE IS < 10: p = 20
 CASE IS < 15: p = 15
 CASE IS < 20: p = 10
 CASE IS < 25: p = 7
 CASE IS < 30: p = 5
 CASE IS < 35: p = 3
 CASE IS < 40: p = 2
 CASE IS < 45: p = 1.5
 CASE IS < 50: p = 1
 CASE IS < 55: p = .7
 CASE IS < 60: p = .5
 CASE IS < 65: p = .3
 CASE IS < 70: p = .2
 CASE IS < 75: p = .15
 CASE IS < 80: p = .1
 CASE ELSE: p = 0
 END SELECT
 p = INT(p * e)
 pp = pp + p
 CIRCLE (x, z), 4, 8
 PAINT (x, z), 0, 8
 PCOPY 0, 1
 DO: LOOP WHILE INKEY$ = ""
 SCREEN 7, , 1, 1
 CLS
 PRINT "     S C H U S S S I M U L A T O R"
 PRINT "    -------------------------------"
 PRINT
 PRINT : PRINT "  Du hast diesmal"; p; "Punkte bekommen."
 PRINT : PRINT "  Insgesammt hast du nun"; pp; "Punkte."
 DO: LOOP WHILE INKEY$ = ""
NEXT e

