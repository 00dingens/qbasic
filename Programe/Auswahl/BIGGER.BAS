
'Text kann auch ver�ndert werden

SCREEN 12
q$(0) = "Hallo du!"
PRINT q$(0)
FOR x = 0 TO LEN(q$(0)) * 8
 FOR y = 1 TO 8
  n = POINT(x, y * 2): m = POINT(x, y * 2 + 1)
  IF n <> 0 AND m <> 0 THEN q$(y) = q$(y) + "�"
  IF n <> 0 AND m = 0 THEN q$(y) = q$(y) + "�"
  IF n = 0 AND m <> 0 THEN q$(y) = q$(y) + "�"
  IF n = 0 AND m = 0 THEN q$(y) = q$(y) + " "
 NEXT y
NEXT x
DO                      'geht auch ohne diese Zeile
FOR y = 1 TO 8
 PRINT q$(y)
NEXT y
LOOP WHILE INKEY$ = ""  'geht auch ohne diese Zeile

