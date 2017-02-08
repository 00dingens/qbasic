
'Dies Programm spiegelt eine Gerade (grÅn) an einer Parabel (lila)
'und malt das Spiegelbild rot

SCREEN 12
g = 8        '8 Probiere auch die Werte 3.2, 32 und 80
             'Ma·stab: 1:g
gen = .0001           'Die Genauigkeit. Je kleiner die Zahl, desto mehr Punkte.
WINDOW (-g * 2, -g * 1.5)-(g * 2, g * 1.5)
LINE (0, g * 2)-(0, -g * 2), 8
LINE (g * 2, 0)-(-g * 2, 0), 8
FOR x = 1 TO g * 2
 k = .5
 IF x MOD 5 = 0 THEN k = 1
 IF x MOD 10 = 0 THEN k = 2
 IF x MOD 50 = 0 THEN k = 5
 LINE (x, k)-(x, -k), 8
 LINE (-x, k)-(-x, -k), 8
 LINE (k, x)-(-k, x), 8
 LINE (k, -x)-(-k, -x), 8
NEXT x
FOR a = -8 TO 8 STEP gen
 s = a * 2
 b = a ^ 2
 PSET (a, b), 5
 s = -.5 / a
 x = (s * a - b) / (s - 1)
 PSET (x, x), 2
 n = 2 * a - x
 m = 2 * b - x
 PSET (n, m), 4
NEXT a
END

