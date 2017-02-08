
'Sich drehendes Kreuz

eck = 2000
DIM x(eck * 2), y(eck * 2)
win = 2 * 3.141593 / eck
FOR i = 0 TO eck - 1
  x(i) = COS(eck - i * win)
  y(i) = SIN(eck - i * win)
  x(i + eck) = x(i): y(i + eck) = y(i)
NEXT i
SCREEN 12
WINDOW (-320, -240)-(319, 239)
DO
  FOR q = 1 TO eck / 4
    FOR w = 0 TO 3
      re = w * eck / 4: gr = eck / 360
      LINE (x(q + re) * 42, y(q + re) * 42)-(x(gr * 34 + q + re) * 153, y(gr * 34 + q + re) * 153)
      LINE -(x(gr * 90 + q + re) * 212, y(gr * 90 + q + re) * 212)
      LINE -(x(gr * 104 + q + re) * 175, y(gr * 104 + q + re) * 175)
      LINE -(x(gr * 63 + q + re) * 95, y(gr * 63 + q + re) * 95)
      LINE -(x(gr * 90 + q + re) * 42, y(gr * 90 + q + re) * 42)
      'LINE (0, 0)-(x(q + re) * 230, y(q + re) * 230)                 'Tarnung
    NEXT w
    FOR w = 0 TO 3
      re = w * eck / 4: gr = eck / 360
      LINE (x(q + re) * 42, y(q + re) * 42)-(x(gr * 34 + q + re) * 153, y(gr * 34 + q + re) * 153), 0
      LINE -(x(gr * 90 + q + re) * 212, y(gr * 90 + q + re) * 212), 0
      LINE -(x(gr * 104 + q + re) * 175, y(gr * 104 + q + re) * 175), 0
      LINE -(x(gr * 63 + q + re) * 95, y(gr * 63 + q + re) * 95), 0
      LINE -(x(gr * 90 + q + re) * 42, y(gr * 90 + q + re) * 42), 0
      'LINE (0, 0)-(x(q + re) * 230, y(q + re) * 230), 0              'Tarnung
    NEXT w
    IF INKEY$ <> "" THEN END
  NEXT q
LOOP

