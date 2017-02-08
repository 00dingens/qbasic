RANDOMIZE TIMER
ON ERROR GOTO er
DIM x1(100), x2(100), x3(100), y1(100), y2(100), y3(100), z1(100), z2(100), z3(100), c(100)
nr = 1
los:
SCREEN 12
fl = nr
FOR t = 1 TO fl
 x1(t) = INT(RND * 640)
 y1(t) = INT(RND * 480)
 z1(t) = INT(RND * 100)
 x2(t) = INT(RND * 640)
 y2(t) = INT(RND * 240)
 z2(t) = INT(RND * 100)
 x3(t) = INT(RND * 640)
 y3(t) = INT(RND * 240)
 z3(t) = INT(RND * 100)
 c(t) = t MOD 15


 x2(t) = x2(t) - x1(t)
 y2(t) = y2(t) - y1(t)
 z2(t) = z2(t) - z1(t)
 x3(t) = x3(t) - x1(t)
 y3(t) = y3(t) - y1(t)
 z3(t) = z3(t) - z1(t)
 
' IF x2(t) > 127 OR x2(t) < -128 THEN GOTO los
' IF y2(t) > 127 OR y2(t) < -128 THEN GOTO los
' IF z2(t) > 127 OR z2(t) < -128 THEN GOTO los
' IF x3(t) > 127 OR x3(t) < -128 THEN GOTO los
' IF y3(t) > 127 OR y3(t) < -128 THEN GOTO los
' IF z3(t) > 127 OR z3(t) < -128 THEN GOTO los
NEXT t
c(0) = 15
sx = 0: sy = 0: ex = 639: ey = 479: ss = 16
mal:
FOR a = sx TO ex STEP ss
 LOCATE 1, 1: PRINT INT(a / 6.4)
 FOR b = sy TO ey STEP ss
  zzz = 1000: ff = 0
  FOR t = 1 TO fl
  
   n = (y3(t) * (a - x1(t)) + x3(t) * (y1(t) - b)) / (x2(t) * y3(t) - x3(t) * y2(t))
   m = (y2(t) * (a - x1(t)) + x2(t) * (y1(t) - b)) / (x3(t) * y2(t) - x2(t) * y3(t))
  
   IF n < 0 OR m < 0 OR n + m > 1 THEN GOTO nf
   zz = z1(t) + n * z2(t) + m * z3(t)
   IF zz < zzz THEN zzz = zz: ff = t
nf:
  NEXT t
  IF ss = 1 THEN PSET (a, b), c(ff) ELSE LINE (a - ss / 2, b - ss / 2)-STEP(ss - 1, ss - 1), c(ff), BF
 NEXT b
NEXT a
LINE (0, 0)-(40, 16), 15, BF
IF ss = 1 THEN DO: LOOP WHILE INKEY$ = "": GOTO los
GOTO steuern

er: RESUME NEXT

steuern:
DO: r$ = INKEY$: LOOP WHILE r$ = ""
SELECT CASE r$
CASE CHR$(0) + "H": END
CASE CHR$(0) + "P": GOTO los
CASE CHR$(0) + "M": sx = 0: ex = 640: sy = 0: ey = 480: ss = ss / 2: GOTO mal
CASE CHR$(0) + "K": nr = nr + 1: GOTO los
CASE " ": INPUT sx, sy, ex, ey: ss = ss / 2: GOTO mal
CASE "o": ss = 1: GOTO mal
CASE ELSE:
END SELECT
GOTO mal

