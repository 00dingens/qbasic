SCREEN 7, , 0, 1
w = 3.1415926535898# * 2 / 12012

DO
 FOR z = 0 TO 120120 STEP 20
  CLS
  ww = w * z
  FOR t = .1 TO 3.2 STEP .1
   CIRCLE (SIN(ww * t) * 95 + 160, COS(ww * t) * 95 + 100), 33 - t * 10, 7
  NEXT t
  PCOPY 0, 1
  IF INKEY$ <> "" THEN END
 NEXT z
LOOP WHILE INKEY$ = ""

