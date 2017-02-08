SCREEN 12
PRINT "    Formel: y = ax + b"
INPUT "a eingeben: ", a
INPUT "b eingeben: ", b
CLS
g = b * SGN(b)
IF g < (-b / a) * SGN(-b / a) THEN g = (-b / a) * SGN(-b / a)
WINDOW (-g * 2, -g * 1.5)-(g * 2, g * 1.5)
LINE (0, g * 2)-(0, -g * 2), 8
LINE (g * 2, 0)-(-g * 2, 0), 8
FOR x = 1 TO g * 2
 k = .5
 IF x MOD 5 = 0 THEN k = 1
 IF x MOD 10 = 0 THEN k = 2
 IF x MOD 50 = 0 THEN k = 5
 IF x MOD 100 = 0 THEN k = 10
 IF x MOD 500 = 0 THEN k = 50
 IF x MOD 1000 = 0 THEN k = 100
 LINE (x, k)-(x, -k), 8
 LINE (-x, k)-(-x, -k), 8
 LINE (k, x)-(-k, x), 8
 LINE (k, -x)-(-k, -x), 8
NEXT x
LINE (-g * 2, a * -g * 2 + b)-(g * 2, a * g * 2 + b)

