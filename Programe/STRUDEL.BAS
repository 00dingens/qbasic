SCREEN 12
f = 3.14  'Drehung  2 * pi = 1 Drehung
r = 150   'Radius
FOR y = 1 TO 28
 FOR x = 1 TO 40 STEP 2
  LOCATE y, x
  'PRINT CHR$(INT(RND * 224 + 32)): PRINT CHR$(INT(RND * 224 + 32))
  'PRINT "ÅÄ"
  PRINT "Û"
  'PRINT "ÜÜ"
  'PRINT "Üß"
  'PRINT "Ü"
  'PRINT "±±"
 NEXT x
NEXT y
FOR y = -240 TO 239
 FOR x = -160 TO 159
  e = SQR((x * x) + (y * y))
  IF e < r THEN
   a1 = SIN(f * (r - e) / r)
   a2 = COS(f * (r - e) / r)
   n = x * a2 - y * a1
   m = x * a1 + y * a2
   PSET (x + 480, y + 240), POINT(n + 160, m + 240)
  ELSE
   PSET (x + 480, y + 240), POINT(x + 160, y + 240)
  END IF
 NEXT x
NEXT y

