
'siehe ADVENTUR.BAS , nur ohne Anmerkungen

sit = 200: zei = 10: moe = 10
DIM a$(sit, zei), a(sit, 1, moe)
READ a(0, 0, 0)
FOR x = 1 TO a(0, 0, 0)
 READ a(x, 1, 0)
 FOR y = 1 TO a(x, 1, 0)
  READ a(x, 1, y)
 NEXT y
 READ a(x, 0, 0), far
 FOR y = 1 TO a(x, 0, 0)
  IF far <> 0 THEN READ a(x, 0, y)
  READ a$(x, y)
 NEXT y
NEXT x
CLS : s = 1
LOCATE 19, 1
DO
 x = s
 FOR y = 1 TO a(x, 0, 0)
  IF a(x, 0, y) = 0 THEN COLOR 15 ELSE COLOR a(x, 0, y)
  PRINT a$(x, y)
 NEXT y
 IF a(x, 1, 0) <> 0 THEN
  COLOR 8
  PRINT : PRINT "M”glichkeit(en):";
  FOR y = 1 TO a(x, 1, 0)
   PRINT y;
  NEXT y
  PRINT : PRINT "Deine Wahl"
  DO
   LOCATE 23, 12: PRINT SPACE$(60)
   LOCATE 23, 12: INPUT q
  LOOP UNTIL q > 0 AND q <= a(x, 1, 0)
  s = a(x, 1, q)
 ELSE : END
 END IF
 PRINT : PRINT : PRINT
LOOP


DATA 2

DATA 2, 1,2
DATA 3,1
DATA  9, Guten Tag!
DATA 10, Guten Tag ebenfalls!
DATA  9, Willst du bleiben oder dich verabschieden?

DATA 0
DATA 3,1
DATA  9, Tschss!
DATA 10, Tschss ebenfalls!
DATA  9, Bis zum N„chstenmal!

