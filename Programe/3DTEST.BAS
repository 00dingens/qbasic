SCREEN 12
e = 128
FOR q = 1 TO 100
 x = INT(RND * 320 - 160)
 y = INT(RND * 240 - 120)
 z = INT(RND * 320)

 CIRCLE (320 + x * e / (e + z), 240 + y * e / (e + z)), 1, 1
 x = x * e / (z + e)
 y = y * e / (z + e)
 CIRCLE (x + 320, y + 240), 2, 2

NEXT q

