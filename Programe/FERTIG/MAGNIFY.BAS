RANDOMIZE TIMER
SCREEN 12
INPUT "Wieviele Ecken (1 - 10) "; ee
INPUT "Wieviele Segmente (1 - 40, 0 = unendl.)"; ss
IF ss = 0 THEN ss = 1: un = 1
CLS
DIM x(ee, ss + 1), y(ee, ss + 1), a(ee), b(ee)
FOR q = 1 TO ee
 x(q, 1) = RND * 640: y(q, 1) = RND * 480
 x(q, ss) = x(q, 1): y(q, ss) = y(q, 1)
NEXT q
FOR q = 1 TO ee
 a(q) = RND * 2 * ee - ee: b(q) = RND * 2 * ee - ee
NEXT q
DO
 FOR w = 1 TO ss
 IF un = 0 THEN LINE (x(ee, w), y(ee, w))-(x(1, w), y(1, w)), 0
  FOR q = 2 TO ee
   IF un = 0 THEN LINE -(x(q, w), y(q, w)), 0
  NEXT q
  FOR q = 1 TO ee
   x(q, 0) = x(q, ss): y(q, 0) = y(q, ss)
  NEXT q
  FOR q = 1 TO ee
   x(q, w) = x(q, w - 1) + a(q)
   y(q, w) = y(q, w - 1) + b(q)
  NEXT q
  FOR q = 1 TO ee
   IF x(q, w) < 1 THEN a(q) = RND * ee
   IF x(q, w) > 639 THEN a(q) = RND * -ee
   IF y(q, w) < 1 THEN b(q) = RND * ee
   IF y(q, w) > 479 THEN b(q) = RND * -ee
  NEXT q
  LINE (x(ee, w), y(ee, w))-(x(1, w), y(1, w)), 9
  FOR q = 2 TO ee
   LINE -(x(q, w), y(q, w)), q MOD 16
  NEXT q
 NEXT w
LOOP WHILE INKEY$ = ""

