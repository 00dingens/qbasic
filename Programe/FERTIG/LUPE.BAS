DIM q(500)
SCREEN 12
LINE (27, 25)-(50, 48), 7
LINE (25, 27)-(48, 50), 7
LINE (50, 48)-(48, 50), 7
CIRCLE (20, 20), 15, 7
PAINT (20, 20), 7, 7
CIRCLE (20, 20), 12, 8
PAINT (20, 20), 8, 8
PAINT (40, 40), 7, 7
GET (4, 4)-(49, 49), q
PUT (140, 140), q
q = 40
FOR x = 1 TO 640 STEP q
 FOR y = 1 TO 480 STEP q
  LINE (x, y)-STEP(q - 1, q - 1), INT(RND * 8), BF
 NEXT y
NEXT x
x = 200: y = 200: a = 2
PUT (x, y), q
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 PUT (x, y), q
 SELECT CASE t$
 CASE CHR$(0) + "H": y = y - a
 CASE CHR$(0) + "P": y = y + a
 CASE CHR$(0) + "K": x = x - a
 CASE CHR$(0) + "M": x = x + a
 CASE "": END
 END SELECT
 PUT (x, y), q
LOOP

