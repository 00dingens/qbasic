SCREEN 12
DO
 INPUT "Gib ein Wort ein! ", w$
LOOP WHILE LEN(w$) < 2
w$ = UCASE$(w$)
PRINT "Gleich erscheinen viele Buchstaben, und du musst jedes >" + w$ + "< finden."
PRINT "Bewege den Cursor mit den Pfeiltasten. Hast du ein >" + w$ + "< gefunden,"
PRINT "dann bewege den Cursor auf den Anfangsbuchstaben (" + LEFT$(w$, 1) + ") und drcke ENTER."
PRINT "Danach bewege den Cursor auf den letzten Buchstaben des Wortes (" + RIGHT$(w$, 1) + ") und drcke"
PRINT "die LEERTASTE. Ist das Wort richtig, wird es markiert. Wenn du meinst, fertig zu"
PRINT "sein, drcke Escape."
DO: LOOP WHILE INKEY$ = ""
CLS
WIDTH 80, 60
COLOR 7
FOR x = 1 TO 80
 FOR y = 1 TO 58
  LOCATE y, x: PRINT MID$(w$, INT(RND * LEN(w$) + 1), 1)
 NEXT y
NEXT x
x = 40: y = 29: z = 7
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 COLOR z: LOCATE y, x: PRINT CHR$(SCREEN(y, x))
 SELECT CASE t$
 CASE CHR$(0) + "H": IF y > 1 THEN y = y - 1
 CASE CHR$(0) + "P": IF y < 58 THEN y = y + 1
 CASE CHR$(0) + "K": IF x > 1 THEN x = x - 1
 CASE CHR$(0) + "M": IF x < 80 THEN x = x + 1
 CASE " ": z = INT(RND * 16): COLOR z: LOCATE y, x: PRINT CHR$(SCREEN(y, x))
 CASE CHR$(27): EXIT DO
 END SELECT
 z = SCREEN(y, x, 1): COLOR z: LOCATE y, x: PRINT CHR$(SCREEN(y, x))
 LOCATE 1, 1: PRINT z
LOOP

