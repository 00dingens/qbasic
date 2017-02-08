DIM a(30000) AS INTEGER   'datenfeld
DIM i(2000) AS INTEGER    'kreisfeld
DIM b(3) AS INTEGER       'menge der basen z„hlen
r = 6              'radius
rr = r * 2 + 1      'quadratmaáe
rl = rr * rr        'l„nge des kreisfeldes
fl = 30000          'datenfeldl„nge (achtung, muá in DIM passen)
sf = .48             'schwellenfaktor
dicke = 1.3           'kreisdicke

SCREEN 12
'CIRCLE (r, r), r, 15
'kreisfeld einlesen
FOR x = -r TO r
 FOR y = -r TO r
  pp = SQR(x * x + y * y) - r
  IF pp <= 0 AND -pp < dicke THEN PSET (x + r, y + r), 15
 NEXT y
NEXT x
FOR x = 0 TO rl
 i(x) = SGN(POINT(x MOD rr, INT(x / rr)))
 schwelle = schwelle + i(x)
NEXT x
schwelle = INT(schwelle * sf)

'datenfeld erzeugen
FOR x = 0 TO fl
 a(x) = INT(RND * 4)
NEXT x

we = rr
FOR breite = rr TO INT(fl / rr)
 FOR x = 0 TO fl - rl
  b(0) = 0: b(1) = 0: b(2) = 0: b(3) = 0
  FOR xx = 0 TO rr
   FOR yy = 0 TO rr
    y = xx + breite * yy
    IF i(y) = 1 THEN b(a(x + y)) = b(a(x + y)) + 1
   NEXT yy
  NEXT xx
  FOR z = 0 TO 3
   IF b(z) > schwelle THEN
    FOR xx = 0 TO rl
     IF i(xx) = 1 THEN PSET (ve + xx MOD rr, we + INT(xx / rr)), a(xx + x)
     PSET (320 + ve + xx MOD rr, we + INT(xx / rr)), a(xx + x)
    NEXT xx
    we = we + rr
    IF we > 480 - rr THEN ve = ve + rr: we = rr
    IF ve > 320 THEN ve = 0
    LOCATE 1, 7: PRINT "Last Result at breite = "; breite; "("; rr; "-"; INT(fl / rr); ")    x = "; x; " ( 0-"; fl - rl; ")"
   END IF
  NEXT z
 NEXT x
NEXT breite

