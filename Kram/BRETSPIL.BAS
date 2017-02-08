RANDOMIZE TIMER
SCREEN 7
DIM f(10, 10)
INPUT "Schwierigkeit"; s
px = 5: py = 5
k = 0

GOSUB mal
GOSUB drei
GOSUB mal
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H"
  IF py > 1 THEN
   IF k = 1 THEN
    IF f(px, py - 1) = 0 THEN
     SWAP f(px, py), f(px, py - 1)
     py = py - 1
     GOSUB mal
    END IF
   ELSE
    py = py - 1
   END IF
  END IF
 CASE CHR$(0) + "P"
  IF py < 9 THEN
   IF k = 1 THEN
    IF f(px, py + 1) = 0 THEN
     SWAP f(px, py), f(px, py + 1)
     py = py + 1
     GOSUB mal
    END IF
   ELSE
    py = py + 1
   END IF
  END IF
 CASE CHR$(0) + "K"
  IF px > 1 THEN
   IF k = 1 THEN
    IF f(px - 1, py) = 0 THEN
     SWAP f(px, py), f(px - 1, py)
     px = px - 1
     GOSUB mal
    END IF
   ELSE
    px = px - 1
   END IF
  END IF
 CASE CHR$(0) + "M"
  IF px < 9 THEN
   IF k = 1 THEN
    IF f(px + 1, py) = 0 THEN
     SWAP f(px, py), f(px + 1, py)
     px = px + 1
     GOSUB mal
    END IF
   ELSE
    px = px + 1
   END IF
  END IF
 CASE CHR$(13): IF k = 0 THEN GOSUB auf ELSE GOSUB ab
 CASE CHR$(27): ende = 1
 END SELECT
 GOSUB mal
LOOP UNTIL ende = 1
END

drei:
t = TIMER: DO: LOOP UNTIL t + .2 < TIMER
FOR z = 1 TO 3
nochmal:
 DO
  x = INT(RND * 9 + 1)
  y = INT(RND * 9 + 1)
  cc = cc + 1
 LOOP UNTIL f(x, y) = 0 OR cc = 1000
 IF cc = 1000 THEN
  geht = 0
  FOR x = 1 TO 9: FOR y = 1 TO 9: IF f(x, y) = 0 THEN geht = 1
  NEXT y: NEXT x: IF geht = 1 THEN GOTO nochmal ELSE END
 END IF

 f(x, y) = INT(RND * s + 1)
 FOR g = 1 TO 8
  CIRCLE (x * 20 + 110, y * 20), g, f(x, y), , , 1
 NEXT g
 xx = x: yy = y
 GOSUB test
 t = TIMER: DO: LOOP UNTIL t + .2 < TIMER
NEXT z
RETURN

mal:
LOCATE 15, 1: PRINT punkte
FOR x = 1 TO 9
 FOR y = 1 TO 9
  LINE (x * 20 + 100, y * 20 - 10)-STEP(20, 20), 7, B
  LINE (x * 20 + 101, y * 20 - 9)-STEP(18, 18), 0, BF
  CIRCLE (x * 20 + 110, y * 20), 8, f(x, y), , , 1
  PAINT (x * 20 + 110, y * 20), f(x, y), f(x, y)
  IF px = x AND py = y THEN LINE (px * 20 + 101, py * 20 - 9)-STEP(18, 18), 15, B
 NEXT y
NEXT x
RETURN

auf:
IF f(px, py) <> 0 THEN k = 1
RETURN

ab:
 k = 0

 xx = px: yy = py
 GOSUB test

 GOSUB mal
 IF f(px, py) <> 0 THEN GOSUB drei
RETURN

test:


 n1 = 0: DO: n1 = n1 + 1: LOOP UNTIL f(xx + n1, yy) <> f(xx, yy): n1 = n1 - 1
 n2 = 0: DO: n2 = n2 + 1: LOOP UNTIL f(xx - n2, yy) <> f(xx, yy): n2 = n2 - 1
 n3 = 0: DO: n3 = n3 + 1: LOOP UNTIL f(xx + n3, yy + n3) <> f(xx, yy): n3 = n3 - 1
 n4 = 0: DO: n4 = n4 + 1: LOOP UNTIL f(xx - n4, yy - n4) <> f(xx, yy): n4 = n4 - 1
 n5 = 0: DO: n5 = n5 + 1: LOOP UNTIL f(xx + n5, yy - n5) <> f(xx, yy): n5 = n5 - 1
 n6 = 0: DO: n6 = n6 + 1: LOOP UNTIL f(xx - n6, yy + n6) <> f(xx, yy): n6 = n6 - 1
 n7 = 0: DO: n7 = n7 + 1: LOOP UNTIL f(xx, yy + n7) <> f(xx, yy): n7 = n7 - 1
 n8 = 0: DO: n8 = n8 + 1: LOOP UNTIL f(xx, yy - n8) <> f(xx, yy): n8 = n8 - 1

 IF n1 + n2 > 3 THEN FOR q = 0 TO n1: f(xx + q, yy) = 0: NEXT q: FOR q = 0 TO n2: f(xx - q, yy) = 0: NEXT q: punkte = punkte + n1 + n2 + 1
 IF n3 + n4 > 3 THEN FOR q = 0 TO n3: f(xx + q, yy + q) = 0: NEXT q: FOR q = 0 TO n4: f(xx - q, yy - q) = 0: NEXT q: punkte = punkte + n3 + n4 + 1
 IF n5 + n6 > 3 THEN FOR q = 0 TO n5: f(xx + q, yy - q) = 0: NEXT q: FOR q = 0 TO n6: f(xx - q, yy + q) = 0: NEXT q: punkte = punkte + n5 + n6 + 1
 IF n7 + n8 > 3 THEN FOR q = 0 TO n7: f(xx, yy + q) = 0: NEXT q: FOR q = 0 TO n8: f(xx, yy - q) = 0: NEXT q: punkte = punkte + n7 + n8 + 1
RETURN

