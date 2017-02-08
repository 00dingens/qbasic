SCREEN 12
FOR x = 0 TO 11
 READ r, g, b
 OUT &H3C8, x
 OUT &H3C9, r
 OUT &H3C9, g
 OUT &H3C9, b
NEXT x
FOR x = -320 TO 320
 FOR y = -240 TO 240
  'e = (x * x + y * y) / 160
  'e = 2000000 / (x * x + y * y + .001)
  e = SQR(x * x + y * y) * 100
  PSET (x + 320, y + 240), e MOD 12
 NEXT y
NEXT x


DATA 63,0,0, 47,15,0, 31,31,0, 15,47,0, 0,63,0, 0,47,15, 0,31,31, 0,15,47, 0,0,63, 15,0,47, 31,0,31, 47,0,15

