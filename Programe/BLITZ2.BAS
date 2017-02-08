
'blitz: es werden zufalls-wegeteilchen erzeugt. der blitz bewegt sich immer
'nach unten zum n„chstgelegenen wegeteilchen fort.

DIM n(16000), m(16000)
RANDOMIZE TIMER
SCREEN 12
anz = 2000            'anzahl der wegeteilchen max.16000
blz = 5               'anzahl der blitzenden jeweils oben und unten
br = 640              'breite des bildes
                      'wenn anz=blz*2 dann wird das ganze feld gefllt
FOR x = 1 TO anz
 n(x) = INT(RND * br)
 m(x) = INT(RND * 480)
 PSET (n(x), m(x)), 7
NEXT x
PSET (0, -1)
FOR x = 1 TO anz - 1
 FOR y = x TO anz
  IF m(x) > m(y) THEN
   SWAP n(x), n(y)
   SWAP m(x), m(y)
  END IF
 NEXT y
 PSET (n(x), m(x)), 8
' LINE -(n(x), m(x))
NEXT x
FOR z = 1 TO blz
 FOR x = z TO anz - 1 - z
  d = 100000: nr = 0
  FOR y = x + 1 TO anz
   dd = SQR((n(x) - n(y)) * (n(x) - n(y)) + (m(x) - m(y)) * (m(x) - m(y)))
   IF dd < d THEN d = dd: nr = y
  NEXT y
  IF POINT(n(nr), m(nr)) = 15 THEN getr = 1 ELSE getr = 0
  LINE (n(x), m(x))-(n(nr), m(nr))
  IF m(nr) > 477 OR getr = 1 THEN nr = anz
  x = nr - 1
 NEXT x
 FOR x = anz - z TO 2 + z STEP -1
  d = 100000: nr = 0
  FOR y = x - 1 TO 1 STEP -1
   dd = SQR((n(x) - n(y)) * (n(x) - n(y)) + (m(x) - m(y)) * (m(x) - m(y)))
   IF dd < d THEN d = dd: nr = y
  NEXT y
  IF POINT(n(nr), m(nr)) = 15 THEN getr = 1 ELSE getr = 0
  LINE (n(x), m(x))-(n(nr), m(nr))
  IF m(nr) < 2 OR getr = 1 THEN nr = 1
  x = nr + 1
 NEXT x
NEXT z

