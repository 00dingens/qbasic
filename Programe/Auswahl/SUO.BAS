SCREEN 13
w = 2 * 3.141593 / 512
DIM x(128)
FOR i = 0 TO 127
 x(i) = 128 * COS(i * w)
NEXT i
FOR i = 0 TO 63
 PAINT STEP(0, 0), 0, 0
 CIRCLE (32 + i, 199 - .4 * x(128 - i)), 10, 1
 PAINT STEP(0, 0), 1, 1
 OUT &H3C8, 1
 OUT &H3C9, 63
 OUT &H3C9, i
 OUT &H3C9, 0
 FOR q = 1 TO 100: NEXT q
NEXT i
FOR i = 64 TO 127
 PAINT STEP(0, 0), 0, 0
 CIRCLE (32 + i, 199 - .4 * x(128 - i)), 10, 1
 PAINT STEP(0, 0), 1, 1
 OUT &H3C8, 1
 OUT &H3C9, 63
 OUT &H3C9, 63
 OUT &H3C9, i - 64
 FOR q = 1 TO 100: NEXT q
NEXT i
FOR i = 127 TO 64 STEP -1
 PAINT STEP(0, 0), 0, 0
 CIRCLE (287 - i, 199 - .4 * x(128 - i)), 10, 1
 PAINT STEP(0, 0), 1, 1
 OUT &H3C8, 1
 OUT &H3C9, 63
 OUT &H3C9, 63
 OUT &H3C9, i - 64
 FOR q = 1 TO 100: NEXT q
NEXT i
FOR i = 63 TO 0 STEP -1
 PAINT STEP(0, 0), 0, 0
 CIRCLE (287 - i, 199 - .4 * x(128 - i)), 10, 1
 PAINT STEP(0, 0), 1, 1
 OUT &H3C8, 1
 OUT &H3C9, 63
 OUT &H3C9, i
 OUT &H3C9, 0
 FOR q = 1 TO 100: NEXT q
NEXT i

