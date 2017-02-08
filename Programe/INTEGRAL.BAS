DEFDBL A-Z

OPEN "c:\windows\desktop\integral.txt" FOR OUTPUT AS #1
PRINT #1, "Balkenzahl, Obersumme, Untersumme, Mittelwert"
FOR z = 100 TO 1000 STEP 20   'balkenzahl
 'z = 1000000000
 LOCATE 12, 30: PRINT z
 b = 2 / z        'breite
 o = 0            'obersumme
 u = 0            'untersumme
 y1 = 4           'erster y-wert
 FOR x = b TO 2 STEP b
  'LOCATE 12, 30: PRINT x
  y2 = 4 - x ^ 2
  IF y1 < y2 THEN o = o + y2 * b: u = u + y1 * b ELSE o = o + y1 * b: u = u + y2 * b
  y1 = y2
 NEXT x
 m = (o + u) / 2  'mittelwert
 PRINT #1, z, o, u, m
NEXT z

CLOSE

