ON ERROR GOTO er
DIM z(2) AS INTEGER               'Bildgrîsse
DIM i(1) AS STRING * 3            'Punktwert
DIM f(-70 TO 70, -70 TO 70) AS STRING * 3     'Bildchenpunkte

test = 0                   'wenn 0 dann in datei

r = 0                      'replace f. bildchen
rp = 0                     'replace f. bild
rund = 0                   'wenn 1 dann ist das bild Åberkopf das selbe
zerr = 90                  'grî·enangepasst wenn nicht 0 (zerrfaktor)
bch = 32                   'bildchen pro kreis
ra = .4                    'ringabstand. ca. .3-.8 ist ok. anders geht auch
dreh = .5                  'drehung des kreises rel. zum vorigen (in bildchen)


OPEN "c:\windows\desktop\fanta.bmp" FOR BINARY AS #1   'bild 140x140 mitte: 50
GET #1, 19, z(0)
GET #1, 23, z(1)
SCREEN 13
COLOR 250
FOR x = 1 TO 255
 OUT &H3C8, x
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
 OUT &H3C9, INT(x / 4)
NEXT x
FOR y = 0 TO z(1)
 FOR x = 1 TO z(0)
  GET #1, 55 + 3 * y * z(0) + y * r + 3 * x, i(0)
  IF x < 141 AND y < 141 THEN f(x - 70, y - 70) = i(0)          '141 wg <
  PSET (x, z(1) - y), INT((ASC(MID$(i(0), 3, 1)) + ASC(MID$(i(0), 2, 1)) + ASC(MID$(i(0), 1, 1))) / 3)
 NEXT x
NEXT y
CLOSE

OPEN "c:\windows\desktop\fantasy.bmp" FOR BINARY AS #1
GET #1, 19, z(0)
GET #1, 23, z(1)
IF test <> 0 THEN CLOSE
xg = z(0): yg = z(1)                          'bildgrîsse
IF test <> 0 THEN
IF xg > 320 THEN yg = 320 * yg / xg: xg = 320
IF yg > 200 THEN xg = 200 * xg / yg: yg = 200
END IF
xm = INT(xg / 2): ym = INT(yg / 2)            'bildmitte
p = 3.141592 * 2 / bch
FOR y = 0 TO yg - 1
 FOR x = 1 TO xg
  xx = x - xm: yy = y - ym
  'welcher punkt am nÑchsten?
  z = SQR(xm * xm + ym * ym) * (1 + ra * 2)   'startradius
  r = SQR(xx * xx + yy * yy)
  dre = .0001
  IF r < 1 THEN r = 1
  DO UNTIL z - p * z * ra < r: dre = dre + dreh: z = z - p * z * ra: LOOP
  dre = dre - INT(dre)
  'kreis A   punkte V
  ar = 1000000
  FOR qq = 1 TO 2
   FOR t = dre TO bch + dre
    IF (xx - SIN(t * p) * z) ^ 2 + (yy - COS(t * p) * z) ^ 2 < ar THEN
     xp = xm + SIN(t * p) * z
     yp = ym + COS(t * p) * z
     ar = (xx - SIN(t * p) * z) ^ 2 + (yy - COS(t * p) * z) ^ 2
     rch = z      'radius zum nÑchsten punkt
     wink = t     'winkel des nÑchsten punktes
    END IF
   NEXT t
   z = z - p * z * ra
   dre = dre + dreh
   dre = dre - INT(dre)
  NEXT qq
  'xp,yp ist der nÑchste punkt
  a = x - xp: b = y - yp
  'a,b = rel. koord. zu next pkt
  IF rund = 1 THEN
   wink = wink * p + 3.14159265# / 2 * 3
   aneu = SIN(wink) * a + COS(wink) * b
   bneu = -SIN(wink) * b + COS(wink) * a
   a = aneu
   b = bneu
  END IF
  IF zerr <> 0 AND a <> 0 AND b <> 0 THEN a = INT(a * zerr / (p * rch * ra)): b = INT(b * zerr / (p * rch * ra))
  i(0) = CHR$(255) + CHR$(255) + CHR$(255)
  IF ABS(a) < 70 AND ABS(b) < 70 AND (xx <> 0 OR yy <> 0) THEN i(0) = f(a, b)
'  i(0) = f(a, b)
  PSET (x, 200 - y), INT((ASC(MID$(i(0), 3, 1)) + ASC(MID$(i(0), 2, 1)) + ASC(MID$(i(0), 1, 1))) / 3)
  'PSET (x, 200 - y), xp * yp' INT(255 - SQR(a * a + b * b) * 3)
  'PSET (xp, 200 - yp), 0
  IF test = 0 THEN PUT #1, 55 + 3 * y * xg + y * rp + 3 * x, i(0)
weiter:
 NEXT x
 IF test = 0 THEN LOCATE 1, 1: PRINT y * 100 / yg; "% ("; y; "von"; yg; ")"
NEXT y
IF test = 0 THEN CLOSE

DO: LOOP WHILE INKEY$ = ""

END
er: i(0) = CHR$(255) + CHR$(255) + CHR$(255): RESUME NEXT

