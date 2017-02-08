'punkte direkt ausrechnen
'schichtenweise anzeigen (animiert)
'palette rotieren: werte aus array ablesen
'palette neu setzen: position im array „ndern

ab = 20                     'abstand der eckpunkte
xq = 20: yq = 20: zq = 20   'gr”áe der eckpunkt-matrix
r = 0: g = 128: b = 256     'palettenpositionen
xg = 100: yg = 75: zg = 400
'paletten-array
DIM o(768) AS INTEGER
FOR x = 0 TO 63: o(x) = x: o(x + 64) = 63: o(x + 128) = 63: o(x + 192) = 63 - x: o(x + 256) = 0: o(x + 320) = 0: NEXT x
FOR x = 384 TO 768: o(x) = o(x - 384): NEXT x
'eckpunkte
DIM i(xq, yq, zq) AS INTEGER
FOR x = 0 TO xq: FOR y = 0 TO yq: FOR z = 0 TO zq: i(x, y, z) = INT(RND * 256): NEXT z: NEXT y: NEXT x
'los gehts
SCREEN 13
DO
 FOR z = 0 TO zg
  z1 = (z MOD ab) / ab: z2 = 1 - z1: zz1 = INT(z / ab) MOD zq: zz2 = INT(1 + z / ab) MOD zq
  FOR y = 0 TO yg
   y1 = (y MOD ab) / ab: y2 = 1 - y1: yy1 = INT(y / ab) MOD yq: yy2 = INT(1 + y / ab) MOD yq
   FOR x = 0 TO xg
    x1 = (x MOD ab) / ab: x2 = 1 - x1: xx1 = INT(x / ab) MOD xq: xx2 = INT(1 + x / ab) MOD xq
  
    'punkt setzen
     f = i(xx1, yy1, zz1) * x2 * y2 * z2 + i(xx2, yy1, zz1) * x1 * y2 * z2 + i(xx1, yy2, zz1) * x2 * y1 * z2 + i(xx2, yy2, zz1) * x1 * y1 * z2 + i(xx1, yy1, zz2) * x2 * y2 * z1 + i(xx2, yy1, zz2) * x1 * y2 * z1 + i(xx1, yy2, zz2) * x2 * y1 * z1 + i( _
xx2, yy2, zz2) * x1 * y1 * z1
    PSET (x, y), f
 
   NEXT x
  NEXT y
  'pcopy
  'palette rotieren
  r = (r + 1) MOD 384
  g = (g + 1) MOD 384
  b = (b + 1) MOD 384
  FOR t = 0 TO 255
   OUT &H3C8, t
   OUT &H3C9, o(r + t)
   OUT &H3C9, o(g + t)
   OUT &H3C9, o(b + t)
  NEXT t
  SELECT CASE INKEY$
  CASE CHR$(13): r = INT(RND * 384): g = INT(RND * 384): b = INT(RND * 384)
  CASE CHR$(27): END
  CASE ELSE:
  END SELECT
 NEXT z
LOOP

