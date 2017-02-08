RANDOMIZE TIMER
ON ERROR GOTO er
los:
SCREEN 13
fl = 7
x1(2) = 1'INT(RND * 256)
y1(2) = 1'INT(RND * 256)
z1(2) = 1'INT(RND * 256)
x2(2) = 81'INT(RND * 256)
y2(2) = 55'INT(RND * 256)
z2(2) = 39'INT(RND * 256)
x3(2) = 47'INT(RND * 256)
y3(2) = 87'INT(RND * 256)
z3(2) = 49'INT(RND * 256)
c(2) = 1'INT(RND * 15 + 1)

x1(1) = 10'INT(RND * 256)
y1(1) = 46'INT(RND * 256)
z1(1) = 71'INT(RND * 256)
x2(1) = 55'INT(RND * 256)
y2(1) = 14'INT(RND * 256)
z2(1) = 42'INT(RND * 256)
x3(1) = 77'INT(RND * 256)
y3(1) = 87'INT(RND * 256)
z3(1) = 3'INT(RND * 256)
c(1) = 2'INT(RND * 15 + 1)

FOR t = 1 TO fl


x1(t) = INT(RND * 256)
y1(t) = INT(RND * 256)
z1(t) = INT(RND * 256)
x2(t) = INT(RND * 256)
y2(t) = INT(RND * 256)
z2(t) = INT(RND * 256)
x3(t) = INT(RND * 256)
y3(t) = INT(RND * 256)
z3(t) = INT(RND * 256)
c(t) = t'INT(RND * 15 + 1)


 x2(t) = x2(t) - x1(t)
 y2(t) = y2(t) - x1(t)
 z2(t) = z2(t) - x1(t)
 x3(t) = x3(t) - x1(t)
 y3(t) = y3(t) - x1(t)
 z3(t) = z3(t) - x1(t)
 
' IF x2(t) > 127 OR x2(t) < -128 THEN GOTO los
' IF y2(t) > 127 OR y2(t) < -128 THEN GOTO los
' IF z2(t) > 127 OR z2(t) < -128 THEN GOTO los
' IF x3(t) > 127 OR x3(t) < -128 THEN GOTO los
' IF y3(t) > 127 OR y3(t) < -128 THEN GOTO los
' IF z3(t) > 127 OR z3(t) < -128 THEN GOTO los
NEXT t
c(0) = 0
FOR t = 1 TO fl
 PSET (x1(t) + 60, y1(t)), t + 1
 PSET (x2(t) + 60, y2(t)), t
 PSET (x3(t) + 60, y3(t)), t
NEXT t
FOR a = 1 TO 255
 LOCATE 1, 1: PRINT a
 FOR b = 1 TO 255
  zzz = 1000: ff = 0
  FOR t = 1 TO fl
   n = (y3(t) * (a - x1(t)) + x3(t) * (x1(t) - b)) / (x2(t) * y3(t) - x3(t) * y2(t))
   m = (y2(t) * (a - x1(t)) + x2(t) * (x1(t) - b)) / (x3(t) * y2(t) - x2(t) * y3(t))
   IF n < 0 OR m < 0 OR n + m > 1 THEN GOTO nf
   zz = z1(t) + n * z2(t) + m * z3(t)
   'LOCATE 2, 1: PRINT zz
   IF zz < zzz THEN zzz = zz: ff = t
nf:
  NEXT t
  PSET (a + 60, b), c(ff)
 NEXT b
 IF INKEY$ <> "" THEN GOTO los
NEXT a

er: RESUME NEXT

