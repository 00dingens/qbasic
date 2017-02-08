DIM y(100, 2)
s = SQR(555 + 5 / 9) / (66 + 2 / 3)
gen = 240
jedes = 2
p = 3.141592 * 2 / gen

FOR x = 0 TO 33
 y(x, 1) = SQR(625 - (25 - x) ^ 2)
 y(x, 2) = x * s
NEXT x
FOR x = 34 TO 66
 y(x, 1) = (100 - x) * s
 y(x, 2) = x * s
NEXT x
FOR x = 67 TO 100
 y(x, 1) = (100 - x) * s
 y(x, 2) = SQR(625 - (x - 75) ^ 2)
NEXT x
SCREEN 9, , 1, 0
FOR s = 0 TO 3
 DO
  FOR q = 0 TO gen / 2 - 1
   LINE (0, 0)-(639, 349), , B
   FOR z = 0 TO 100 STEP jedes
    n = SIN(q * p) * 4: m = COS(q * p) * 4
    x1 = n * y(z, 1): y1 = m * y(z, 1)
    x2 = m * y(z, 2): y2 = -n * y(z, 2)
    t = 30 + z * 3
    IF s = 2 OR s = 3 THEN
     LINE (150 + t + x1, t + y1)-(150 + t + x2, t + y2)
     LINE (150 + t + x1, t + y1)-(150 + t + -x2, t + -y2)
     LINE (150 + t + -x1, t + -y1)-(150 + t + x2, t + y2)
     LINE (150 + t + -x1, t + -y1)-(150 + t + -x2, t + -y2)
    END IF
    IF s = 0 THEN
     LINE (150 + t + x1, t + y1)-(150 + t + -x1, t + -y1)
    END IF
    IF s = 1 OR s = 3 THEN
     LINE (150 + t + x1, t + y1)-(150 + t + -x1, t + -y1)
     LINE (150 + t + x2, t + y2)-(150 + t + -x2, t + -y2)
    END IF
   NEXT z
   PCOPY 1, 0
   CLS
  NEXT q
 LOOP WHILE INKEY$ = ""
NEXT s

