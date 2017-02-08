x = 1: y = 1
xx = 1: yy = 1
SCREEN 12
WIDTH 80, 60
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 tt$ = LCASE$(t$)
 IF tt$ = "Ž" THEN tt$ = "„"
 IF tt$ = "™" THEN tt$ = "”"
 IF tt$ = "š" THEN tt$ = ""
 IF tt$ >= "a" AND tt$ < "s" THEN LINE (xx, yy)-STEP(5, 5), 15, BF
 IF tt$ = "„" OR tt$ = "”" THEN LINE (xx, yy)-STEP(5, 5), 15, BF
 SELECT CASE tt$
 CASE "a": LINE (xx, yy)-STEP(4, 4), 0, BF
 CASE "b": LINE (xx, yy)-STEP(4, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "c": LINE (xx + 1, yy)-STEP(3, 4), 0, BF
 CASE "d": LINE (xx + 1, yy)-STEP(3, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "e": LINE (xx + 1, yy)-STEP(4, 4), 0, BF
 CASE "f": LINE (xx + 1, yy)-STEP(4, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "g": LINE (xx, yy + 1)-STEP(4, 3), 0, BF
 CASE "h": LINE (xx, yy + 1)-STEP(4, 3), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "i": LINE (xx + 1, yy + 1)-STEP(3, 3), 0, BF
 CASE "j": LINE (xx + 1, yy + 1)-STEP(3, 3), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "k": LINE (xx + 1, yy + 1)-STEP(4, 3), 0, BF
 CASE "l": LINE (xx + 1, yy + 1)-STEP(4, 3), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "m": LINE (xx, yy + 1)-STEP(4, 4), 0, BF
 CASE "n": LINE (xx, yy + 1)-STEP(4, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "o": LINE (xx + 1, yy + 1)-STEP(3, 4), 0, BF
 CASE "p": LINE (xx + 1, yy + 1)-STEP(3, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "q": LINE (xx + 1, yy + 1)-STEP(4, 4), 0, BF
 CASE "r": LINE (xx + 1, yy + 1)-STEP(4, 4), 0, BF: LINE (xx + 2, yy + 2)-STEP(1, 1), 15, BF
 CASE "s": LINE (xx, yy + 2)-STEP(3, 2): LINE -STEP(2, -2)
 CASE "t": LINE (xx, yy + 2)-STEP(3, 2): LINE -STEP(2, -2): LINE (xx + 2, yy)-STEP(1, 1), 15, BF
 CASE "u": LINE (xx + 2, yy)-STEP(2, 3): LINE -STEP(-2, 2)
 CASE "v": LINE (xx + 2, yy)-STEP(2, 3): LINE -STEP(-2, 2): LINE (xx, yy + 2)-STEP(1, 1), 15, BF
 CASE "w": LINE (xx + 3, yy)-STEP(-2, 2): LINE -STEP(0, 1): LINE -STEP(2, 2)
 CASE "x": LINE (xx + 3, yy)-STEP(-2, 2): LINE -STEP(0, 1): LINE -STEP(2, 2): LINE (xx + 4, yy + 2)-STEP(1, 1), 15, BF
 CASE "y": LINE (xx, yy + 3)-STEP(3, -2): LINE -STEP(2, 2)
 CASE "z": LINE (xx, yy + 3)-STEP(3, -2): LINE -STEP(2, 2): LINE (xx + 2, yy + 4)-STEP(1, 1), 15, BF
 CASE "„": LINE (xx, yy)-STEP(4, 4), 0, BF: x = x + 1: xx = xx + 8: LINE (xx, yy)-STEP(5, 5), 15, BF: LINE (xx + 1, yy)-STEP(4, 4), 0, BF
 CASE "”": LINE (xx + 1, yy + 1)-STEP(3, 4), 0, BF: x = x + 1: xx = xx + 8: LINE (xx, yy)-STEP(5, 5), 15, BF: LINE (xx + 1, yy)-STEP(4, 4), 0, BF
 CASE "": LINE (xx + 2, yy)-STEP(2, 3): LINE -STEP(-2, 2): x = x + 1: xx = xx + 8: LINE (xx, yy)-STEP(5, 5), 15, BF: LINE (xx + 1, yy)-STEP(4, 4), 0, BF
 CASE "á": LINE (xx, yy + 2)-STEP(3, 2): LINE -STEP(2, -2): x = x + 1: xx = xx + 8: LINE (xx, yy + 2)-STEP(3, 2): LINE -STEP(2, -2)
 CASE CHR$(13): y = y + 1: x = 0: yy = yy + 8: xx = -7
 CASE CHR$(27): END
 CASE ELSE: LOCATE y, x: PRINT t$
 END SELECT
 x = x + 1: xx = xx + 8
 IF x > 79 THEN y = y + 1: x = 1: yy = yy + 8: xx = 1
LOOP

