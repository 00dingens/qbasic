
'VerbesserungswÅrdiges Programm teilt eine Zahl durch eine andere,
'erkennt Periode

DIM q%(15000)
SCREEN 12
INPUT "     Welche Zahl soll dividiert werden "; x%
INPUT "  Durch welche Zahl soll dividiert werden "; y%
a$ = STR$((x% - (x% MOD y%)) / y%) + "."
x% = (x% MOD y%) * 10
PRINT : PRINT a$;
DO
 c = c + 1
 a$ = a$ + STR$((x% - (x% MOD y%)) / y%)
 x% = (x% MOD y%) * 10
 q%(c) = x%
 FOR s = 1 TO c - 1
  IF x% = q%(s) THEN p = s: EXIT DO
 NEXT s
 PRINT RIGHT$(a$, 1);
LOOP WHILE INKEY$ = ""
FOR g = 1 TO LEN(a$)
 IF MID$(a$, g, 1) = "." THEN pp = g: EXIT FOR
NEXT g
IF p <> 0 THEN
 LINE ((pp + p) * 8 - 10, 48)-((pp + c) * 8 - 8, 48), 15
END IF
PRINT p

