
'bilderr„tsel fr philipp (+tim)

DIM z(2) AS INTEGER, i(0) AS STRING * 3, st(1000) AS INTEGER
test:
SCREEN 13
PRINT "Bewegung:   \->| -1   /->| +1"
INPUT "Replacement (zahl von 0 bis 3)?"; r
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
GET #1, 19, z(1)
GET #1, 23, z(2)
FOR y = z(2) TO 0 STEP -1
 FOR x = 0 TO z(1)
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * r, i(0)
  cc = INT((ASC(MID$(i(0), 1, 1)) + ASC(MID$(i(0), 2, 1)) + ASC(MID$(i(0), 3, 1))) / 384)
  PSET (x, 200 - y), cc * 15
 NEXT x
NEXT y
CLOSE
INPUT "War das Bild gerade und streifenfrei (j/n)?", jn$
IF jn$ = "n" THEN GOTO test
IF z(1) > 210 OR z(2) > 160 THEN PRINT "bild zu groá (max. 210x160)": END
DO: INPUT "K„stchengr”áe"; kg: PRINT "mindestens 3, und maximal so groá, dass das bild auf den schirm passt": LOOP UNTIL kg > 2 AND kg * z(1) < 640 AND kg * z(2) < 480 AND kg MOD 2 = 1
SCREEN 12
CLS
LINE (0, 0)-(kg, kg), 15, BF
GET (0, 0)-(kg - 1, kg - 1), st(0)
CLS
xx = z(1) - 1: yy = z(2) - 1
OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
FOR y = z(2) TO 0 STEP -1
 FOR x = 0 TO z(1)
  GET #1, x * 3 + y * z(1) * 3 + 55 + y * r, i(0)
  cc = INT((ASC(MID$(i(0), 1, 1)) + ASC(MID$(i(0), 2, 1)) + ASC(MID$(i(0), 3, 1))) / 384)
  LINE (x * kg, yy * kg - y * kg)-STEP(kg - 1, kg - 1), cc * 7, BF
 NEXT x
NEXT y
CLOSE
x = INT(xx / 2): y = INT(yy / 2)
DO
 PUT (x * kg, y * kg), st(0), XOR
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 PUT (x * kg, y * kg), st(0), XOR
 SELECT CASE t$
 CASE CHR$(27): GOTO ende
 CASE CHR$(0) + "H"
  IF y > 0 THEN y = y - 1
  IF pin = 1 AND POINT(xm, ym - kg) <> 0 THEN y = y + 1
 CASE CHR$(0) + "P"
  IF y < yy THEN y = y + 1
  IF pin = 1 AND POINT(xm, ym + kg) <> 0 THEN y = y - 1
 CASE CHR$(0) + "K"
  IF x > 0 THEN x = x - 1
  IF pin = 1 AND POINT(xm - kg, ym) <> 0 THEN x = x + 1
 CASE CHR$(0) + "M"
  IF x < xx THEN x = x + 1
  IF pin = 1 AND POINT(xm + kg, ym) <> 0 THEN x = x - 1
 CASE CHR$(13): IF POINT(xm, ym) = 0 OR (POINT(xm, ym) = 15 AND pin = 1) THEN pin = pin XOR 1: LOCATE 1, 76: PRINT "    "'pinsel ein oder aus
 CASE CHR$(0) + "S": IF POINT(xm, ym) = 15 THEN pin = 0: PAINT (xm, ym), 0, 0                'Entf
 CASE ELSE
 END SELECT
 xm = x * kg + INT(kg / 2): ym = y * kg + INT(kg / 2)
 'weitermalen
 IF pin = 1 THEN
  IF POINT(xm, ym) = 0 THEN
   PSET (xm, ym)
   SELECT CASE t$
   CASE CHR$(0) + "H": zz = zz + 1: LINE -STEP(0, kg), 15
   CASE CHR$(0) + "P": zz = zz + 1: LINE -STEP(0, -kg), 15
   CASE CHR$(0) + "K": zz = zz + 1: LINE -STEP(kg, 0), 15
   CASE CHR$(0) + "M": zz = zz + 1: LINE -STEP(-kg, 0), 15
   CASE CHR$(13): zz = 1
   END SELECT
   LOCATE 1, 76: PRINT zz
  END IF
 END IF
 'l„nge testen
 LOCATE 2, 76: PRINT "    "
 xt = xm: yt = ym
 IF POINT(xt, yt) = 15 THEN
  'eine richtung w„hlen
  di = 0
  IF POINT(xt + 1, yt) = 15 THEN di = 1
  IF POINT(xt, yt + 1) = 15 THEN di = 2
  IF POINT(xt - 1, yt) = 15 THEN di = 3
  IF POINT(xt, yt - 1) = 15 THEN di = 4
  'zu einem ende gehen
  DO
   SELECT CASE di
   CASE 1: xt = xt + kg
   CASE 2: yt = yt + kg
   CASE 3: xt = xt - kg
   CASE 4: yt = yt - kg
   CASE ELSE:
   END SELECT
   IF di <> 0 THEN dr = (di + 1) MOD 4 + 1 ELSE dr = 0
   di = 0
   IF POINT(xt + 1, yt) = 15 AND dr <> 1 THEN di = 1
   IF POINT(xt, yt + 1) = 15 AND dr <> 2 THEN di = 2
   IF POINT(xt - 1, yt) = 15 AND dr <> 3 THEN di = 3
   IF POINT(xt, yt - 1) = 15 AND dr <> 4 THEN di = 4
  LOOP UNTIL di = 0
  'zum anderen ende gehen
  zzz = 1
  di = dr
  IF di = 0 THEN zzz = 0
  DO
   zzz = zzz + 1
   SELECT CASE di
   CASE 1: xt = xt + kg
   CASE 2: yt = yt + kg
   CASE 3: xt = xt - kg
   CASE 4: yt = yt - kg
   CASE ELSE
   END SELECT
   dr = (di + 1) MOD 4 + 1: di = 0
   IF POINT(xt + 1, yt) = 15 AND dr <> 1 THEN di = 1
   IF POINT(xt, yt + 1) = 15 AND dr <> 2 THEN di = 2
   IF POINT(xt - 1, yt) = 15 AND dr <> 3 THEN di = 3
   IF POINT(xt, yt - 1) = 15 AND dr <> 4 THEN di = 4
  LOOP UNTIL di = 0
  LOCATE 2, 76: PRINT zzz
 END IF
LOOP
ende:
OPEN "c:\windows\desktop\muster.txt" FOR OUTPUT AS #1
PRINT #1, " +";
FOR x = 0 TO xx: PRINT #1, "---+"; : NEXT x
PRINT #1, ""
FOR y = 0 TO yy
 FOR x = 0 TO xx
  xm = x * kg + INT(kg / 2): ym = y * kg + INT(kg / 2)
  ver = POINT(xm + 1, ym) + POINT(xm, ym + 1) + POINT(xm - 1, ym) + POINT(xm, ym - 1)
  zahl$ = "  "
  IF ver = 15 OR (ver = 0 AND POINT(xm, ym) = 15) THEN
   xt = xm: yt = ym
   'richtung finden
   di = 0
   IF POINT(xt + 1, yt) = 15 THEN di = 1
   IF POINT(xt, yt + 1) = 15 THEN di = 2
   IF POINT(xt - 1, yt) = 15 THEN di = 3
   IF POINT(xt, yt - 1) = 15 THEN di = 4
   'zum anderen ende gehen
   zzz = 1
   IF di = 0 THEN zzz = 0
   DO
    zzz = zzz + 1
    SELECT CASE di
    CASE 1: xt = xt + kg
    CASE 2: yt = yt + kg
    CASE 3: xt = xt - kg
    CASE 4: yt = yt - kg
    END SELECT
    dr = (di + 1) MOD 4 + 1: di = 0
    IF POINT(xt + 1, yt) = 15 AND dr <> 1 THEN di = 1
    IF POINT(xt, yt + 1) = 15 AND dr <> 2 THEN di = 2
    IF POINT(xt - 1, yt) = 15 AND dr <> 3 THEN di = 3
    IF POINT(xt, yt - 1) = 15 AND dr <> 4 THEN di = 4
   LOOP UNTIL di = 0
   zahl$ = RIGHT$(" " + LTRIM$(STR$(zzz)), 2)
  END IF
  PRINT #1, " |"; zahl$;
 NEXT x
 PRINT #1, " |"
 PRINT #1, " +";
 FOR x = 0 TO xx: PRINT #1, "---+"; : NEXT x
 PRINT #1, ""
NEXT y
CLOSE

