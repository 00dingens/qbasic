DIM s(6), t(12)

bde = 15   'anzahl der gezeigten Bnde

OPEN "c:\windows\desktop\tabs.txt" FOR OUTPUT AS #1
s(1) = 5: s(2) = 12: s(3) = 8: s(4) = 3: s(5) = 10: s(6) = 5
a$ = "C  CisD  DisE  F  FisG  GisA  B  H  C  CisD  DisE  F  FisG  GisA  B  H  C  CisD  DisE  F  FisG  GisA  B  H  C  "
CLS
PRINT "                 .           .           .           .                 ."
PRINT "E ÚÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄÄÄÄÄÂÄ"
PRINT "H ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄ"
PRINT "G ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄ"
PRINT "D ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄ"
PRINT "A ÃÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄÄÄÄÄÅÄ"
PRINT "E ÀÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄÄÄÄÄÁÄ"
PRINT
PRINT "                 .           .           .           .                 ."
PRINT "E ,-----,-----,-----,-----,-----,-----,-----,-----,-----,-----,-----,-----,--"
PRINT "H |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|--"
PRINT "G |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|--"
PRINT "D |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|--"
PRINT "A |-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|--"
PRINT "E '-----'-----'-----'-----'-----'-----'-----'-----'-----'-----'-----'-----'--"
PRINT
PRINT "            .       .       .       .           ."
PRINT "E ,---,---,---,---,---,---,---,---,---,---,---,---,--"
PRINT "H |---|---|---|---|---|---|---|---|---|---|---|---|--"
PRINT "G |---|---|---|---|---|---|---|---|---|---|---|---|--"
PRINT "D |---|---|---|---|---|---|---|---|---|---|---|---|--"
PRINT "A |---|---|---|---|---|---|---|---|---|---|---|---|--"
PRINT "E '---'---'---'---'---'---'---'---'---'---'---'---'--"

FOR y = 1 TO 6
 FOR x = 1 TO 12
  LOCATE y + 1, x * 6 - 1
  PRINT RTRIM$(MID$(a$, s(y) * 3 + x * 3 - 2, 3))
  LOCATE y + 9, x * 6 - 1
  PRINT RTRIM$(MID$(a$, s(y) * 3 + x * 3 - 2, 3))
  LOCATE y + 17, x * 4
  PRINT RTRIM$(MID$(a$, s(y) * 3 + x * 3 - 2, 3))
 NEXT x
NEXT y
DO: LOOP WHILE INKEY$ = ""

FOR g = 1 TO 12
 n$ = RTRIM$(MID$(a$, g * 3 - 2, 3))
 FOR art = 1 TO 30
  FOR z = 1 TO 12: t(z) = 0: NEXT z
  t(g) = 1
  SELECT CASE art
  CASE 1: ak$ = "1   1  1    ": name$ = n$
  CASE 2: ak$ = "1  1   1    ": name$ = n$ + "m, " + LCASE$(n$)
  CASE 3: ak$ = "1   1   1   ": name$ = n$ + "+, " + n$ + "5+, " + n$ + "5#"
  CASE 4: ak$ = "1   1 1     ": name$ = n$ + "-, " + n$ + "5-, " + n$ + "5b"
  CASE 5: ak$ = "1 1 1  1    ": name$ = n$ + "2"
  CASE 6: ak$ = "1    1 1    ": name$ = n$ + "4, " + n$ + "sus"
  CASE 7: ak$ = "1   1  1 1  ": name$ = n$ + "6"
  CASE 8: ak$ = "1  1   1 1  ": name$ = n$ + "m6, " + LCASE$(n$) + "6"
  CASE 9: ak$ = "1   1  1  1 ": name$ = n$ + "7"
  CASE 10: ak$ = "1  1   1  1 ": name$ = n$ + "m7, " + LCASE$(n$) + "7"
  CASE 11: ak$ = "1   1  1   1": name$ = n$ + "7+, " + n$ + "maj7, " + n$ + "j7"
  CASE 12: ak$ = "1  1   1   1": name$ = n$ + "m7+, " + LCASE$(n$) + "7+, " + n$ + "mmaj7, " + LCASE$(n$) + "maj7, " + n$ + "mj7, " + LCASE$(n$) + "j7"
  CASE 13: ak$ = "1   1   1 1 ": name$ = n$ + "7/5+, " + n$ + "7/+, " + n$ + "+7"
  CASE 14: ak$ = "1   1 1   1 ": name$ = n$ + "7/5-, " + n$ + "7/-, " + n$ + "7/5b"
  CASE 15: ak$ = "1   11 1  1 ": name$ = n$ + "7/4"
  CASE 16: ak$ = "1   1  1 11 ": name$ = n$ + "7/6"
  CASE 17: ak$ = "1 1 1  1  1 ": name$ = n$ + "9, " + n$ + "7/9"
  CASE 18: ak$ = "1 11   1  1 ": name$ = n$ + "m9, " + LCASE$(n$) + "9, " + n$ + "m7/9, " + LCASE$(n$) + "7/9"
  CASE 19: ak$ = "1 1 1   1 1 ": name$ = n$ + "9/5+, " + n$ + "7/9/5+, " + n$ + "9/+, " + n$ + "+9"
  CASE 20: ak$ = "1 1 1 1   1 ": name$ = n$ + "9/5-, " + n$ + "7/9/5-, " + n$ + "9/-, " + n$ + "7/9/5b"
  CASE 21: ak$ = "1  11  1  1 ": name$ = n$ + "9+, " + n$ + "7/9+"
  CASE 22: ak$ = "11  1  1  1 ": name$ = n$ + "9-, " + n$ + "7/9-, " + n$ + "9b, " + n$ + "7/9b"
  CASE 23: ak$ = "1  11   1 1 ": name$ = n$ + "9+/5+, " + n$ + "7/9+/5+, " + n$ + "9+/+"
  CASE 24: ak$ = "1  11 1   1 ": name$ = n$ + "9+/5-, " + n$ + "7/9+/5-, " + n$ + "9+/-"
  CASE 25: ak$ = "11  1   1 1 ": name$ = n$ + "9-/5+, " + n$ + "7/9-/5+, " + n$ + "9-/+"
  CASE 26: ak$ = "11  1 1   1 ": name$ = n$ + "9-/5-, " + n$ + "7/9-/5-, " + n$ + "9-/-"
  CASE 27: ak$ = "1 1 1  1 1  ": name$ = n$ + "9/6"
  CASE 28: ak$ = "1 11   1 1  ": name$ = n$ + "m9/6, " + LCASE$(n$) + "9/6"
  CASE 29: ak$ = "1 1 11 1  1 ": name$ = n$ + "11, " + LCASE$(n$) + "7/9/11"
  CASE 30: ak$ = "1  1  1  1  ": name$ = n$ + "0, " + n$ + "dim, " + n$ + "verm"
  CASE ELSE:     'c d ef g a h
  END SELECT
  ak$ = MID$(ak$ + ak$ + ak$ + ak$, 13 - g, 36)
  toene$ = ""
  FOR x = 1 TO 12
   IF MID$(ak$, x + 1, 1) = "1" THEN
    IF LEN(toene$) > 0 THEN toene$ = toene$ + ", "
    toene$ = toene$ + RTRIM$(MID$(a$, x * 3 - 2, 3))
   END IF
  NEXT x
  CLS
  PRINT "Bezeichnung: " + name$
  PRINT #1, "Bezeichnung: " + name$
  PRINT #1, "T”ne: " + toene$
  PRINT #1, LEFT$("            .       .       .       .           .           .       .       .       .           .           .       .       .       .           .", bde * 4 + 2)
  FOR y = 1 TO 6
   b$ = "  "
   IF MID$(ak$, s(y) + 1, 1) = "1" THEN b$ = "o "
   FOR x = 1 TO bde
    SELECT CASE y
    CASE 1: b$ = b$ + ","
    CASE 2 TO 5: b$ = b$ + "|"
    CASE 6: b$ = b$ + "'"
    END SELECT
    IF MID$(ak$, s(y) + x + 1, 1) = "1" THEN b$ = b$ + "-o-" ELSE b$ = b$ + "---"
   NEXT x
   PRINT #1, b$
  NEXT y
  PRINT #1, ""
 NEXT art
NEXT g
CLOSE

