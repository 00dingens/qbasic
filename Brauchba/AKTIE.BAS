SCREEN 12
CLS
PRINT "Aktien-Spiel"
PRINT
PRINT "Anleitung gibt's bei Rafael."
PRINT
DO
 INPUT "Wieviele Mitspieler (1-10)"; anz
LOOP UNTIL anz >= 1 AND anz <= 10
DIM kurs(20, 100), a(10)
DIM spi(10) AS STRING
DIM habe(10, 20)
DIM w(10), geld(10)
FOR x = 0 TO 9
 k = INT(RND * 80 + 10)
 FOR y = 0 TO 99
  kurs(x, y) = k
 NEXT y
NEXT x
FOR x = 1 TO anz
 DO
  PRINT "Spieler"; x;
  INPUT "bitte Name eingeben! (max. 20 Buchstaben)", spi(x)
 LOOP UNTIL LEN(spi(x)) < 21 AND LEN(spi(x)) > 0
 w(x) = 10
 FOR y = 0 TO 99
  kurs(10 + x, y) = w(x)
 NEXT y
 habe(x, x) = 1000
 geld(x) = 100
NEXT x

FOR x = 1 TO 100
 FOR y = 0 TO 9
  FOR z = 100 TO 1 STEP -1
   kurs(y, z) = kurs(y, z - 1)
  NEXT z
  a(y) = a(y) + INT(RND * 3 - 1) / 2
  IF a(y) < -2 THEN a(y) = -2
  IF a(y) > 2 THEN a(y) = 2
  IF RND < .1 AND kurs(y, 0) > 20 THEN a(y) = -2
  kurs(y, 0) = kurs(y, 0) + a(y) + INT(RND * 5 - 2) / 2
  IF kurs(y, 0) < 0 THEN kurs(y, 0) = 0
  IF kurs(y, 0) < 20 THEN a(y) = a(y) + .5
  IF kurs(y, 0) > 80 THEN a(y) = a(y) - .5
  IF kurs(y, 0) > 100 THEN kurs(y, 0) = 100
 NEXT y
 LOCATE 7, 1: PRINT "Kurse berechnen:"; x; "%"
NEXT x

DO
 FOR x = 1 TO anz
bild:
  CLS
  PRINT spi(x)
  LOCATE 1, 21: PRINT geld(x)
  LINE (-1, -1)-(160, 16), 7, B
  FOR y = 0 TO 99
   PSET (639 - y, 100 - kurs(10 + x, y))
  NEXT y
  LINE (540, -1)-(640, 101), 7, B
  FOR y = 0 TO 9
   LOCATE 20, y * 8 + 1
   PRINT habe(x, y + 10)
   LOCATE 28, y * 8 + 1
   PRINT " Kurs"; y
   FOR z = 0 TO 61
    FOR w = 1 TO 10
     PSET (64 * y - z + 62, 426 - w * 10), 8
    NEXT w
    PSET (64 * y - z + 62, 426 - kurs(y, z))
   NEXT z
   LINE (y * 64, 326)-STEP(63, 100), 7, B
   LINE (y * 64, 428)-STEP(63, 20), 7, B
  NEXT y
  LOCATE 3, 1
  PRINT "Aktionen:"
  PRINT "1 Kaufen"
  PRINT "2 Verkaufen"
  PRINT "3 Kurs ansehen"
  PRINT "4 Fertig"
  DO: t$ = INKEY$: LOOP WHILE t$ = ""
  FOR l = 3 TO 8: LOCATE l, 1: PRINT SPACE$(60): NEXT l
  SELECT CASE t$
  CASE "1":
   LOCATE 3, 1: INPUT "Welche Aktie kaufen?"; kur
   IF kur > 9 THEN GOTO bild
   PRINT "Du kannst hîchstens"; INT(geld(x) / kurs(kur, 0)); "Aktien kaufen."
   INPUT "Wieviele willst du kaufen"; han
   IF han > INT(geld(x) / kurs(kur, 0)) THEN GOTO bild
   habe(x, kur) = habe(x, kur) + han
   geld(x) = geld(x) - han * kurs(kur, 0)
   GOTO bild
  CASE "2":
   LOCATE 3, 1: INPUT "Welche Aktie verkaufen?"; kur
   IF kur > 9 THEN GOTO bild
   PRINT "Du kannst hîchstens"; habe(x, kur); "Aktien verkaufen."
   INPUT "Wieviele willst du verkaufen"; han
   IF han > habe(x, kur) THEN GOTO bild
   habe(x, kur) = habe(x, kur) - han
   geld(x) = geld(x) + han * kurs(kur, 0)
   GOTO bild
  CASE "3":
   LOCATE 3, 1: INPUT "Welchen Kurs ansehen"; kur
   IF kur > 9 THEN kur = 9
   CLS
   PRINT "Kurs"; kur, "Aktuell:"; kurs(kur, 0), "Taste drÅcken!"
   FOR y = 99 TO 0 STEP -1
    FOR w = 1 TO 100
     IF w MOD 10 = 0 THEN LINE (517 - 4 * y, 430 - w * 4)-STEP(3, 0), 8
     IF w MOD 10 = 5 THEN LINE (517 - 4 * y, 430 - w * 4)-STEP(1, 0), 8
     PSET (517 - 4 * y, 430 - w * 4), 8
    NEXT w
    PSET (517 - 4 * y, 430 - kurs(kur, y) - kurs(kur, y + 1) * 3)
    PSET (518 - 4 * y, 430 - kurs(kur, y) * 2 - kurs(kur, y + 1) * 2)
    PSET (519 - 4 * y, 430 - kurs(kur, y) * 3 - kurs(kur, y + 1) * 1)
    PSET (520 - 4 * y, 430 - kurs(kur, y) * 4)
   NEXT y
   LINE (120, 29)-(521, 431), 7, B
   DO: LOOP WHILE INKEY$ = ""
   GOTO bild
  CASE "4": GOTO fertig
  END SELECT
  GOTO bild
fertig:
  'kurse verÑndern
  FOR y = 0 TO 9
   'werte verschieben
   FOR z = 100 TO 1 STEP -1
    kurs(y, z) = kurs(y, z - 1)
   NEXT z
   a(y) = a(y) + INT(RND * 3 - 1) / 2
   IF a(y) < -2 THEN a(y) = -2
   IF a(y) > 2 THEN a(y) = 2
  IF RND < .1 AND kurs(y, 0) > 20 THEN a(y) = -2
   kurs(y, 0) = kurs(y, 0) + a(y) + INT(RND * 5 - 2) / 2
   IF kurs(y, 0) < 0 THEN kurs(y, 0) = 0
   IF kurs(y, 0) < 20 THEN a(y) = a(y) + .5
   IF kurs(y, 0) > 80 THEN a(y) = a(y) - .5
   IF kurs(y, 0) > 100 THEN kurs(y, 0) = 100
  NEXT y

  'spielerwerte verÑndern
  FOR y = 1 TO anz
   w(y) = w(y)
  NEXT y
 NEXT x

 runden = runden + 1
 CLS
 PRINT runden; "Runden sind gepielt worden. Weiter (j/n)?"
 DO: t$ = INKEY$: LOOP UNTIL t$ = "n" OR t$ = "j"
LOOP UNTIL t$ = "n"

