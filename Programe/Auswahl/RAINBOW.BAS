SCREEN 13
FOR x = 0 TO 255
 LINE (30 + x, 0)-(30 + x, 200), x
NEXT x
DO
 RESTORE
 FOR y = 1 TO 6
  READ r, g, b, rr, gg, bb
  FOR x = 1 TO 255
   OUT &H3C8, x
   OUT &H3C9, r
   OUT &H3C9, g
   OUT &H3C9, b
   r = r + rr
   g = g + gg
   b = b + bb
   IF r = 0 AND g = 63 AND b = 0 THEN rr = 1: gg = 0: bb = 0
   IF r = 63 AND g = 63 AND b = 0 THEN rr = 0: gg = -1: bb = 0
   IF r = 63 AND g = 0 AND b = 0 THEN rr = 0: gg = 0: bb = 1
   IF r = 63 AND g = 0 AND b = 63 THEN rr = -1: gg = 0: bb = 0
   IF r = 0 AND g = 0 AND b = 63 THEN rr = 0: gg = 1: bb = 0
   IF r = 0 AND g = 63 AND b = 63 THEN rr = 0: gg = 0: bb = -1
  NEXT x
  FOR zz = 1 TO 10000: NEXT zz
  IF INKEY$ <> "" THEN END
 NEXT y
LOOP

DATA  0, 0,63,0,0,0
DATA  0,63,63,0,0,0
DATA  0,63, 0,0,0,0
DATA 63,63, 0,0,0,0
DATA 63, 0, 0,0,0,0
DATA 63, 0,63,0,0,0

