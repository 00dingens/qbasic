
'3D-Bild zum schielen

SCREEN 12
FOR q = 0 TO 6
 READ x, y, z
 x1 = (10 + x + z * .4): y1 = (270 + y - z * .5)
 READ x, y, z
 x2 = (10 + x + z * .4): y2 = (270 + y - z * .5)
 LINE (x1, y1)-(x2, y2), 15
 READ x, y, z
 x1 = (330 + x + z * .25): y1 = (270 + y - z * .5)
 READ x, y, z
 x2 = (330 + x + z * .25): y2 = (270 + y - z * .5)
 LINE (x1, y1)-(x2, y2), 15
NEXT q

DATA   0,  0,  0,200,200,200
DATA   0,  0,  0,200,200,200
DATA 200,  0,  0,  0,200,200
DATA 200,  0,  0,  0,200,200
DATA   0,200,  0,200,  0,200
DATA   0,200,  0,200,  0,200
DATA   0,  0,200,200,200,  0
DATA   0,  0,200,200,200,  0

DATA 100,100,  0,100,100,200
DATA 100,100,  0,100,100,200
DATA 100,  0,100,100,200,100
DATA 100,  0,100,100,200,100
DATA   0,100,100,200,100,100
DATA   0,100,100,200,100,100

