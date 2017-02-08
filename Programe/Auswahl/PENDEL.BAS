
'Mehrere Pendel aneinander. Ende mit Strg + "+"

GOSUB eingaben
GOSUB rechnen
GOSUB malen
END

eingaben:
SCREEN 12
DO
INPUT "Wieviele Pendelglieder (1 - ca. 20)"; a
LOOP UNTIL a > 0 AND a < 26
h = INT(5000 / a) - 3 * a
DIM rx(a), ry(a), lx(a), ly(a), px(a), py(a)
CLS
PRINT "       Weite:(3-200)     L„nge:(10-2000)   Position:(0-L„nge)"
PRINT "  Nr.    x       y         x       y         x       y"
FOR z = 1 TO a
 LOCATE z + 3, 3: PRINT z
 LOCATE z + 3, 10: INPUT "", rx(z)
 LOCATE z + 3, 18: INPUT "", ry(z)
 LOCATE z + 3, 28: INPUT "", lx(z)
 LOCATE z + 3, 36: INPUT "", ly(z)
 LOCATE z + 3, 46: INPUT "", px(z)
 LOCATE z + 3, 54: INPUT "", py(z)
NEXT z
PRINT : PRINT : PRINT
INPUT "Kreis, Linie oder Punkt (k, l, p)"; kp$
INPUT "Spur weiá, grau oder keine (w, g, k)"; s$
INPUT "Schnell oder langsam (s, l)"; speed$
IF s$ = "w" THEN s = 15
IF s$ = "g" THEN s = 8
RETURN

rechnen:
DIM x(a, h), y(a, h)
FOR z = 1 TO a
 winx = 2 * 3.141593 / lx(z): winy = 2 * 3.141593 / ly(z)
 FOR i = 0 TO lx(z)
  x(z, i) = rx(z) * COS(i * winx)
'''  PSET (i + 100, x(z, i) + 100)
 NEXT i
 FOR i = 0 TO ly(z)
  y(z, i) = ry(z) * COS(i * winy)
'''  PSET (i + 100, y(z, i) + 200)
 NEXT i
NEXT z
RETURN

malen:
CLS
FOR z = 1 TO a
 nn = nn + x(z, px(z))
 mm = mm + y(z, py(z))
NEXT z
PSET (320 + nn, 240 + mm)
DO
 n = nn: m = mm: nn = 0: mm = 0
 FOR z = 1 TO a
  nn = nn + x(z, px(z))
  mm = mm + y(z, py(z))
 NEXT z

 SELECT CASE kp$
 CASE "l"
  LINE -(320 + nn, 240 + mm), s
 CASE "k"
  CIRCLE (320 + n, 240 + m), 2, s
  CIRCLE (320 + nn, 240 + mm), 2
 CASE ELSE
  PSET (320 + n, 240 + m), s
  PSET (320 + nn, 240 + mm)
 END SELECT

 FOR z = 1 TO a
  px(z) = px(z) + 1
  IF px(z) > lx(z) THEN px(z) = 1
  py(z) = py(z) + 1
  IF py(z) > ly(z) THEN py(z) = 1
 NEXT z
 IF speed$ = "l" THEN FOR t = 1 TO 1000: NEXT t
LOOP UNTIL INKEY$ = ""
RETURN

