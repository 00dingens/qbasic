
'Steuern mit Pfeilen Ende mit "Strg" + "+"

INPUT "Radius (0-1) zB. .01"; rr
INPUT "Geschwindigkeit (0-1) zB. .2"; g
INPUT "Punktgroesse (0-50) zB. 4"; p
SCREEN 12
x = 100: y = 100: a = g: b = g: ra = g: rb = 0
DO
 CIRCLE (x, y), p, 8
 a = a * (1 - rr) + ra * rr: b = b * (1 - rr) + rb * rr
 x = x + a: y = y + b
 CIRCLE (x, y), p, 15
 SELECT CASE INKEY$
  CASE CHR$(0) + "H": ra = 0: rb = -g
  CASE CHR$(0) + "P": ra = 0: rb = g
  CASE CHR$(0) + "K": ra = -g: rb = 0
  CASE CHR$(0) + "M": ra = g: rb = 0
  CASE "": END
 END SELECT
LOOP

