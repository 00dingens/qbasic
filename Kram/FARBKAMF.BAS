RANDOMIZE TIMER
SCREEN 13
FOR x = 0 TO 255
 OUT &H3C8, x
 OUT &H3C9, x
 OUT &H3C9, x
 OUT &H3C9, x
NEXT x
xx = 39: yy = 39
FOR x = 0 TO xx
 FOR y = 0 TO yy
  PSET (x, y), INT(RND * 256)
 NEXT y
NEXT x
DO
FOR a = 2 TO 6
 FOR b = 2 TO 6
  FOR x = a TO xx + a STEP 5
   FOR y = b TO yy + b STEP 5
    wert = 0
    FOR x1 = -2 TO 2
     FOR y1 = -2 TO 2
      wert = wert + POINT((x + x1) MOD (xx + 1), (y + y1) MOD (yy + 1))
     NEXT y1
    NEXT x1
    wert = wert / 25
    IF wert > 127 THEN wert = 255 ELSE wert = 0
    PSET (x MOD (xx + 1), y MOD (yy + 1)), wert
   NEXT y
  NEXT x
 NEXT b
NEXT a
BEEP
LOOP WHILE INKEY$ = ""

