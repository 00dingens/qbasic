'wie viele permutationen von EHIRSW gibt es ohne die buchstabenreihenfolgen
'WIR, IHR, SIE innerhalb, wenn man die anderen 3 streicht

DIM a(6) AS STRING * 1
DIM p(8) AS INTEGER
q$ = "EHIRSW"
FOR x = 1 TO 6
 a(x) = MID$(q$, x, 1)
NEXT x
FOR a1 = 1 TO 6
FOR a2 = 1 TO 6
FOR a3 = 1 TO 6
FOR a4 = 1 TO 6
FOR a5 = 1 TO 6
FOR a6 = 1 TO 6
 e$ = "......"
 MID$(e$, a1, 1) = " ": MID$(e$, a2, 1) = " ": MID$(e$, a3, 1) = " ": MID$(e$, a4, 1) = " ": MID$(e$, a5, 1) = " ": MID$(e$, a6, 1) = " "
 IF e$ = "      " THEN
  r$ = a(a1) + a(a2) + a(a3) + a(a4) + a(a5) + a(a6)
  xx = xx + 1
  ob = 0
  IF INSTR(r$, "W") < INSTR(r$, "I") AND INSTR(r$, "I") < INSTR(r$, "R") THEN wir = wir + 1: ob = ob + 1: COLOR 12
  IF INSTR(r$, "I") < INSTR(r$, "H") AND INSTR(r$, "H") < INSTR(r$, "R") THEN ihr = ihr + 1: ob = ob + 2: COLOR 12
  IF INSTR(r$, "S") < INSTR(r$, "I") AND INSTR(r$, "I") < INSTR(r$, "E") THEN sie = sie + 1: ob = ob + 4: COLOR 12
  p(ob) = p(ob) + 1
  IF ob = 0 THEN xxx = xxx + 1
  PRINT xx; r$;
  COLOR 7
 END IF
NEXT a6
NEXT a5
NEXT a4
NEXT a3
NEXT a2
NEXT a1

PRINT "Gesamt"; xx
PRINT "WIR"; wir
PRINT "IHR"; ihr
PRINT "SIE"; sie
PRINT "reine worte"; xxx
FOR x = 0 TO 8
 tt = tt + p(x)
 PRINT p(x);
NEXT x
PRINT
PRINT tt
 'gesamtworte= 720
 ' mit wir=120
 ' mit ihr=120
 ' mit sie=120
 ' reine = 426

