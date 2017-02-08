RESTORE Punkte
READ p
DIM x(p), y(p), z(p), xx(p), yy(p)
RESTORE Linien
READ l
DIM n(l), m(l), c(l)
pi = 3.14159265358979#
w = pi / 180
dd = 5
e = 200    'Entfernung des Beobachters vom Bildschirm in Pixeln
SCREEN 12
GOSUB Einlesen
GOSUB EineRunde
GOSUB Einlesen
GOSUB mal
GOSUB VonHand
END

Einlesen:
RESTORE Punkte
READ p
FOR t = 1 TO p
 READ x(t), y(t), z(t)
NEXT t
RESTORE Linien
READ l
FOR t = 1 TO l
 READ n(t), m(t), c(t)
NEXT t
RETURN

EineRunde:
DO: LOOP WHILE INKEY$ = ""
FOR q = 1 TO 320
 xd = 0: yd = .5: zd = 1
 GOSUB dre
 GOSUB mal
NEXT q
RETURN

dre:
xd = xd * w: yd = yd * w: zd = zd * w
FOR t = 1 TO p
 IF xd <> 0 THEN
  yy = y(t) * COS(xd) - z(t) * SIN(xd)
  zz = y(t) * SIN(xd) + z(t) * COS(xd)
  y(t) = yy: z(t) = zz
 END IF
 IF yd <> 0 THEN
  xx = x(t) * COS(yd) - z(t) * SIN(yd)
  zz = x(t) * SIN(yd) + z(t) * COS(yd)
  x(t) = xx: z(t) = zz
 END IF
 IF zd <> 0 THEN
  xx = x(t) * COS(zd) - y(t) * SIN(zd)
  yy = x(t) * SIN(zd) + y(t) * COS(zd)
  x(t) = xx: y(t) = yy
 END IF
NEXT t
xd = 0: yd = 0: zd = 0
RETURN

VonHand:
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE "1": yd = 360 - dd
 CASE "2": xd = 360 - dd
 CASE "3": yd = dd
 CASE "4": zd = 360 - dd
 CASE "5": xd = dd
 CASE "6": zd = dd
 CASE CHR$(0) + "I": IF dd < 90 THEN dd = dd + 1
 CASE CHR$(0) + "Q": IF dd > 1 THEN dd = dd - 1
 CASE CHR$(27): END
 CASE ELSE: ww = 1: BEEP
 END SELECT
 GOSUB dre
 GOSUB mal
LOOP
RETURN

mal:
IF ww = 1 THEN PRINT "Drehe das Objekt mit 1,2,3,4,5,6 Drehwinkel„ndern mit PgUp,PgDn": PRINT "Ende mit Esc.": ww = 0
FOR t = 1 TO l
 LINE (xx(n(t)), yy(n(t)))-(xx(m(t)), yy(m(t))), 0
NEXT t
FOR t = 1 TO p
 xx(t) = 320 + x(t) / (z(t) + e) * e
 yy(t) = 240 + y(t) / (z(t) + e) * e
NEXT t
FOR t = 1 TO l
 LINE (xx(n(t)), yy(n(t)))-(xx(m(t)), yy(m(t))), c(t)
NEXT t
RETURN

Punkte:
DATA 10
DATA -50, 50,-50
DATA  50, 50,-50
DATA -50, 50, 50
DATA  50, 50, 50
DATA -50,-10,-50
DATA  50,-10,-50
DATA -50,-10, 50
DATA  50,-10, 50
DATA   0,-50,-50
DATA   0,-50, 50

Linien:
DATA 17
DATA  1, 2, 1
DATA  1, 3, 1
DATA  2, 4, 1
DATA  3, 4, 1
DATA  5, 6, 2
DATA  5, 7, 2
DATA  6, 8, 2
DATA  7, 8, 2
DATA  1, 5, 3
DATA  2, 6, 3
DATA  3, 7, 3
DATA  4, 8, 3
DATA  5, 9, 4
DATA  6, 9, 4
DATA  7,10, 4
DATA  8,10, 4
DATA  9,10, 4

