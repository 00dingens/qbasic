RANDOMIZE TIMER
INPUT "Steuerung a oder b"; s$
IF s$ <> "a" THEN s$ = "b"
SCREEN 12
PRINT "Das Bild:"
n = 2: m = 2
FOR x = 0 TO n
 FOR y = 0 TO m
  a$(x, y) = LTRIM$(RTRIM$(STR$(x + 10 * y)))
  IF LEN(a$(x, y)) < 2 THEN a$(x, y) = "0" + a$(x, y)
  IF x = 0 AND y = 0 THEN a$(x, y) = ""
  LOCATE 2 * y + 3, 4 * x + 2: PRINT a$(x, y)
  LINE (x * 32, y * 32 + 24)-STEP(32, 32), 15, B
 NEXT y
NEXT x
a = 0: b = 0
FOR z = 1 TO 5000
 IF RND < .5 THEN an = a + INT(RND * 3) - 1 ELSE bn = b + INT(RND * 3) - 1
 IF an < 0 OR an > n THEN an = a
 IF bn < 0 OR bn > m THEN bn = b
 SWAP a$(a, b), a$(an, bn)
 LOCATE 2 * a + 3, 4 * b + 2: PRINT a$(a, b)
 LOCATE 2 * an + 3, 4 * bn + 2: PRINT "  "; a$(an, bn)
 a = an: b = bn
NEXT z

DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "K": IF s$ = "a" THEN bn = b + 1 ELSE bn = b - 1
 CASE CHR$(0) + "M": IF s$ = "a" THEN bn = b - 1 ELSE bn = b + 1
 CASE CHR$(0) + "H": IF s$ = "a" THEN an = a + 1 ELSE an = a - 1
 CASE CHR$(0) + "P": IF s$ = "a" THEN an = a - 1 ELSE an = a + 1
 CASE " ": END
 END SELECT
 IF an < 0 OR an > n THEN an = a
 IF bn < 0 OR bn > m THEN bn = b
 SWAP a$(a, b), a$(an, bn)
 LOCATE 2 * a + 3, 4 * b + 2: PRINT a$(a, b)
 LOCATE 2 * an + 3, 4 * bn + 2: PRINT "  "; a$(an, bn)
 a = an: b = bn
' LOCATE 2 * a + 3, 4 * b + 2: PRINT a$(a, b)
LOOP

