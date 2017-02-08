DIM i(3) AS STRING * 32
SCREEN 12
i(1) = CHR$(255) + CHR$(125) + CHR$(125) + CHR$(125) + CHR$(255) + CHR$(187) + CHR$(187) + CHR$(187) + CHR$(255) + CHR$(215) + CHR$(215) + CHR$(215) + CHR$(255) + CHR$(239) + CHR$(239) + CHR$(239) + CHR$(255) + CHR$(215) + CHR$(215) + CHR$(215) + CHR$(255) + CHR$(187) + CHR$(187) + CHR$(187) + CHR$(255) + CHR$(125) + CHR$(125) + CHR$(125) + CHR$(255) + CHR$(254) + CHR$(254) + CHR$(254)
i(2) = CHR$(125) + CHR$(255) + CHR$(125) + CHR$(125) + CHR$(187) + CHR$(255) + CHR$(187) + CHR$(187) + CHR$(215) + CHR$(255) + CHR$(215) + CHR$(215) + CHR$(239) + CHR$(255) + CHR$(239) + CHR$(239) + CHR$(215) + CHR$(255) + CHR$(215) + CHR$(215) + CHR$(187) + CHR$(255) + CHR$(187) + CHR$(187) + CHR$(125) + CHR$(255) + CHR$(125) + CHR$(125) + CHR$(254) + CHR$(255) + CHR$(254) + CHR$(254)
i(3) = CHR$(125) + CHR$(125) + CHR$(255) + CHR$(125) + CHR$(187) + CHR$(187) + CHR$(255) + CHR$(187) + CHR$(215) + CHR$(215) + CHR$(255) + CHR$(215) + CHR$(239) + CHR$(239) + CHR$(255) + CHR$(239) + CHR$(215) + CHR$(215) + CHR$(255) + CHR$(215) + CHR$(187) + CHR$(187) + CHR$(255) + CHR$(187) + CHR$(125) + CHR$(125) + CHR$(255) + CHR$(125) + CHR$(254) + CHR$(254) + CHR$(255) + CHR$(254)
FOR a1 = 1 TO 3
 SELECT CASE a1
 CASE 1: c = 1: a$ = i(1)
 CASE 2: c = 2: a$ = i(2)
 CASE 3: c = 4: a$ = i(3)
 END SELECT
 FOR a2 = 1 TO 3
  FOR a3 = 1 TO 3
   CLS
   PAINT (10, 10), 15
   FOR a4 = 1 TO 3
    x = a4 * 200 - 100
    FOR a = 1 TO a4
     y = 210 - a4 * 50 + (a - 1) * 100
     SELECT CASE a2
     CASE 1: LINE (x - 40, y - 40)-(x + 40, y + 40), c, BF: LINE (x - 35, y - 35)-(x + 35, y + 35), 15, BF
     CASE 2: CIRCLE (x, y), 40, c, , , 1: CIRCLE (x, y), 35, c, , , 1: PAINT (x + 37, y), c, c
     CASE 3: LINE (x, y - 50)-(x + 41, y + 24), c: LINE -(x - 41, y + 24), c: LINE -(x, y - 50), c: LINE (x, y - 40)-(x + 32, y + 20), c: LINE -(x - 32, y + 20), c: LINE -(x, y - 40), c: PAINT (x, y + 22), c, c
     END SELECT
     IF a3 = 2 THEN PAINT (x, y), a$, c
     IF a3 = 3 THEN PAINT (x, y), c, c
    NEXT a
   NEXT a4
   LINE (0, 0)-(599, 319), 0, B
   LINE (199, 0)-(399, 319), 0, B
   DO: LOOP WHILE INKEY$ = ""
  NEXT a3
 NEXT a2
NEXT a1

