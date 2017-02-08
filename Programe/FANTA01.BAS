DIM f(100)                 'Farben einlesen
xx = -500: yy = -400
FOR z = 0 TO 100
 READ d
 IF d > 15 THEN EXIT FOR
 f(z) = d
NEXT z
a = 64                     'Punktezahl
p = 3.141592 * 2 / a
SCREEN 12
FOR b = 100 TO 0 STEP -1   'Startpuktgr”áe
 z = 2000                  'Startradius
 v = 0
 DO
  FOR t = v * .5 TO a
   x = xx + SIN(t * p) * z
   y = yy + COS(t * p) * z
   'CIRCLE (x, y), p * z * .4, 7
   'PAINT (x, y), 15, 7
    xk = x: yk = y
    IF xk < 0 THEN xk = xk + b * .7
    IF xk > 639 THEN xk = xk - b * .7
    IF yk < 0 THEN yk = yk + b * .7
    IF yk > 479 THEN yk = yk - b * .7
   IF xk < 640 AND xk > -1 AND yk > -1 AND yk < 480 THEN 'wenn im Bildschirm
    IF p * z > b THEN
     CIRCLE (x, y), b, 15
     PAINT (xk, yk), 15, 15
     CIRCLE (x, y), b, f(b MOD 29)
     PAINT (xk, yk), f(b MOD 29), f(b MOD 29)
    END IF
   END IF
  NEXT t
  z = z - p * z * .8  'Ringabstand  ca .3 - .8
  v = v XOR 1
 LOOP UNTIL z < 1
NEXT b
DO: LOOP WHILE INKEY$ = ""

DATA 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,16
DATA 0,0,8,8,7,7,15,15,15,7,7,8,8,0,8,7,15,7,8,0,8,7,15,7,8
DATA 16, alles Farbwerte, 16 zum aufh”ren

