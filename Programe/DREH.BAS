SCREEN 7, , 0, 1
DIM x(3000), y(3000)
w = 3.14159265# * 2 / 2310
FOR z = 0 TO 2309
 x(z) = SIN(z * w) * 95 + 160
 y(z) = COS(z * w) * 95 + 100
NEXT z

DO
 FOR z = 0 TO 2310 STEP 1
  CLS
  FOR t = 1 TO 12
   CIRCLE (x(INT(z * t MOD 2310)), y(INT(z * t MOD 2310))), 13 - t, t
   PAINT STEP(0, 0), t, t
  NEXT t
  PCOPY 0, 1
  IF INKEY$ <> "" THEN END
 NEXT z
LOOP WHILE INKEY$ = ""

