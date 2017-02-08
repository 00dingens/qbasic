SCREEN 9, , 0, 1
a = 320: b = 175
DO
 a = a + RND * 4 - 2
 b = b + RND * 4 - 2

 CLS
 LINE (50, 50)-(590, 300), 8, B, &HFF18
 CIRCLE (a, b), 10, 12, 1, 3, 1
 CIRCLE (a, b), 10, 12, 4.5, 6, 1
 LINE (a + 10, b)-(a + 100, b), 4
 LINE (a - 10, b)-(a - 100, b), 4
 LINE (a, b - 100)-(a, b - 10), 4
 LINE (a, b + 100)-(a, b + 10), 4
 PCOPY 0, 1
 DO
  SELECT CASE INKEY$
  CASE CHR$(0) + "H": b = b - 20
  CASE CHR$(0) + "P": b = b + 20
  CASE CHR$(0) + "K": a = a - 20
  CASE CHR$(0) + "M": a = a + 20
  CASE CHR$(27): END
  CASE "": EXIT DO
  CASE ELSE
  END SELECT
 LOOP
 IF a < 60 THEN a = 60
 IF b < 60 THEN b = 60
 IF a > 580 THEN a = 580
 IF b > 290 THEN b = 290
LOOP

