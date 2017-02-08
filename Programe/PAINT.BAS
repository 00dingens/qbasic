SCREEN 12
FOR x = 1 TO 10000
 LINE (RND * 640, RND * 480)-STEP(RND * 640 - 320, RND * 480 - 240), INT(RND * 16)
NEXT x
LINE (-1, -1)-(10, 10), 15, B
LINE (0, 0)-(9, 9), 1, BF
n = 0: m = 0: x = 1: y = 0
DO: LOOP WHILE INKEY$ = ""
FOR z = 1 TO 100
 FOR a = 0 TO 63
  FOR b = 0 TO 47
   PSET (a * 10 + n, b * 10 + m), 0
  NEXT b
 NEXT a
 IF POINT(n + x, m + y) = 1 THEN
  n = n + x: m = m + y
 ELSE
  IF x = 0 THEN x = -y: y = 0 ELSE y = x: x = 0
  n = n + x: m = m + y
 END IF
NEXT z

