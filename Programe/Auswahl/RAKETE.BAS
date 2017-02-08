
'Zwei Raketen fliegen um einen Planeten, und beschiessen sich

RANDOMIZE TIMER
DEFDBL A-Z
w = 300         'Anziehungskraft des Planeten (3 - 400)
aktion = 10     'Anzahl der Bilder nach dem Abfeuern der Bombe, bis diese aktiv wird
leben = 5       'Anzahl der Leben
rakete = 15     'LÑnge der Rakete
sped = 5        'Hîchstgeschwindigkeit (ca. 1 - 10)
bomb = 12       'Bombenfarbe
empfrak = 15    'Aktionsradius einer Bombe gegenÅber einer Rakete
empfbom = 3     'Aktionsradius einer Bombe gegenÅber einer anderen Bombe
rakrak = 2      'Entfernung, bei der beide Raketen Explodieren
steril = 1      'Wenn steril = 1 dann bleibt keine Spur
speed = .2       'StÑrke der Beschleunigung
CLS
PRINT "                    R O C K E T L A U N C H E R"
PRINT "                   ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
PRINT "                         VON RAFAEL FRIESEN"
PRINT
PRINT "                             Steuerung:"
PRINT
PRINT "              Spieler 1 (braun)      Spieler 2 (lila)"
PRINT
PRINT "                  Schneller              Schneller"
PRINT "                      W                      " + CHR$(24)
PRINT "              links A   D rechts    links  " + CHR$(27) + "   " + CHR$(26) + " rechts"
PRINT "                      S                      " + CHR$(25)
PRINT "                    Bombe                  Bombe"
PRINT
PRINT "                Bomben lîschen: Q     Bomben lîschen: Entf"
PRINT : PRINT
PRINT "     Ende mit Esc.    ";
IF steril <> 1 THEN PRINT "Spuren lîschen mit Leertaste."
PRINT : PRINT : PRINT
DO: LOOP WHILE INKEY$ = ""

PRINT "DrÅcke jetzt E um mit verÑnderten Einstellungen zu spielen."
DO: t$ = UCASE$(INKEY$): LOOP WHILE t$ = ""
IF t$ = "E" THEN
 CLS
 PRINT "                            E I N S T E L L U N G E N"
 PRINT "                           ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
 PRINT : PRINT "Um die Grundeinstellung der jeweiligen Grî·e zu verwenden: Enter drÅcken."

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Der Faktor der Anziehungskraft des Planeten."
 LOCATE 6, 1: INPUT "Gravitation (3 - 400): ", w
 IF w < 3 OR w > 400 THEN w = 300
 LOCATE 6, 1: PRINT SPACE$(80)
 LOCATE 6, 1: PRINT "Gravitation: "; w

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Die Anzahl der Bilder nach dem Abwerfen der Bombe, bis diese aktiviert wird."
 LOCATE 7, 1: INPUT "Bombenaktivierung (1 - 100): ", aktion
 IF aktion < 1 OR aktion > 100 THEN aktion = 10
 LOCATE 7, 1: PRINT SPACE$(80)
 LOCATE 7, 1: PRINT "Bombenaktivierung: "; aktion

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Die Anzahl der Leben pro Spieler."
 LOCATE 8, 1: INPUT "Leben (1 - 20): ", leben
 IF leben < 1 OR leben > 20 THEN leben = 10
 LOCATE 8, 1: PRINT SPACE$(80)
 LOCATE 8, 1: PRINT "Leben: "; leben

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Die LÑnge der Raketen."
 LOCATE 9, 1: INPUT "RaketenlÑnge (1 - 20): ", rakete
 IF rakete < 1 OR rakete > 20 THEN rakete = 15
 LOCATE 9, 1: PRINT SPACE$(80)
 LOCATE 9, 1: PRINT "RaketenlÑnge: "; rakete

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Die hîchste erreichbare Geschwindigkeit."
 LOCATE 10, 1: INPUT "Hîchstgeschwindigkeit (1 - 20): ", sped
 IF sped < 1 OR sped > 20 THEN sped = 5
 LOCATE 10, 1: PRINT SPACE$(80)
 LOCATE 10, 1: PRINT "Hîchstgeschwindigkeit: "; sped

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Aktionsradius einer Bombe gegenÅber einer Rakete."
 LOCATE 11, 1: INPUT "Raketenempfindlichkeit (1 - 20): ", empfrak
 IF empfrak < 1 OR empfrak > 20 THEN empfrak = 5
 LOCATE 11, 1: PRINT SPACE$(80)
 LOCATE 11, 1: PRINT "Raketenempfindlichkeit: "; empfrak

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Aktionsradius einer Bombe gegenÅber einer anderen Bombe."
 LOCATE 12, 1: INPUT "Bombenempfindlichkeit (1 - 10): ", empfbom
 IF empfbom < 1 OR empfbom > 10 THEN empfbom = 3
 LOCATE 12, 1: PRINT SPACE$(80)
 LOCATE 12, 1: PRINT "Bombenempfindlichkeit: "; empfbom

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Entfernung, bei der beide Raketen Explodieren"
 LOCATE 13, 1: INPUT "Raketenentfernung (1 - 10): ", rakrak
 IF rakrak < 1 OR rakrak > 10 THEN rakrak = 3
 LOCATE 13, 1: PRINT SPACE$(80)
 LOCATE 13, 1: PRINT "Raketenentfernung: "; rakrak

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "Wenn Spur = 1 dann erscheint eine Spur."
 LOCATE 14, 1: INPUT "Spur (0 - 1): ", spur
 IF spur < 0 OR spur > 1 THEN spur = 0
 LOCATE 14, 1: PRINT SPACE$(80)
 LOCATE 14, 1: PRINT "Spur: "; spur

 LOCATE 20, 1: PRINT SPACE$(80)
 LOCATE 20, 1: PRINT "StÑrke der Beschleunigung."
 LOCATE 15, 1: INPUT "Beschleunigung (1 - 10): ", speed
 IF speed < 1 OR speed > 10 THEN speed = 2
 LOCATE 15, 1: PRINT SPACE$(80)
 LOCATE 15, 1: PRINT "Beschleunigung: "; speed
 speed = speed / 10

END IF

SCREEN 9, , 0, 1
DIM x(2), y(2), a(2), b(2), l(2), p(2), n(15), m(15), bb(2, 6, 10), kk(2), ss(2)
x(1) = 540: y(1) = 240: a(1) = 0: b(1) = 1: l(1) = leben: p(1) = 0
x(2) = 100: y(2) = 240: a(2) = 0: b(2) = -1: l(2) = leben: p(2) = 8
FOR q = 0 TO 15
 n(q) = SIN(3.141592 / 8 * q)
 m(q) = COS(3.141592 / 8 * q)
NEXT q
CIRCLE (320, 240 * .73), 13, 8
PAINT (320, 240 * .73), 8, 8
CIRCLE (320, 240 * .73), 8, 7
PAINT (320, 240 * .73), 7, 7
CIRCLE (320, 240 * .73), 3, 15
PAINT (320, 240 * .73), 15, 15
DO
 FOR q = 1 TO 2
  r = SQR((x(q) - 320) ^ 2 + (y(q) - 240) ^ 2)                'Entfernung zum Planet
  IF r < 10 THEN x(q) = INT(RND * 640): y(q) = INT(RND * 350) 'Neue Position
  a(q) = a(q) - ((x(q) - 320) * w / r ^ 3)                    'Anziehung x
  b(q) = b(q) - ((y(q) - 240) * w / r ^ 3)                    'Anziehung y
  IF a(q) < -sped OR a(q) > sped THEN a(q) = sped * SGN(a(q)) 'Geschwindigkeitsgrenze x
  IF b(q) < -sped OR b(q) > sped THEN b(q) = sped * SGN(b(q)) 'Geschwindigkeitsgrenze y
  x(q) = x(q) + a(q): y(q) = y(q) + b(q)  'Neue Position
  IF x(q) < -1 OR x(q) > 640 THEN x(q) = (x(q) + 640) MOD 640  'Aus dem Bildschirm geflogen x
  IF y(q) < -1 OR y(q) > 480 THEN y(q) = (y(q) + 480) MOD 480  'Aus dem Bildschirm geflogen y
  '''PSET (x(q), y(q) * .73), 8
 NEXT q
 FOR q = 1 TO 2
  LINE (x(q), y(q) * .73)-(x(q) + rakete * n(p(q)), (y(q) + rakete * m(p(q))) * .73), q + 4
  IF ss(q) = 1 THEN LINE (x(q), y(q) * .73)-(x(q) - .5 * rakete * n(p(q)), (y(q) - .5 * rakete * m(p(q))) * .73), 14
  FOR s = 1 TO 10
   IF bb(q, 0, s) = 1 THEN
    IF bb(q, 5, s) > 0 THEN bb(q, 5, s) = bb(q, 5, s) - 1
    r = SQR((bb(q, 1, s) - 320) ^ 2 + (bb(q, 2, s) - 240) ^ 2)       'Entfernung zum Planet
    IF r < 10 THEN bb(q, 6, s) = 1
    bb(q, 3, s) = bb(q, 3, s) - ((bb(q, 1, s) - 320) * w / r ^ 3)    'Anziehung x
    bb(q, 4, s) = bb(q, 4, s) - ((bb(q, 2, s) - 240) * w / r ^ 3)    'Anziehung y
    bb(q, 1, s) = bb(q, 1, s) + bb(q, 3, s)
    bb(q, 2, s) = bb(q, 2, s) + bb(q, 4, s)
    IF bb(q, 1, s) < 0 OR bb(q, 1, s) > 640 THEN bb(q, 0, s) = 0
    IF bb(q, 2, s) < 0 OR bb(q, 2, s) > 480 THEN bb(q, 0, s) = 0
    IF bb(q, 5, s) = 0 THEN
     PSET (bb(q, 1, s), bb(q, 2, s) * .73), bomb
     FOR d = 1 TO 2
      IF SQR((bb(q, 1, s) - x(d)) ^ 2 + (bb(q, 2, s) - y(d)) ^ 2) < empfrak THEN bb(q, 6, s) = 1: kk(d) = 1
     NEXT d
     FOR f = 1 TO 2
      FOR d = 1 TO 10
       IF d <> s OR f <> q THEN
        IF bb(f, 0, d) = 1 THEN
         IF SQR((bb(q, 1, s) - bb(f, 1, d)) ^ 2 + (bb(q, 2, s) - bb(f, 2, d)) ^ 2) < empfbom THEN bb(q, 6, s) = 1: bb(f, 6, d) = 1
        END IF
       END IF
      NEXT d
     NEXT f
     IF bb(q, 6, s) = 1 THEN
      CIRCLE (bb(q, 1, s), bb(q, 2, s) * .73), 3, 15
      PAINT (bb(q, 1, s), bb(q, 2, s) * .73), 15, 15
      bb(q, 6, s) = 0
      bb(q, 0, s) = 0
     END IF
    END IF
   END IF
  NEXT s
 NEXT q
 IF SQR((x(1) - x(2)) ^ 2 + (y(1) - y(2)) ^ 2) < rakrak THEN kk(1) = 1: kk(2) = 1
 FOR q = 1 TO 2
  IF kk(q) = 1 THEN
   CIRCLE (x(q), y(q) * .73), rakete, 15
   PAINT (x(q), y(q) * .73), 15, 15
   kk(q) = 0
   l(q) = l(q) - 1
   IF l(q) = 0 THEN ende = q
  END IF
 NEXT q
 PCOPY 0, 1
 IF steril = 1 THEN
  CLS
  CIRCLE (320, 240 * .73), 13, 8
  PAINT (320, 240 * .73), 8, 8
  CIRCLE (320, 240 * .73), 8, 7
  PAINT (320, 240 * .73), 7, 7
  CIRCLE (320, 240 * .73), 3, 15
  PAINT (320, 240 * .73), 15, 15
 END IF
 ss(1) = 0: ss(2) = 0
 DO
  t$ = INKEY$
  SELECT CASE t$
  CASE CHR$(0) + "S"
   FOR s = 1 TO 10
    bb(1, 6, s) = 1
   NEXT s
  CASE CHR$(0) + "H": a(1) = a(1) + speed * n(p(1)): b(1) = b(1) + speed * m(p(1)): ss(1) = 1
  CASE CHR$(0) + "P"
   FOR s = 1 TO 10
    IF bb(1, 0, s) = 0 THEN
     bb(1, 0, s) = 1
     bb(1, 1, s) = x(1)
     bb(1, 2, s) = y(1)
     bb(1, 3, s) = a(1) / 2
     bb(1, 4, s) = b(1) / 2
     bb(1, 5, s) = aktion
     EXIT FOR
    END IF
   NEXT s
  CASE CHR$(0) + "K": p(1) = (p(1) + 1) MOD 16
  CASE CHR$(0) + "M": p(1) = (p(1) + 15) MOD 16
 
  CASE "q"
   FOR s = 1 TO 10
    bb(2, 6, s) = 1
   NEXT s
  CASE "w": a(2) = a(2) + speed * n(p(2)): b(2) = b(2) + speed * m(p(2)): ss(2) = 1
  CASE "s"
   FOR s = 1 TO 10
    IF bb(2, 0, s) = 0 THEN
     bb(2, 0, s) = 1
     bb(2, 1, s) = x(2)
     bb(2, 2, s) = y(2)
     bb(2, 3, s) = a(2) / 2
     bb(2, 4, s) = b(2) / 2
     bb(2, 5, s) = aktion
     EXIT FOR
    END IF
   NEXT s
  CASE "a": p(2) = (p(2) + 1) MOD 16
  CASE "d": p(2) = (p(2) + 15) MOD 16
  CASE " "
   CLS
   CIRCLE (320, 240 * .73), 13, 8
   PAINT (320, 240 * .73), 8, 8
   CIRCLE (320, 240 * .73), 8, 7
   PAINT (320, 240 * .73), 7, 7
   CIRCLE (320, 240 * .73), 3, 15
   PAINT (320, 240 * .73), 15, 15
  CASE CHR$(27): END
  CASE ELSE
  END SELECT
 LOOP UNTIL t$ = ""
 IF ende <> 0 THEN EXIT DO
LOOP
LOCATE 12, 28
PRINT "Spieler"; ende; "hat verloren!"
LOCATE 14, 20
PRINT "Spieler"; (ende - 2) * -1 + 1; "hat mit"; l((ende - 2) * -1 + 1); "Leben gewonnen!"
PCOPY 0, 1






'  LINE (x(q) + n(p(q)), (y(q) + m(p(q))) * .73)-(x(q) + n((p(q) + 6) MOD 16), (y(q) + n((p(q) + 6) MOD 16)) * .73), q + 8
'  LINE (x(q) + n(p(q)), (y(q) + m(p(q))) * .73)-(x(q) + n((p(q) + 10) MOD 16), (y(q) + n((p(q) + 10) MOD 16)) * .73), q + 8
'  LINE (x(q) + n((p(q) + 6) MOD 16), (y(q) + n((p(q) + 6) MOD 16)) * .73)-(x(q) + n((p(q) + 10) MOD 16), (y(q) + n((p(q) + 10) MOD 16)) * .73), q + 8

'  LINE (x(q) + n(p(q)), y(q) * .73 + m(p(q)))-(x(q) + n((p(q) + 6) MOD 16), y(q) * .73 + n((p(q) + 6) MOD 16)), q + 8
'  LINE (x(q) + n(p(q)), y(q) * .73 + m(p(q)))-(x(q) + n((p(q) + 10) MOD 16), y(q) * .73 + n((p(q) + 10) MOD 16)), q + 8
'  LINE (x(q) + n((p(q) + 6) MOD 16), y(q) * .73 + n((p(q) + 6) MOD 16))-(x(q) + n((p(q) + 10) MOD 16), y(q) * .73 + n((p(q) + 10) MOD 16)), q + 8
'  'PAINT (x(q) + .5 * n(p(q)), y(q) * .73 + .5 * m(p(q))), q + 8, q + 8

