OPEN "c:\windows\desktop\bild.bmp" FOR BINARY AS #1
DIM i(1) AS STRING * 3
i(1) = CHR$(0) + CHR$(0) + CHR$(0)
SCREEN 12
FOR z = 1 TO 1000
 r = RND
 p = RND * 2 * 3.14159
 x = r * SIN(p)
 xx = INT((x + 1) * 200)
 y = r * COS(p)
 yy = INT((y + 1) * 200)
 PSET (120 + xx, 40 + yy)
 PUT #1, INT(52 + xx * 3 + yy * 1200), i(1)

NEXT z
CLOSE

