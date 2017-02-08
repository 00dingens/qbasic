start:
CLEAR
SCREEN 12
CLS
WIDTH 80, 60
LINE (1, 1)-(638, 478), 2, B
x1 = 320: y1 = 240: a1 = 1: b1 = 0: r1 = 4
x2 = 319: y2 = 240: a2 = -1: b2 = 0: r2 = 3
speed = 100
DO
 t$ = UCASE$(INKEY$)
 SELECT CASE t$
  CASE CHR$(0) + "H": IF r1 <> 2 THEN a1 = 0: b1 = -1: r1 = 1
  CASE CHR$(0) + "P": IF r1 <> 1 THEN a1 = 0: b1 = 1: r1 = 2
  CASE CHR$(0) + "K": IF r1 <> 4 THEN a1 = -1: b1 = 0: r1 = 3
  CASE CHR$(0) + "M": IF r1 <> 3 THEN a1 = 1: b1 = 0: r1 = 4
  CASE "W": IF r2 <> 2 THEN a2 = 0: b2 = -1: r2 = 1
  CASE "S": IF r2 <> 1 THEN a2 = 0: b2 = 1: r2 = 2
  CASE "A": IF r2 <> 4 THEN a2 = -1: b2 = 0: r2 = 3
  CASE "D": IF r2 <> 3 THEN a2 = 1: b2 = 0: r2 = 4
  CASE ELSE
 END SELECT
 x1 = x1 + a1: y1 = y1 + b1
 x2 = x2 + a2: y2 = y2 + b2
 IF POINT(x1, y1) <> 0 THEN kaputt = kaputt + 1
 IF POINT(x2, y2) <> 0 THEN kaputt = kaputt + 2
 IF x1 = x2 AND y1 = y2 THEN kaputt = 3
 PSET (x1, y1), 1
 PSET (x2, y2), 4
 FOR ss = 1 TO speed: NEXT ss
LOOP WHILE kaputt = 0
IF kaputt = 1 THEN n = x1: m = y1: c = 1
IF kaputt = 2 THEN n = x2: m = y2: c = 4
IF kaputt = 1 OR kaputt = 2 THEN
 CIRCLE (n, m), 10, c
END IF
IF kaputt = 3 THEN
 CIRCLE (x1, y1), 10, 1
 CIRCLE (x2, y2), 10, 4
END IF
IF kaputt = 4 THEN
 CIRCLE (x1, y1), 10, 5
END IF
SELECT CASE kaputt
CASE 1: LOCATE 31, 34: COLOR 1: PRINT "Blau hat au!"
CASE 2: LOCATE 31, 34: COLOR 4: PRINT "Rot ist tot!"
CASE 3: LOCATE 31, 25: COLOR 5: PRINT "Beide gleichzeitig abgemurkst!"
CASE 4: LOCATE 31, 34: COLOR 5: PRINT "Frontalzusammenstoss!"
END SELECT
FOR yy = 1 TO 10000: NEXT yy
DO: LOOP WHILE INKEY$ = ""
COLOR 7: LOCATE 33, 30: INPUT "Noch eine Runde (j/n)"; nn$
IF nn$ <> "n" THEN GOTO start

