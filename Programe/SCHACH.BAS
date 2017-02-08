DIM i(8, 8) AS STRING * 1
DIM bild(600)
SCREEN 7
p$ = "TSLDKLSTBBBBBBBB                                bbbbbbbbtsldklstW"
GOSUB vor
GOSUB auf
GOSUB mal
GOSUB moegl


DO: LOOP WHILE INKEY$ = ""
END



vor:
SCREEN 7, , 1, 0
monster$ = "€ÖÿÿÖ€€ÎûûÊ€€üÿÊŒ€‡þÿÿþ‡ŽÐÿÿÐŽŒÌÿÿÌŒ"
LINE (0, 0)-(50, 10), 15, BF
FOR x = 1 TO 36
 mons = ASC(MID$(monster$, x, 1))
 FOR y = 1 TO 7
  PSET (x - 1, y), (mons MOD 2) * 15
  PSET (x + 35, y), 15 - (mons MOD 2) * 15
  mons = INT(mons / 2)
 NEXT y
NEXT x
LINE (36, 8)-(90, 8), 0
FOR x = 0 TO 11
 GET (x * 6, 1)-STEP(5, 7), bild(x * 50)
NEXT x
SCREEN 7, , 0, 0
CLS
FOR x = 0 TO 11
 PUT (x * 10, 1), bild(x * 50)
NEXT x
'STOP

RETURN

auf:
FOR y = 1 TO 8
 FOR x = 1 TO 8
  i(x, y) = MID$(p$, y * 8 + x - 8, 1)
 NEXT x
NEXT y
RETURN

mal:
FOR y = 1 TO 8
 FOR x = 1 TO 8
  col = ((x + y) MOD 2) * 15
  LINE (x * 10, 90 - y * 10)-STEP(10, 10), col, BF
  SELECT CASE i(x, y)
  CASE "B": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(0), PSET
  CASE "L": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(50), PSET
  CASE "S": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(100), PSET
  CASE "T": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(150), PSET
  CASE "D": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(200), PSET
  CASE "K": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(250), PSET
  CASE "b": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(300), PSET
  CASE "l": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(350), PSET
  CASE "s": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(400), PSET
  CASE "t": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(450), PSET
  CASE "d": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(500), PSET
  CASE "k": LINE (x * 10 + 1, 92 - y * 10)-STEP(7, 7), 0, B: PUT (x * 10 + 2, 92 - y * 10), bild(550), PSET
  END SELECT
 NEXT x
NEXT y
LINE (9, 9)-(90, 90), 15, B
LINE (7, 7)-(92, 92), 15, B
RETURN

moegl:
'gibt es nur je 1 k”nig?
kw = 0: ks = 0
FOR y = 1 TO 8
 FOR x = 1 TO 8
  IF i(x, y) = "K" THEN kw = kw + 1
  IF i(x, y) = "k" THEN ks = ks + 1
 NEXT x
NEXT y
IF kw = 1 AND ks = 1 THEN geht = 1 ELSE STOP

'ist K im schach?
FOR y = 1 TO 8
 FOR x = 1 TO 8
  IF i(x, y) = "K" THEN xx = x: yy = y
 NEXT x
NEXT y
schach = 0
IF yy < 8 THEN
 IF i(xx + 1, yy + 1) = "b" OR i(xx - 1, yy + 1) = "b" THEN schach = 1
END IF
IF schach <> 0 THEN STOP
'.
'.
'.

'ist k im schach?
FOR y = 1 TO 8
 FOR x = 1 TO 8
  IF i(x, y) = "k" THEN xx = x: yy = y
 NEXT x
NEXT y
schach = 0
IF yy > 1 THEN
 IF i(xx + 1, yy - 1) = "B" OR i(xx - 1, yy - 1) = "B" THEN schach = 1
END IF
IF schach <> 0 THEN STOP
'.
'.
'.


RETURN

