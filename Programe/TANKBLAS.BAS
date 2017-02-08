RANDOMIZE TIMER
DIM h(101, 101) AS INTEGER
'h-h”he des gel„ndes
DIM sx(15) AS INTEGER, sy(15) AS INTEGER, sz(15) AS INTEGER, se(15) AS INTEGER, sp(15) AS INTEGER, sn(15) AS STRING
'sx,sy,sz-position
'se-energie  sp-aktionspunkte  sn-name
SCREEN 12

q = 8: d = 4
GOSUB eingabe
GOSUB plasma
GOSUB posis
alive = anz
DO
 FOR spi = 1 TO anz
  IF se(spi) > 0 THEN
   GOSUB mal
   GOSUB wahl
   'fluganimation
   'erde senken
   'fallen lassen und energie abziehen
   DO: LOOP WHILE INKEY$ = ""
  END IF
 NEXT spi
alive = alive - anz      '''''''
LOOP UNTIL alive < 2

END

eingabe:
PRINT "ÜßßßÜ ÛßßßÜ    ßßÛßß  ÜßÜ  Û   Û Û  Üß ÛßßßÜ Û      ÜßÜ  ÜßßßÜ ßßÛßß Ûßßßß ÛßßßÜ"
PRINT "  ÜÜß Û   Û ÜÜÜÜ Û   ÛÜÜÜÛ ÛßÜ Û ÛÜß   ÛÜÜÜß Û     ÛÜÜÜÛ ßÜÜÜ    Û   ÛÜÜÜ  ÛÜÜÜß"
PRINT "Ü   Û Û   Û      Û   Û   Û Û  ßÛ Û ßÜ  Û   Û Û     Û   Û Ü   Û   Û   Û     Û ßÜ "
PRINT " ßßß  ßßßß       ß   ß   ß ß   ß ß   ß ßßßß  ßßßßß ß   ß  ßßß    ß   ßßßßß ß   ß"
LOCATE 5, 1: INPUT "Wieviele Spieler"; anz
IF anz < 2 OR anz > 15 THEN anz = 15
FOR x = 1 TO anz
 COLOR x
 LOCATE 5, 1: PRINT SPACE$(80)
 LOCATE 5, 1: PRINT "Spieler"; x; "Name eingeben:";
 INPUT sn(x)
NEXT x
RETURN

plasma:
SCREEN 13
IF q = 0 THEN q = 8     'gel„nde feinheit
IF d = 0 THEN d = 4     'h”hendividend
FOR x = 0 TO 101 STEP q
 FOR y = 0 TO 101 STEP q
  LINE (x, y)-STEP(q, q), INT(RND * 256), BF
 NEXT y
NEXT x
DO
q = q / 2
FOR x = 0 TO 101 STEP q
 FOR y = 0 TO 101 STEP q
  c = INT((POINT(x, y) + POINT(x + q, y) + POINT(x, y + q) + POINT(x + q, y + q)) / 4)
  IF x + q > 101 THEN c = POINT(0, y)
  IF y + q > 101 THEN c = POINT(x, 0)
  LINE (x, y)-STEP(q, q), c, BF
 NEXT y
NEXT x
LOOP UNTIL q < 2
FOR x = 0 TO 101
 FOR y = 0 TO 101
  h(x, y) = INT(POINT(x, y) / d)
 NEXT y
NEXT x
q = 0
SCREEN 12
RETURN

posis:
FOR z = 1 TO anz
falschepos:
 sx(z) = INT(RND * 100 + 1)
 sy(z) = INT(RND * 100 + 1)
 sz(z) = h(sx(z), sy(z))
 se(z) = 100
 sp(z) = 100
 FOR t = 1 TO z - 1
  IF sx(t) = sx(z) AND sy(t) = sy(z) THEN GOTO falschepos
 NEXT t
NEXT z
RETURN

mal:
CLS
LINE (0, 0)-(301, 300), 8, B
LINE (439, 0)-(639, 200), 8, B
FOR x = 1 TO 100
 FOR y = 1 TO 100
  PSET (x * 2 + y, 300 - y - h(x, y)), 8          'isometrisch
  PSET (438 + x * 2, y * 2 - 1), 8
 NEXT y
 PSET (x * 2 + 438, 340 - h(x, sy(spi)) / 2), 8
 PSET (x * 2 + 438, 470 - h(sx(spi), x) / 2), 8
NEXT x
'schnitte
PSET (sx(spi) * 2 + 438, 340 - h(sx(spi), sy(spi)) / 2), spi
LINE (sx(spi) * 2 + 438, 340 - sz(spi) / 2)-STEP(0, 2), spi
PSET (sy(spi) * 2 + 438, 470 - h(sx(spi), sy(spi)) / 2), spi
LINE (sy(spi) * 2 + 438, 470 - sz(spi) / 2)-STEP(0, 2), spi
'spieler
FOR z = 1 TO 15
 IF se(z) > 0 THEN
  PSET (sx(z) * 2 + sy(z), 300 - sy(z) - h(sx(z), sy(z))), z
  LINE (sx(z) * 2 + sy(z), 300 - sy(z) - sz(z))-STEP(0, 2), z
  LINE (439 + sx(z) * 2, 200 - sy(z) * 2)-STEP(2, 2), z, BF
 END IF
NEXT z
RETURN

wahl:
DO
 t$ = INKEY$
 SELECT CASE t$
 CASE CHR$(0) + "H":
 CASE CHR$(0) + "P":
 CASE CHR$(0) + "K":
 CASE CHR$(0) + "M":

 END SELECT
LOOP UNTIL t$ = CHR$(27)
RETURN

