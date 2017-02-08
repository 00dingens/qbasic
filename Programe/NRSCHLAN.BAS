'Nummernschlange

CLS
INPUT "Level"; a
kette$ = SPACE$(10)
FOR x = 1 TO a + 6
 kette$ = kette$ + LTRIM$(STR$(INT(RND * 9 + 1)))
NEXT x
CLS
LOCATE 3, 5: COLOR 8: PRINT LEFT$(kette$, 10);
COLOR 15: PRINT MID$(kette$, 11, 1);
COLOR 7: PRINT MID$(kette$, 12, a - 1);
COLOR 12: PRINT MID$(kette$, a + 11, 1);
COLOR 4: PRINT RIGHT$(kette$, 5)
DO
 DO: ein$ = INKEY$: LOOP WHILE ein$ = ""
 SELECT CASE ein$
 CASE CHR$(27): EXIT DO
 CASE "+": a = a + 1
  k$ = LTRIM$(STR$(INT(RND * 9 + 1)))
  kette$ = RIGHT$(kette$ + k$, a + 16)
  CLS
  LOCATE 3, 5: COLOR 8: PRINT LEFT$(kette$, 10);
  COLOR 7: PRINT LEFT$("脖北北北北北北北北北北北北北北北北北北北北北北北北", a);
  COLOR 12: PRINT MID$(kette$, a + 11, 1);
  COLOR 4: PRINT RIGHT$(kette$, 5);
  COLOR 7
 CASE ELSE
  IF ein$ = MID$(kette$, 11, 1) THEN
   k$ = LTRIM$(STR$(INT(RND * 9 + 1)))
   kette$ = RIGHT$(kette$ + k$, a + 16)
   CLS
   LOCATE 3, 5: COLOR 8: PRINT LEFT$(kette$, 10);
   COLOR 7: PRINT LEFT$("脖北北北北北北北北北北北北北北北北北北北北北北北北", a);
   COLOR 12: PRINT MID$(kette$, a + 11, 1);
   COLOR 4: PRINT RIGHT$(kette$, 5);
   COLOR 7
   fit = fit + 1
   pkt = pkt + a
  ELSE
   EXIT DO
  END IF
 END SELECT
LOOP UNTIL ein$ = CHR$(27)
CLS
LOCATE 3, 5: COLOR 8: PRINT LEFT$(kette$, 10);
COLOR 15: PRINT MID$(kette$, 11, 1);
COLOR 7: PRINT MID$(kette$, 12, a - 1);
COLOR 12: PRINT MID$(kette$, a + 11, 1);
COLOR 4: PRINT RIGHT$(kette$, 5)
PRINT : PRINT
COLOR 7: PRINT fit; "richtige Eingaben und"; pkt; "Punkte."

