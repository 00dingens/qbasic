
DIM u(4) AS STRING * 3
DIM px(100) AS INTEGER, py(100) AS INTEGER

dicke = 2
'streifenbreite

punte = 64
'zuweisungen von positionen


SCREEN 13
xx = 320
yy = 200

'zufallspunkte
FOR z = 1 TO punte
 px(z) = INT(RND * xx): py(z) = INT(RND * yy)
NEXT z

'ringe s/w
FOR y = 0 TO yy
 FOR x = 0 TO xx
 
  'z = SQR((x - (xx / 2)) ^ 2 + (y - (yy / 2)) ^ 2)       'ringe zentriert
  'z = yy - y                      'linien S Åd (horiz)
  'z = x                           'linien O st (vert)
  'z = y                           'linien N ord (horiz)
  'z = xx - x                      'linien W est (vert)
  'z = (x + y) / SQR(2)           'linien NO
  'z = (x + yy - y) / SQR(2)      'linien SO
  'z = (xx - x + y) / SQR(2)      'linien NW
  'z = (xx + yy - x - y) / SQR(2) 'linien SW
  'z = SQR((x - (xx / 3)) ^ 2 + (y - (yy / 3)) ^ 2) + SQR((x - (xx * 2 / 3)) ^ 2 + (y - (yy * 2 / 3)) ^ 2) 'oval
 
  z = 100000
  FOR a = 1 TO punte
   zz = SQR((x - px(a)) ^ 2 + (y - py(a)) ^ 2)
   IF zz < z THEN z = zz: c = a
  NEXT a

  gre = z MOD dicke
  IF gre < 1 THEN c = c ELSE c = 0
  PSET (x, y), c
 NEXT x
 LOCATE 2, 1: PRINT INT(y / yy * 100); "%  "
NEXT y

CLOSE

END

