
'Undurchsichtiger WÅrfel dreht sich (mit 1 Bild in 0,14 Sekunden)

DIM a(0) AS STRING * 1078
SCREEN 13
FOR x = 1 TO 254
 OUT &H3C8, x
 OUT &H3C9, (255 - x) / 4
 OUT &H3C9, (255 - x) / 4
 OUT &H3C9, (255 - x) / 4
 LINE (x, 0)-(x, 100), x
NEXT x
e = 200
p = 2 * 3.14159265359#
g = 50               'grî·e 50
DIM x(6, 4), y(6, 4), z(6, 4), r(6)
FOR i = 1 TO 6
 FOR t = 0 TO 4
  READ x(i, t), y(i, t), z(i, t)
  x(i, t) = x(i, t) * g
  y(i, t) = y(i, t) * g
  z(i, t) = z(i, t) * g
 NEXT t
NEXT i
xd = p * .015: yd = p * .025: zd = p' * .15
RANDOMIZE 1: FOR x = 1 TO 1000: LINE (INT(RND * 55), INT(RND * 200))-STEP(INT(RND * 5), INT(RND * 10)), INT(RND * 256), BF: NEXT x
FOR dre = 1 TO 35  'do
 a1 = SIN(xd): a2 = COS(xd)
 b1 = SIN(yd): b2 = COS(yd)
 c1 = SIN(zd): c2 = COS(zd)
 FOR i = 1 TO 6
  FOR t = 0 TO 4
   yy = y(i, t) * a2 - z(i, t) * a1
   zz = y(i, t) * a1 + z(i, t) * a2
   y(i, t) = yy: z(i, t) = zz
   xx = x(i, t) * b2 - z(i, t) * b1
   zz = x(i, t) * b1 + z(i, t) * b2
   x(i, t) = xx: z(i, t) = zz
   xx = x(i, t) * c2 - y(i, t) * c1
   yy = x(i, t) * c1 + y(i, t) * c2
   x(i, t) = xx: y(i, t) = yy
  NEXT t
 NEXT i
 FOR t = 1 TO 6
  r(t) = t
 NEXT t
 FOR t = 1 TO 6
  FOR i = t + 1 TO 6
   IF z(r(t), 0) < z(r(i), 0) THEN SWAP r(t), r(i)
  NEXT i
 NEXT t
 LINE (55, 0)-(319, 199), 254, BF
 FOR t = 4 TO 6           '1 to 6
  n = r(t)
  FOR aa = 0 TO 1 STEP (.2 / g)
   FOR bb = 0 TO 1 STEP (.2 / g)
    x1 = (x(n, 1) * aa + x(n, 2) * (1 - aa)) * bb + (x(n, 4) * aa + x(n, 3) * (1 - aa)) * (1 - bb)
    y1 = (y(n, 1) * aa + y(n, 2) * (1 - aa)) * bb + (y(n, 4) * aa + y(n, 3) * (1 - aa)) * (1 - bb)
    z1 = (z(n, 1) * aa + z(n, 2) * (1 - aa)) * bb + (z(n, 4) * aa + z(n, 3) * (1 - aa)) * (1 - bb)
    x2 = 160 + x1 / (z1 + e) * e
    y2 = 100 + y1 / (z1 + e) * e
    PSET (x2, y2), (z1 + g * 1.74) * 1.4
   NEXT bb
  NEXT aa
 NEXT t
 OPEN "d:\rafael\coding\basic\magimove\vor.bmp" FOR BINARY AS #1  'bildvorlage:320x200 24bit paint-bmp
 OPEN "d:\rafael\coding\basic\magimove\sw" + RIGHT$("0" + LTRIM$(STR$(dre)), 2) + ".bmp" FOR OUTPUT AS #2
 OPEN "d:\rafael\coding\basic\magimove\ma" + RIGHT$("0" + LTRIM$(STR$(dre)), 2) + ".bmp" FOR OUTPUT AS #3
 GET #1, 1, a(0)
 PRINT #2, a(0)
 PRINT #3, a(0)
 FOR y = 199 TO 0 STEP -1
  FOR x = 319 TO 0 STEP -1
   f$ = CHR$(255 - POINT(x, y))
   PRINT #2, f$;
  NEXT x
 NEXT y
 FOR y = 199 TO 0 STEP -1
  FOR x = 55 TO 319
   far = POINT(x - 55 + (255 - POINT(x, y)) / 20, y)
   PSET (x, y), far
  NEXT x
 NEXT y
 FOR y = 199 TO 0 STEP -1
  FOR x = 319 TO 0 STEP -1
   f$ = CHR$(255 - POINT(x, y))
   PRINT #3, f$;
  NEXT x
 NEXT y
 CLOSE
 BEEP
 IF INKEY$ <> "" THEN END
NEXT dre  'LOOP UNTIL INKEY$ = CHR$(27)



DATA  0, 0,-1,-1,-1,-1, 1,-1,-1, 1, 1,-1,-1, 1,-1
DATA  0, 0, 1,-1,-1, 1, 1,-1, 1, 1, 1, 1,-1, 1, 1
DATA  0,-1, 0,-1,-1,-1, 1,-1,-1, 1,-1, 1,-1,-1, 1
DATA  0, 1, 0,-1, 1,-1, 1, 1,-1, 1, 1, 1,-1, 1, 1
DATA -1, 0, 0,-1,-1,-1,-1,-1, 1,-1, 1, 1,-1, 1,-1
DATA  1, 0, 0, 1,-1,-1, 1,-1, 1, 1, 1, 1, 1, 1,-1

