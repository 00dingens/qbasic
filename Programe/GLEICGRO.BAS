q = 20
w = 2 * 3.14159265# / q
DIM a(q), b(q)
FOR x = 0 TO q
 a(x) = 50 * SIN(x * w)
 b(x) = 50 * COS(x * w)
NEXT x
SCREEN 12
PSET (320 + a(0), 240 + b(0))
FOR x = 1 TO q
 LINE -STEP(a(x), b(x))
NEXT x

