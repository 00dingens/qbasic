'Automat, der durch 4 teilbare Zahlen als Sprache akzeptiert

OPEN "c:\windows\desktop\ti.txt" FOR OUTPUT AS #1
PRINT #1, "L={Phi, Sigma, delta, S, F}"
PRINT #1, "Phi={A0, A1, A2, A3, E0, E1, E2, E3}"
PRINT #1, "Sigma={0, 1, 2, 3, 4, 5, 6, 7, 8, 9}"
FOR x = 0 TO 3
 FOR y = 0 TO 9
  IF (x * 10 + y) MOD 4 = 0 THEN q$ = "E" ELSE q$ = "A"
  PRINT #1, "delta(A"; LTRIM$(STR$(x)); ","; LTRIM$(STR$(y)); ") = "; q$; LTRIM$(STR$(y MOD 4))
  PRINT #1, "delta(E"; LTRIM$(STR$(x)); ","; LTRIM$(STR$(y)); ") = "; q$; LTRIM$(STR$(y MOD 4))
 NEXT y
NEXT x

PRINT #1, "S=E0"
PRINT #1, "F={E0, E1, E2, E3}"
CLOSE

