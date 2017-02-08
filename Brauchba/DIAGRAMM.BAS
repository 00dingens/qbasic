SCREEN 12
PAINT (10, 10), 15
LINE (20, 20)-(600, 440), 0, B
LINE (21, 20)-(600, 439), 15, B
FOR x = 0 TO 5
 FOR y = 0 TO 5
  PSET (20 + x * 100, y * 100 + 40), 7
 NEXT y
NEXT x

