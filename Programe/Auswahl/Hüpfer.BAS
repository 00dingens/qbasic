
'Hpfender Gegenstand

x = 950: z = 20: k = -z
SCREEN 12
WINDOW (1, 1)-(640, 960)
DO: k = k + z * 2
z = z - (z / 20)
FOR i = -z TO z STEP .1
x = x + (i * .2)
PSET (i + k, 970 - x)
NEXT i
LOOP UNTIL k > 700

