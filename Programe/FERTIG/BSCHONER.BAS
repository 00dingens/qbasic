
ttt = 10000
'     ----- Je gr”áer diese Zahl, desto langsamer bewegt sich das Wort
RANDOMIZE TIMER
CLS
INPUT "Wie soll der Text lauten?"; q$
DO
 x = 80: c = INT(RND * 22) + 1: y = 1
 DO
  CLS
  LOCATE c, x
  PRINT LEFT$(q$, y)
  x = x - 1: y = y + 1
  FOR v = 1 TO ttt: NEXT v
 LOOP UNTIL x = 0
 FOR a = 1 TO LEN(q$)
  CLS
  LOCATE c, 1
  PRINT RIGHT$(q$, LEN(q$) - a)
  FOR v = 1 TO ttt: NEXT v
 NEXT a
LOOP WHILE INKEY$ = ""

