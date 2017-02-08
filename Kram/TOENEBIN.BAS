SCREEN 12
PLAY "l32o3"
FOR y = 0 TO 1023
 x = y
 a$ = ""
 FOR t = 0 TO 9
  c = x MOD 2
  x = INT(x / 2)
  a$ = CHR$(67 + c) + a$
  PSET (n, m), c * 15
  n = n + 1
  IF n = 640 THEN n = 0: m = m + 1
 NEXT t
 LOCATE 1, 1
 PRINT a$
 PLAY a$
 IF INKEY$ <> "" THEN END
NEXT y

