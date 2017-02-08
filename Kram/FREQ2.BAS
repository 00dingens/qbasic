OPEN "c:\rafael\test.wav" FOR OUTPUT AS #1
k1 = 0
k2 = 0
k3 = 0
z = 2 ^ (1 / 12)
FOR x = 1 TO 100000
 k1 = k1 + .2 * z ^ 0
 k2 = k2 + .2 * z ^ 4
 k3 = k3 + .2 * z ^ 7
 PRINT #1, CHR$(INT((SIN(k1) + SIN(k1) + SIN(k1) + SIN(k1 * 2)) * 31 + 128));
 LOCATE 1, 1: PRINT x
NEXT x
CLOSE

