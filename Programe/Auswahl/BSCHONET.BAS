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
  FOR v = 1 TO 1000: NEXT v
'              ---- Je gr”áer diese Zahl, desto langsamer bewegt sich das Wort
 LOOP UNTIL x = 0
 FOR a = 1 TO LEN(q$)
  CLS
  LOCATE c, 1
  PRINT RIGHT$(q$, LEN(q$) - a)
  FOR v = 1 TO 1000: NEXT v
'              ---- Je gr”áer diese Zahl, desto langsamer verschwindet das Wort
 NEXT a
LOOP WHILE INKEY$ = ""

