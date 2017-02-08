
'Spielereien.
'Jeweils das Hochkomma hinter EINEM Gosub entfernen, dann laufenlassen

SCREEN 13
RANDOMIZE TIMER
'GOSUB text
'GOSUB radar
'GOSUB diagramm
'GOSUB diagr
'GOSUB zeichen
'GOSUB kreis
'GOSUB fernsehn
'GOSUB lampen
GOSUB cursor
'GOSUB runde
'GOSUB welle
'GOSUB anschalten
'GOSUB erscheinen
'GOSUB lampe
END


text:
t$ = "   Achtung! Alle Flieger Åber dem Kampfgebiet!  P.S. Qwix mir was!   Achtung! Alle"
DO
FOR x = 1 TO LEN(t$) - 16
 LOCATE 12, 14: PRINT MID$(t$, x, 12)
 FOR z = 1 TO 300: NEXT z
 IF INKEY$ <> "" THEN EXIT DO
NEXT x
LOOP
END

radar:
LINE (11, 11)-(49, 49), 2, B
LINE (109, 9)-(151, 51), 2, B
eck = 500: rad = 20: win = 2 * 3.141593 / eck
DIM x(eck), y(eck)
FOR i = 0 TO eck - 1
 x(i) = rad * COS(i * win)
 y(i) = rad * SIN(i * win)
NEXT i
DO
FOR i = 0 TO eck - 1
 LINE (30, 30)-STEP(x(i), y(i)), 10
 LINE (30, 30)-STEP(x(i), y(i)), 0
 LINE (130, 30)-STEP(x(i), y(i)), 10
 LINE (130, 30)-STEP(x(i), y(i)), 0
NEXT i
LOOP WHILE INKEY$ = ""
END

diagramm:
DIM a(10000)
x = 100
DO
 x = x + RND * 2 - 1
 PSET (130, x - 1), 0
 PSET (130, x), 2
 PSET (130, x + 1), 0
 GET (130, 50)-(190, 150), a
 PUT (131, 50), a, PSET
LOOP WHILE INKEY$ = ""
END

diagr:
DIM aa(10000)
x = 100
DO
 LINE (130, 80)-(130, 120), 8
 FOR i = 1 TO 10
  x = x + RND * 2 - 1
  FOR y = 1 TO 50 STEP 10
   PSET (130, y + 79), 8
  NEXT y
  PSET (130, x), 10
  GET (130, 50)-(190, 150), aa
  PUT (131, 50), aa, PSET
  LINE (130, 80)-(130, 120), 0
 NEXT i
LOOP WHILE INKEY$ = ""
END

zeichen:
DO
FOR y = 0 TO 3
 FOR x = 0 TO 3
  COLOR INT(RND * 16)
  LOCATE 12 + x, 18 + y: PRINT CHR$(INT(RND * 220) + 36)
 NEXT x
NEXT y
LOOP WHILE INKEY$ = ""
END

kreis:
DO
 FOR f = 1 TO 16
  CIRCLE (160, 100), f, 15 + f
  CIRCLE (160, 100), f - 1, 0
  SOUND f * 10 + 1000, .2
 NEXT f
 FOR f = 16 TO 1 STEP -1
  CIRCLE (160, 100), f, 15 + f
  CIRCLE (160, 100), f + 1, 0
  SOUND f * 10 + 1000, .2
 NEXT f
LOOP WHILE INKEY$ = ""
END

fernsehn:
LINE (145, 90)-(180, 110), 15, BF
PSET (145, 90), 0
PSET (145, 110), 0
PSET (180, 90), 0
PSET (180, 110), 0
DO
FOR x = 1 TO 15
 PAINT (160, 100), x, 0
NEXT x
LOOP WHILE INKEY$ = ""
END

lampen:
CIRCLE (140, 100), 19
CIRCLE (180, 100), 19
CIRCLE (160, 85), 5
CIRCLE (160, 115), 5
DO
IF RND > .2 THEN
PAINT (140, 100), 0, 15
PAINT (180, 100), 4, 15
PAINT (160, 85), 12, 15
PAINT (160, 115), 12, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 4, 15
PAINT (180, 100), 0, 15
PAINT (160, 85), 4, 15
PAINT (160, 115), 4, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 12, 15
PAINT (180, 100), 4, 15
PAINT (160, 85), 0, 15
PAINT (160, 115), 0, 15
FOR x = 1 TO 300: NEXT x
PAINT (140, 100), 4, 15
PAINT (180, 100), 12, 15
PAINT (160, 85), 4, 15
PAINT (160, 115), 4, 15
ELSE FOR x = 1 TO 1000: NEXT x
END IF
FOR x = 1 TO 300: NEXT x
LOOP WHILE INKEY$ = ""
END

cursor:
DO
FOR x = 0 TO 10
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), , BF
 FOR y = 1 TO 200: NEXT y
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), 0, BF
NEXT x
FOR x = 10 TO 0 STEP -1
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), , BF
 FOR y = 1 TO 200: NEXT y
 LINE (150 + x, 100 - x)-(170 - x, 100 + x), 0, BF
NEXT x
LOOP WHILE INKEY$ = ""
END

runde:
a = 1: B = 1: x = 160: y = 100
LINE (148, 89)-(171, 111), , B
DO
PSET (x, y), 0
x = x + a: y = y + B
PSET (x, y)
IF x + a < 149 THEN a = 1
IF x + a > 170 THEN a = -1
IF y + B < 90 THEN B = 1
IF y + B > 110 THEN B = -1
FOR z = 1 TO 100: NEXT z
LOOP WHILE INKEY$ = ""
END

welle:
eck = 500: rad = 20: win = 2 * 3.141593 / eck
DIM y(eck * 2), aaa(9000)
FOR i = 0 TO eck - 1
 y(i) = rad * SIN(i * win)
NEXT i
DO
 FOR i = 0 TO eck - 1
  LINE (150, 80)-(150, 120), 0
  FOR k = 1 TO 10
   PSET (150, y(i * k MOD eck) + 100), k
  NEXT k
  GET (150, 80)-(210, 120), aaa
  PUT (151, 80), aaa, PSET
 NEXT i
LOOP WHILE INKEY$ = ""
END

anschalten:
LINE (10, 10)-(50, 50), 1, BF
FOR x = 1 TO 10
OUT &H3C8, 1
OUT &H3C9, 0
OUT &H3C9, 0
OUT &H3C9, 0
FOR t = 1 TO (12 - x) * 20: NEXT t
OUT &H3C8, 1
OUT &H3C9, 63
OUT &H3C9, 63
OUT &H3C9, 63
FOR t = 1 TO (12 - x) * 10: NEXT t
NEXT x
END

erscheinen:
DIM q(1024), w(1024)
FOR y = 0 TO 3
 FOR x = 0 TO 3
  COLOR INT(RND * 16)
  LOCATE 12 + x, 18 + y: PRINT CHR$(INT(RND * 220) + 36)
 NEXT x
NEXT y
FOR x = 0 TO 31
 FOR y = 0 TO 31
  q(y * 32 + x) = POINT(x + 136, y + 88)
 NEXT y
NEXT x
CLS
FOR y = 0 TO 1023
 w(y) = y
NEXT y
FOR y = 0 TO 1023
 SWAP w(y), w(INT(RND * 1024))
NEXT y
FOR y = 0 TO 1023
 PSET (w(y) MOD 32 + 136, INT(w(y) / 32) + 88), q(w(y))
NEXT y
DO: LOOP WHILE INKEY$ = ""
END

lampe:
CIRCLE (160, 100), 20, 2
PAINT (160, 100), 2, 2
CIRCLE (160, 100), 18, 1
PAINT (160, 100), 1, 1
DO
 FOR a = 1 TO 20
  FOR x = 0 TO 63 STEP a
   PALETTE 1, x
   PALETTE 2, 63 - x
   IF INKEY$ <> "" THEN END
  NEXT x
  FOR x = 63 TO 0 STEP -a
   PALETTE 1, x
   PALETTE 2, 63 - x
   IF INKEY$ <> "" THEN END
  NEXT x
 NEXT a
LOOP
END

