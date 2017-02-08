
'Steuern mit <- -> schneller mit  langsamer mit  Ende mit "Strg" + "+"

INPUT "Radius (0-1) zB. .005"; rr
INPUT "Geschwindigkeit (0-1) zB. .5"; g
INPUT "Linienlaenge (0-50) zB. 15"; p
INPUT "Lenkschritte (3-32) zB. 16"; l

DIM aa(l), bb(l)
wi = 2 * 3.141593 / l
FOR i = 0 TO l
 aa(i) = COS(i * wi)
 bb(i) = SIN(i * wi)
NEXT i
x = 100: y = 100: a = g: b = 0: ll = 1

SCREEN 12
DO
 LINE (x, y)-STEP(-p * aa(ll), -p * bb(ll)), 8
 a = a * (1 - rr) + g * aa(ll) * rr: b = b * (1 - rr) + g * bb(ll) * rr
 x = x + a: y = y + b
 LINE (x, y)-STEP(-p * aa(ll), -p * bb(ll)), 15
 SELECT CASE INKEY$
  CASE CHR$(0) + "H": g = g * 1.25
  CASE CHR$(0) + "P": g = g * .8
  CASE CHR$(0) + "K"
   IF ll > 0 THEN ll = ll - 1 ELSE ll = l - 1
  CASE CHR$(0) + "M"
   IF ll < l - 1 THEN ll = ll + 1 ELSE ll = 0
  CASE "": END
  CASE ELSE
 END SELECT
LOOP

