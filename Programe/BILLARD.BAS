DIM x(1000), y(1000), r(1000), a(1000), b(1000), c(1000)
p = 3.14159265#
anz = 10
SCREEN 12'    9, , 0, 1        '12
hhh = 480
FOR i = 1 TO anz
 r(i) = 20
 x(i) = INT(RND * (640 - 2 * r(i)) + r(i))
 y(i) = INT(RND * (hhh - 2 * r(i)) + r(i))
 a(i) = RND - .5
 b(i) = RND - .5
 c(i) = INT(RND * 15 + 1)
 er = 0
 FOR o = 1 TO i - 1
  IF (r(i) + r(o)) ^ 2 > (x(i) - x(o)) ^ 2 + (y(i) - y(o)) ^ 2 THEN er = -1
 NEXT o
 IF er = -1 THEN i = i - 1
NEXT i
DO
 'CLS
 FOR i = 1 TO anz
  CIRCLE (x(i), y(i)), r(i), 0
  'PAINT (x(i), y(i)), 0, 0
  IF x(i) + a(i) + r(i) > 640 OR x(i) + a(i) < r(i) THEN a(i) = -a(i)
  IF y(i) + b(i) + r(i) > hhh OR y(i) + b(i) < r(i) THEN b(i) = -b(i)
  x(i) = x(i) + a(i)
  y(i) = y(i) + b(i)
  PSET (x(i), y(i)), c(i)
  CIRCLE (x(i), y(i)), r(i), c(i)
  'PAINT STEP(0, 0), c(i), c(i)
  FOR o = 1 TO anz
   IF i <> o AND (r(i) + r(o)) ^ 2 > (x(i) - x(o)) ^ 2 + (y(i) - y(o)) ^ 2 THEN
    wio = ATN((x(o) - x(i)) / (y(o) - y(i)))       'winkel zwischen i und o
    ws = wio + p * .5                             'winkelsenkrechte
    wi = ATN(a(i) / b(i)) + p                      'winkel der i bewegung
    wo = ATN(a(o) / b(o)) + p                      'winkel der o bewegung
    si = SQR(a(i) ^ 2 + b(i) ^ 2)                  'geschwindigkeit i
    so = SQR(a(o) ^ 2 + b(o) ^ 2)                  'geschwindigkeit o
    ai = SIN(ws - wi) * si
    bi = COS(ws - wi) * si
    ao = SIN(ws - wo) * so
    bo = COS(ws - wo) * so
    a(i) = SIN(ws) * ai + SIN(wio) * bo
    b(i) = COS(ws) * ai + COS(wio) * bo
    a(o) = SIN(ws) * ao - SIN(wio) * bi
    b(o) = COS(ws) * ao - COS(wio) * bi
    x(i) = x(i) + a(i)
    y(i) = y(i) + b(i)
    x(o) = x(o) + a(o)
    y(o) = y(o) + b(o)
    CIRCLE (x(i), y(i)), 4, 12
    'LINE (x(i), y(i))-STEP(SIN(ws) * 30 * bi, COS(ws) * 30 * bi), 1
    'LINE -STEP(SIN(wio) * 30 * ai, COS(wio) * 30 * ai), 2
    'LINE (x(i), y(i))-STEP(SIN(wi) * 30, COS(wi) * 30), 3    'bewegung i
    'LINE (x(o), y(o))-STEP(SIN(wo) * 10, COS(wo) * 10), 11    'bewegung o
    'LINE (x(o), y(o))-STEP(SIN(wio) * 30, COS(wio) * 30), 15 'mittelpunkte
    'DO: LOOP WHILE INKEY$ = ""
   END IF
  NEXT o
 NEXT i
 'PCOPY 0, 1
LOOP WHILE INKEY$ = ""

