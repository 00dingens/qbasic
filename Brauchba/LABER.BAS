CLS
WIDTH 80, 50
PRINT "€      ‹ﬂ‹  €ﬂﬂﬂ‹ €ﬂﬂﬂﬂ €ﬂﬂﬂ‹ €ﬂﬂﬂ‹ €ﬂﬂﬂ‹ ‹ﬂﬂﬂ‹ ‹ﬂﬂﬂ‹ €ﬂﬂﬂ‹  ‹ﬂ‹  €‹ ‹€ €‹ ‹€"
PRINT "€     €‹‹‹€ €‹‹‹ﬂ €‹‹‹  €‹‹‹ﬂ €‹‹‹ﬂ €‹‹‹ﬂ €   € € ‹‹‹ €‹‹‹ﬂ €‹‹‹€ € ﬂ € € ﬂ €"
PRINT "€     €   € €   € €     € ﬂ‹  €     € ﬂ‹  €   € €   € € ﬂ‹  €   € €   € €   €"
PRINT "ﬂﬂﬂﬂﬂ ﬂ   ﬂ ﬂﬂﬂﬂ  ﬂﬂﬂﬂﬂ ﬂ   ﬂ ﬂ     ﬂ   ﬂ  ﬂﬂﬂ   ﬂﬂﬂ  ﬂ   ﬂ ﬂ   ﬂ ﬂ   ﬂ ﬂ   ﬂ"
PRINT
PRINT "Wir kînnen uns versuchen zu unterhalten. Na, denn mal los!"
PRINT
DO
 COLOR 10
 INPUT "-", a$
 COLOR 9
 a$ = LCASE$(a$)
 PRINT
 j = 0

 IF INSTR(1, a$, "hallo") <> 0 THEN PRINT "Hallo!": j = 1
 IF INSTR(1, a$, "wie") <> 0 AND INSTR(1, a$, "geht") <> 0 THEN
 IF INSTR(1, a$, "dir") = 0 THEN PRINT "Weis ich nicht." ELSE PRINT "Mir gehts gut (Obwohl Computer keine gefÅhle haben). Und dir?"
  j = 1
 END IF
 IF INSTR(1, a$, "gut") <> 0 THEN
  IF INSTR(1, a$, "nicht") = 0 THEN PRINT "Ist ja toll." ELSE PRINT "Warum nicht gut?"
  j = 1
 END IF
 IF INSTR(1, a$, "spiel") <> 0 THEN
  PRINT "Welches Spiel?"
  PRINT
  COLOR 10
  INPUT "-", a$
  COLOR 9
  PRINT
  s = 0
  IF INSTR(1, a$, "trick 17") <> 0 THEN GOSUB trick17: s = 1
  IF INSTR(1, a$, "schach") <> 0 THEN PRINT "Ich kann kein Schach.": s = 1
  IF s = 0 THEN PRINT "Kenne ich nicht."
  j = 1
 END IF
 IF INSTR(1, a$, "weis") <> 0 AND INSTR(1, a$, "ich") <> 0 THEN
  IF INSTR(1, a$, "nicht") = 0 THEN PRINT "Was weist du?" ELSE PRINT "Denk mal nach!"
  j = 1
 END IF

 IF INSTR(1, a$, "Åbel") <> 0 THEN PRINT "Wie kommts?": j = 1
 IF INSTR(1, a$, "bye") <> 0 THEN EXIT DO
 IF INSTR(1, a$, "tschÅss") <> 0 THEN EXIT DO
 IF INSTR(1, a$, "adios") <> 0 THEN EXIT DO
 IF INSTR(1, a$, "exit") <> 0 THEN EXIT DO

 IF j = 0 THEN
  IF a$ = "" THEN
   PRINT "Schreib mal was!"
  ELSE
   PRINT "Ich Kapier nicht, was du willst."
  END IF
 END IF
 PRINT


LOOP

PRINT "Danke fÅr die Unterhaltung."
PRINT "Bye!"
END

trick17:
 PRINT "Unfertig!!!"
RETURN

