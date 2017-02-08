WIDTH 80, 50
COLOR 15
PRINT "123456789"
PRINT "111213141"
PRINT "516171819"
anz = 31
maxy = 3
x = 1
y = 1
LOCATE y, x, 1
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": IF y > 1 THEN y = y - 1
 CASE CHR$(0) + "P": IF y < maxy THEN y = y + 1
 CASE CHR$(0) + "K": IF x > 1 THEN x = x - 1
 CASE CHR$(0) + "M": IF x < 11 THEN x = x + 1
 CASE CHR$(13):
  LOCATE y, x
  COLOR 4
  PRINT CHR$(SCREEN(y, x));
  xx = x: yy = y
  s = SCREEN(y, x)
  DO: r$ = INKEY$: LOOP WHILE r$ = ""
  SELECT CASE r$
  CASE CHR$(0) + "H":
  CASE CHR$(0) + "P":
  CASE CHR$(0) + "K":
  CASE CHR$(0) + "M":
   DO
    xx = xx + 1
    IF xx > 11 THEN yy = yy + 1: xx = 1
    ss = SCREEN(yy, xx)
   LOOP UNTIL (ss <> 176)
   IF VAL(CHR$(ss)) = VAL(CHR$(s)) THEN LOCATE y, x: PRINT "°": LOCATE yy, xx: PRINT "°": anz = anz - 2
  CASE CHR$(13): LOCATE y, x: COLOR 15: PRINT CHR$(SCREEN(y, x));
  END SELECT
 CASE CHR$(27): END
 END SELECT
 LOCATE y, x, 1
LOOP UNTIL anz = 0

