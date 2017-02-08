DECLARE SUB fill (x!, y!, b!, c!)
SCREEN 13
CIRCLE (160, 100), 5, 15
fill 160, 100, 0, 12

SUB fill (x, y, b, c)
 IF POINT(x, y) = b THEN
  PSET (x, y), c
  t = TIMER
  DO: LOOP UNTIL TIMER > t + .2
  fill x + 1, y, b, c
  fill x - 1, y, b, c
  fill x, y + 1, b, c
  fill x, y - 1, b, c
 END IF
END SUB

