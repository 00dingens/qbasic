
'Snake fÅr bis zu 8 Spieler!
'von Rafael Friesen
'Anleitung am Ende 

SCREEN 12
WIDTH 80, 60
start:
CLEAR
DO
 CLS
 LOCATE 10, 18
 PRINT "Snake fÅr bis zu 8 Spieler von Rafael Friesen"
 LOCATE 24, 27
 INPUT "Wieviele Mitspieler (1-8)"; an
 an = INT(an)
LOOP UNTIL an <= 8 AND an >= 1
speed = 500000   ' Wartezeit zwischen den Bildern 0-?
DIM x(8), y(8), a(8), b(8), r(8)
CLS
LINE (1, 1)-(638, 478), 2, B
x(1) = 310: y(1) = 220: a(1) = 0: b(1) = -1: r(1) = 1
x(2) = 330: y(2) = 260: a(2) = 0: b(2) = 1: r(2) = 2
x(3) = 300: y(3) = 250: a(3) = -1: b(3) = 0: r(3) = 3
x(4) = 340: y(4) = 230: a(4) = 1: b(4) = 0: r(4) = 4
x(5) = 330: y(5) = 220: a(5) = 0: b(5) = -1: r(5) = 1
x(6) = 310: y(6) = 260: a(6) = 0: b(6) = 1: r(6) = 2
x(7) = 300: y(7) = 230: a(7) = -1: b(7) = 0: r(7) = 3
x(8) = 340: y(8) = 250: a(8) = 1: b(8) = 0: r(8) = 4
DO
 t$ = UCASE$(INKEY$)
 SELECT CASE t$
   'Spieler 1
  CASE CHR$(0) + "H": IF r(1) <> 2 THEN a(1) = 0: b(1) = -1: r(1) = 1
  CASE CHR$(0) + "P": IF r(1) <> 1 THEN a(1) = 0: b(1) = 1: r(1) = 2
  CASE CHR$(0) + "K": IF r(1) <> 4 THEN a(1) = -1: b(1) = 0: r(1) = 3
  CASE CHR$(0) + "M": IF r(1) <> 3 THEN a(1) = 1: b(1) = 0: r(1) = 4
   'Spieler 2
  CASE "W": IF r(2) <> 2 THEN a(2) = 0: b(2) = -1: r(2) = 1
  CASE "S": IF r(2) <> 1 THEN a(2) = 0: b(2) = 1: r(2) = 2
  CASE "A": IF r(2) <> 4 THEN a(2) = -1: b(2) = 0: r(2) = 3
  CASE "D": IF r(2) <> 3 THEN a(2) = 1: b(2) = 0: r(2) = 4
   'Spieler 3
  CASE "5": IF r(3) <> 2 THEN a(3) = 0: b(3) = -1: r(3) = 1
  CASE "2": IF r(3) <> 1 THEN a(3) = 0: b(3) = 1: r(3) = 2
  CASE "1": IF r(3) <> 4 THEN a(3) = -1: b(3) = 0: r(3) = 3
  CASE "3": IF r(3) <> 3 THEN a(3) = 1: b(3) = 0: r(3) = 4
   'Spieler 4
  CASE "Å": IF r(4) <> 2 THEN a(4) = 0: b(4) = -1: r(4) = 1
  CASE "Ñ": IF r(4) <> 1 THEN a(4) = 0: b(4) = 1: r(4) = 2
  CASE "î": IF r(4) <> 4 THEN a(4) = -1: b(4) = 0: r(4) = 3
  CASE "#": IF r(4) <> 3 THEN a(4) = 1: b(4) = 0: r(4) = 4
   'Spieler 5
  CASE "J": IF r(5) <> 2 THEN a(5) = 0: b(5) = -1: r(5) = 1
  CASE "M": IF r(5) <> 1 THEN a(5) = 0: b(5) = 1: r(5) = 2
  CASE "N": IF r(5) <> 4 THEN a(5) = -1: b(5) = 0: r(5) = 3
  CASE ",": IF r(5) <> 3 THEN a(5) = 1: b(5) = 0: r(5) = 4
   'Spieler 6
  CASE "4": IF r(6) <> 2 THEN a(6) = 0: b(6) = -1: r(6) = 1
  CASE "R": IF r(6) <> 1 THEN a(6) = 0: b(6) = 1: r(6) = 2
  CASE "E": IF r(6) <> 4 THEN a(6) = -1: b(6) = 0: r(6) = 3
  CASE "T": IF r(6) <> 3 THEN a(6) = 1: b(6) = 0: r(6) = 4
   'Spieler 7
  CASE "8": IF r(7) <> 2 THEN a(7) = 0: b(7) = -1: r(7) = 1
  CASE "I": IF r(7) <> 1 THEN a(7) = 0: b(7) = 1: r(7) = 2
  CASE "U": IF r(7) <> 4 THEN a(7) = -1: b(7) = 0: r(7) = 3
  CASE "O": IF r(7) <> 3 THEN a(7) = 1: b(7) = 0: r(7) = 4
   'Spieler 8
  CASE "F": IF r(8) <> 2 THEN a(8) = 0: b(8) = -1: r(8) = 1
  CASE "V": IF r(8) <> 1 THEN a(8) = 0: b(8) = 1: r(8) = 2
  CASE "C": IF r(8) <> 4 THEN a(8) = -1: b(8) = 0: r(8) = 3
  CASE "B": IF r(8) <> 3 THEN a(8) = 1: b(8) = 0: r(8) = 4
 
  CASE CHR$(0) + "I": speed = speed / 2      'PgUp
  CASE CHR$(0) + "Q": speed = speed * 2      'PgDn
  CASE CHR$(27): EXIT DO                     'Esc
  CASE ELSE
 END SELECT
 FOR z = 1 TO an
  IF x(z) <> 0 THEN
   x(z) = x(z) + a(z): y(z) = y(z) + b(z)
   IF POINT(x(z), y(z)) <> 0 THEN x(z) = 0: y(z) = 0: a(z) = 0: b(z) = 0: r(z) = 0
   PSET (x(z), y(z)), z
  END IF
 NEXT z

 FOR ss = 1 TO speed: NEXT ss
LOOP
COLOR 7: LOCATE 33, 30: INPUT "Noch eine Runde (j/n)"; nn$
IF nn$ <> "n" THEN GOTO start

'Anleitung
'ÕÕÕÕÕÕÕÕÕ

'Dieses Spiel ist frei weiterkopierbar.
'énderungen im Quellcode, die die Steuerung beeinflussen, bitte in der
'Anleitung auch Ñndern.

'Um die Anfangsgeschwindigkeit zu erhîhen, muss die Variable `speedÔ
'verkleinert werden. Um die Anfangsgeschwindigkeit zu erniedrigen, muss der
'Wert der Variablen `speedÔ erhîht werden.

'WÑhrend des Spiels wird die Geschwindigkeit mit PgUp oder Bild  erhîht,
'und mit PgDn oder Bild  vird das Spiel verlangsamt.

'Um wÑhrend des Spiels oder wenn alle tot sind, Esc drÅcken, um das Spiel zu
'beenden.

'Steuerungen fÅr die Schlangen:
'ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ

'Spieler 1 (blau)
'Spieler 1 Steuert die Schlange mit den Pfeiltasten.

'Spieler 2 (grÅn)
'           nach Oben
'               W
'nach Links   A   D   nach Rechts
'               S
'           nach Unten

'Spieler 3 (tÅrkis bzw. hellblau)
'Spieler 3 Steuert die Schlange mit den folgenden Nummern auf dem NumPad.
'           nach Oben
'               5
'nach Links   1   3   nach Rechts
'               2
'           nach Unten

'Spieler 4 (rot)
'           nach Oben
'               ö
'nach Links   ô   #   nach Rechts
'               é
'           nach Unten

'Spieler 5 (lila)
'           nach Oben
'               J
'nach Links   N   ,   nach Rechts
'               M
'           nach Unten

'Spieler 6 (braun)
'           nach Oben
'               4
'nach Links   E   T   nach Rechts
'               R
'           nach Unten

'Spieler 7 (wei·)
'           nach Oben
'               8
'nach Links   U   O   nach Rechts
'               I
'           nach Unten

'Spieler 8 (grau)
'           nach Oben
'               F
'nach Links   C   B   nach Rechts
'               V
'           nach Unten


