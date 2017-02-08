DIM a(95)  's/w
DIM n(13)  'nummer
a(1) = 1: a(2) = 0: a(3) = 1
a(46) = 0: a(47) = 1: a(48) = 0: a(49) = 1: a(50) = 0
a(93) = 1: a(94) = 0: a(95) = 1
INPUT "Nummer eingeben (13-Stellig)"; nr$
FOR x = 1 TO 13
 n(x) = VAL(MID$(nr$, x, 1))
 IF n(x) = 0 AND MID$(nr$, x, 1) <> "0" THEN PRINT "ERROR": END
NEXT x
SELECT CASE n(1)
CASE 0: ab$ = "aaaaaa"
CASE 1: ab$ = "aababb"
CASE 2: ab$ = "aabbab"
CASE 3: ab$ = "aabbba"
CASE 4: ab$ = "abaabb"
CASE 5: ab$ = "abbaab"
CASE 6: ab$ = "abbbaa"
CASE 7: ab$ = "ababab"
CASE 8: ab$ = "ababba"
CASE 9: ab$ = "abbaba"
END SELECT
ab$ = ab$ + "      "
FOR x = 2 TO 13
 SELECT CASE n(x)
 CASE 0: c$ = "1110010"
 CASE 1: c$ = "1100110"
 CASE 2: c$ = "1101100"
 CASE 3: c$ = "1000010"
 CASE 4: c$ = "1011100"
 CASE 5: c$ = "1001110"
 CASE 6: c$ = "1010000"
 CASE 7: c$ = "1000100"
 CASE 8: c$ = "1001000"
 CASE 9: c$ = "1110100"
 END SELECT
 IF x < 8 THEN
  IF MID$(ab$, x - 1, 1) = "a" THEN
   FOR y = 1 TO 7: a(x * 7 - 11 + y) = 1 - VAL(MID$(c$, y, 1)): NEXT y
  ELSE
   FOR y = 1 TO 7: a(x * 7 - 11 + y) = VAL(MID$(c$, 8 - y, 1)): NEXT y
  END IF
 ELSE
  FOR y = 1 TO 7: a(x * 7 - 6 + y) = VAL(MID$(c$, y, 1)): NEXT y
 END IF
NEXT x
SCREEN 7
PAINT (0, 0), 15
FOR x = 1 TO 95
 LINE (10 + x * 3, 0)-STEP(2, 100), 15 - a(x) * 15, BF
NEXT x

