'Einstellungen
CLS
RANDOMIZE                       'Spielnummer abfragen
SCREEN 7, , 0, 0
x = 320: y = 200                'Gr批e des Bildes
a = 4: b = 4                    'Anzahl der Bildst…ke
xx = x / a: yy = y / b          'Bildst…kgr批e
l = 1                           'leeres Feld. 1=lo. 2=ro. 3=lu. 4=ru.

'Felder dimensionieren
DIM q(a, b, 1)                  'welches Bildst…k ist wo?
DIM w(10000)                    'Hier werden Bildst…ke gespeichert


'leeres Feld wird festgelegt
SELECT CASE l
CASE 1: nn = 0: mm = 0          'links  oben
CASE 2: nn = a - 1: mm = 0      'rechts oben
CASE 3: nn = 0: mm = b - 1      'links  unten
CASE 4: nn = a - 1: mm = b - 1  'rechts unten
CASE ELSE
END SELECT

'Bild malen
FOR z = 1 TO 300 STEP 5
 CIRCLE (x / 2, y / 2), z, INT(RND * 15)
NEXT z
LINE (-1, -1)-(x, y), 15, B
PAINT (x + 2, y + 2), 0, 15
'Raster malen (optional)
FOR n = 0 TO a - 1
 FOR m = 0 TO b - 1
  LINE (n * xx, m * yy)-STEP(xx, yy), 15, B
 NEXT m
NEXT n
'leere Ecke malen und Bildschirmspeicherseiten benutzen
LINE (nn * xx, mm * yy)-((nn + 1) * xx - 1, (mm + 1) * yy - 1), 0, BF
PCOPY 0, 1
PCOPY 1, 2

'Bildst…ke sortieren
FOR n = 0 TO a - 1
 FOR m = 0 TO b - 1
  q(n, m, 0) = n
  q(n, m, 1) = m
 NEXT m
NEXT n
'Bildst…ke Mischen
FOR z = 1 TO 10000          'Pro Durchlauf 1 Verschiebungsversuch
 e = INT(RND * 4)
 SELECT CASE e
 CASE 0
  IF mm > 0 THEN SWAP q(nn, mm, 0), q(nn, mm - 1, 0): SWAP q(nn, mm, 1), q(nn, mm - 1, 1): mm = mm - 1
 CASE 1
  IF mm < b - 1 THEN SWAP q(nn, mm, 0), q(nn, mm + 1, 0): SWAP q(nn, mm, 1), q(nn, mm + 1, 1): mm = mm + 1
 CASE 2
  IF nn > 0 THEN SWAP q(nn, mm, 0), q(nn - 1, mm, 0): SWAP q(nn, mm, 1), q(nn - 1, mm, 1): nn = nn - 1
 CASE 3
  IF nn < a - 1 THEN SWAP q(nn, mm, 0), q(nn + 1, mm, 0): SWAP q(nn, mm, 1), q(nn + 1, mm, 1): nn = nn + 1
 CASE ELSE
 END SELECT
NEXT z
DO: LOOP WHILE INKEY$ = ""

'Bild ausgeben
SCREEN 7, , 1, 0
CLS
FOR n = 0 TO a - 1
 FOR m = 0 TO b - 1
  g = q(n, m, 0): h = q(n, m, 1)
  SCREEN 7, , 2, 0
  GET (g * xx, h * yy)-((g + 1) * xx - 1, (h + 1) * yy - 1), w
  SCREEN 7, , 1, 0
  PUT (n * xx, m * yy), w
 NEXT m
NEXT n
PCOPY 1, 0

DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": e = 1
 CASE CHR$(0) + "P": e = 0
 CASE CHR$(0) + "K": e = 3
 CASE CHR$(0) + "M": e = 2
 CASE CHR$(13): e = 4: tt = 0
  FOR n = 0 TO a - 1
   FOR m = 0 TO b - 1
    IF q(n, m, 0) <> n OR q(n, m, 1) <> m THEN tt = 1
   NEXT m
  NEXT n
  IF tt = 0 THEN SCREEN 7, , 0, 0: PRINT "Fertig": EXIT DO
 CASE CHR$(27): EXIT DO
 CASE ELSE: e = 4
 END SELECT
 SELECT CASE e
 CASE 0
  IF mm > 0 THEN SWAP q(nn, mm, 0), q(nn, mm - 1, 0): SWAP q(nn, mm, 1), q(nn, mm - 1, 1): mm = mm - 1
 CASE 1
  IF mm < b - 1 THEN SWAP q(nn, mm, 0), q(nn, mm + 1, 0): SWAP q(nn, mm, 1), q(nn, mm + 1, 1): mm = mm + 1
 CASE 2
  IF nn > 0 THEN SWAP q(nn, mm, 0), q(nn - 1, mm, 0): SWAP q(nn, mm, 1), q(nn - 1, mm, 1): nn = nn - 1
 CASE 3
  IF nn < a - 1 THEN SWAP q(nn, mm, 0), q(nn + 1, mm, 0): SWAP q(nn, mm, 1), q(nn + 1, mm, 1): nn = nn + 1
 CASE ELSE
 END SELECT
 SCREEN 7, , 1, 0
 CLS
 FOR n = 0 TO a - 1
  FOR m = 0 TO b - 1
   g = q(n, m, 0): h = q(n, m, 1)
   SCREEN 7, , 2, 0
   GET (g * xx, h * yy)-((g + 1) * xx - 1, (h + 1) * yy - 1), w
   SCREEN 7, , 1, 0
   PUT (n * xx, m * yy), w
  NEXT m
 NEXT n
 PCOPY 1, 0
LOOP
DO: LOOP WHILE INKEY$ = ""
END

