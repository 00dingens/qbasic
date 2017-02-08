'fertig
'man malt bild und dabei wird berechnet, wie das
'geflochten wrde (pro faden eine farbe)

x = 15: y = 15
siz = 1
onof = 1
SCREEN 13
PSET (x, y), 11

DO
 DO
  t$ = INKEY$
 LOOP WHILE t$ = ""
 PSET (x, y), POINT(x, y) XOR 4

 SELECT CASE t$
 CASE CHR$(0) + "K": IF x > 3 THEN x = x - 1
 CASE CHR$(0) + "M": IF x < 47 THEN x = x + 1
 CASE CHR$(0) + "H": IF y > 3 THEN y = y - 1
 CASE CHR$(0) + "P": IF y < 47 THEN y = y + 1

 CASE "0": siz = 0
 CASE "1": siz = 1
 CASE "3": siz = 3
 CASE "5": siz = 5

 CASE " ": onof = 1 - onof

 CASE CHR$(13):
 CASE CHR$(27): END
 CASE ELSE: LOCATE 17, 2: PRINT "Pfeile, 0135, leer, enter, esc=ende"
 END SELECT

 'malen
 IF siz > 0 THEN
  LINE (x - INT(siz / 2), y - INT(siz / 2))-STEP(siz - 1, siz - 1), 15 * onof, BF
 END IF

  'kopieren
  col = 0
  FOR xx = 0 TO 50
   FOR yy = 0 TO 50
    LINE (xx * 4 + 70, yy * 4)-STEP(3, 3), POINT(xx, yy), BF
   NEXT yy
  NEXT xx
  'flechten
  FOR xx = 0 TO 50
   FOR yy = 0 TO 50
    IF POINT(xx * 4 + 71, yy * 4) = 15 THEN
     xp = xx * 4 + 71
     yp = yy * 4
     xd = 1
     yd = -1
     col = (col MOD 14) + 1
     DO
      PSET (xp, yp), col
      IF POINT(xp + xd, yp + yd) = 0 THEN
       IF POINT(xp, yp + yd) = 0 THEN yp = yp + yd: yd = -yd ELSE xp = xp + xd: xd = -xd
      END IF
      xp = xp + xd
      yp = yp + yd
     LOOP UNTIL POINT(xp, yp) = col
    END IF
   NEXT yy
  NEXT xx

 PSET (x, y), POINT(x, y) XOR 4
 LOCATE 15, 2: PRINT "onof = "; onof
 LOCATE 16, 2: PRINT "siz = "; siz
LOOP

