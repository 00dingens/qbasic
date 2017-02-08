
'einen 3D-Punkt (zum schielen) steuern mit:
'a und d fÅr x-Achse, w und x fÅr y-Achse, e und y fÅr z-Achse
's zum Farbe einschalten

SCREEN 12
x = 50: y = 50: z = 50
DO
 DO: q$ = INKEY$: LOOP WHILE q$ = ""
 PSET (100 + x + z * .5, 150 + y - z * .5), f1
 PSET (200 + x + z * .25, 150 + y - z * .5), f2
 SELECT CASE q$
 CASE "a": x = x - 1
 CASE "d": x = x + 1
 CASE "w": y = y - 1
 CASE "x": y = y + 1
 CASE "y": z = z - 1
 CASE "e": z = z + 1
 CASE "s": f1 = 15: f2 = 15
 CASE "": END
 END SELECT
 PSET (100 + x + z * .5, 150 + y - z * .5), 15
 PSET (200 + x + z * .25, 150 + y - z * .5), 15
LOOP

