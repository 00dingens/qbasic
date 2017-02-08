SCREEN 12
RANDOMIZE 0'timer
DIM a(480)
FOR x = 0 TO 479
 a(x) = x
NEXT x
FOR x = 0 TO 479
 SWAP a(x), a(INT(RND * 480))
NEXT x
FOR x = 0 TO 479
 LINE (0, x)-(a(x), x)
NEXT x

t = TIMER
GOSUB so4
PRINT TIMER - t

END

so1: '66.6
FOR x = 0 TO 479
 LINE (500, x)-(600, x), 1
 FOR y = 0 TO 479
  LINE (500, y)-(600, y), 2
  IF a(x) < a(y) THEN SWAP a(x), a(y)
  LINE (0, x)-(a(x), x): LINE (a(x) + 1, x)-(500, x), 0
  LINE (0, y)-(a(y), y): LINE (a(y) + 1, y)-(500, y), 0

  LINE (500, y)-(600, y), 0
 NEXT y
 LINE (500, x)-(600, x), 0
NEXT x
RETURN


so2: '33.6
FOR x = 0 TO 478
 LINE (500, x)-(600, x), 1
 FOR y = x + 1 TO 479
  LINE (500, y)-(600, y), 2
  IF a(x) > a(y) THEN SWAP a(x), a(y)
  LINE (0, x)-(a(x), x): LINE (a(x) + 1, x)-(500, x), 0
  LINE (0, y)-(a(y), y): LINE (a(y) + 1, y)-(500, y), 0

  LINE (500, y)-(600, y), 0
 NEXT y
 LINE (500, x)-(600, x), 0
NEXT x
RETURN

so3: '33.3
FOR x = 0 TO 478
 LINE (500, x)-(600, x), 1
 FOR y = 479 TO x + 1 STEP -1
  LINE (500, y)-(600, y), 2
  IF a(x) > a(y) THEN SWAP a(x), a(y)
  LINE (0, x)-(a(x), x): LINE (a(x) + 1, x)-(500, x), 0
  LINE (0, y)-(a(y), y): LINE (a(y) + 1, y)-(500, y), 0

  LINE (500, y)-(600, y), 0
 NEXT y
 LINE (500, x)-(600, x), 0
NEXT x
RETURN

so4: '36.5
FOR x = 0 TO 478
 LINE (500, x)-(600, x), 1
 FOR y = 478 TO x STEP -1
  LINE (500, y)-(600, y), 2
  IF a(y) > a(y + 1) THEN SWAP a(y + 1), a(y)
  LINE (0, y + 1)-(a(y + 1), y + 1): LINE (a(y + 1) + 1, y + 1)-(500, y + 1), 0
  LINE (0, y)-(a(y), y): LINE (a(y) + 1, y)-(500, y), 0

  LINE (500, y)-(600, y), 0
 NEXT y
 LINE (500, x)-(600, x), 0
NEXT x
RETURN


so5: ' VA
FOR x = 0 TO 239
 FOR y = x TO 479 - x

 NEXT y
 LINE (500, x)-(600, x), 1
 FOR y = 479 TO x + 1 STEP -1
  LINE (500, y)-(600, y), 2
  IF a(x) > a(y) THEN SWAP a(x), a(y)
  LINE (0, x)-(a(x), x): LINE (a(x) + 1, x)-(500, x), 0
  LINE (0, y)-(a(y), y): LINE (a(y) + 1, y)-(500, y), 0

  LINE (500, y)-(600, y), 0
 NEXT y
 LINE (500, x)-(600, x), 0
NEXT x
RETURN

