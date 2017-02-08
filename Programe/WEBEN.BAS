SCREEN 12
GOSUB bild
GOSUB maln

END

bild:
'das bild geht von (0,0) bis (60,50)

'3 kreuze
'CIRCLE (30, 50), 15, 15, , , 1
'PAINT (30, 50), 15, 15
'LINE (0, 44)-(60, 70), 0, BF
'LINE (0, 35)-(60, 35), 0
'LINE (29, 19)-(31, 40), 15, BF
'LINE (25, 21)-(35, 23), 15, BF
'LINE (22, 29)-(23, 40), 15, BF
'LINE (20, 30)-(25, 31), 15, BF
'LINE (37, 29)-(38, 40), 15, BF
'LINE (40, 30)-(35, 31), 15, BF

'fisch
LINE (10, 10)-STEP(4, 4), 15, BF
LINE (11, 11)-STEP(4, 4), 15, BF
LINE (12, 12)-STEP(4, 4), 15, BF
LINE (15, 15)-STEP(3, 3), 15, BF
LINE (18, 16)-(16, 18), 0
PAINT (18, 18), 0, 0
PSET (12, 11), 0
LINE (10, 13)-(11, 13), 0
LINE (16, 11)-(17, 12), 15

'PRINT "RAFAEL"
'FOR x = 0 TO 60: FOR y = 0 TO 50: PSET (x, y), ((x + y) MOD 2) * 15: NEXT y: NEXT x
RETURN


maln:
LINE (150, 0)-(640, 480), 0, BF
FOR x = 0 TO 60
 FOR y = 0 TO 50
  IF POINT(x, y) = 15 THEN LINE (x * 8 + 140, y * 8 + 10)-STEP(8, 8), 15, BF
 NEXT y
NEXT x

'linien
FOR x = 0 TO 60
 FOR y = 0 TO 50
  IF POINT(x * 8 + 142, y * 8 + 12) = 15 THEN
   DO: PSET (x * 8 + 142, y * 8 + 12), 4: PSET (x * 8 + 142, y * 8 + 12), 15: LOOP WHILE INKEY$ = ""
   xx = x * 8 + 142: yy = y * 8 + 12: a = -1: b = 1: c = (c MOD 7) + 1
   DO
    xx = xx + a
    yy = yy + b
    IF POINT(xx + a, yy + b) = 0 THEN
     IF POINT(xx + a + a, yy) = 0 THEN a = -a ELSE b = -b
    END IF
    PSET (xx, yy), c
   LOOP UNTIL xx = x * 8 + 142 AND yy = y * 8 + 12
  END IF
 NEXT y
NEXT x


RETURN

