DEFDBL A-Z

SCREEN 12
LINE (0, 240)-(640, 240)
LINE (320, 0)-(320, 480)
FOR z = -6.4 TO 6.4 STEP .02
'y = SIN(z) - z / 4 - .25
y = z * z'COS(z) - 1 + z * z
PSET (z * 50 + 320, 240 - y * 100)
NEXT z
INPUT x
FOR z = 1 TO 27
 'x1 = SIN(x) - x / 4 - .25
 'x2 = COS(x) - .25
 x1 = x * x'COS(x) - 1 + x * x
 x2 = 2 * x'-SIN(x) + 2 * x
  x = x - x1 / x2
 PRINT x1, x2, x
NEXT z

