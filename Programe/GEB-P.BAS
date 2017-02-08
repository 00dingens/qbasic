' auf einem Planeten, der d Tage hat, sollen x leute leben.
' wÅrde einer mehr da leben, dann wÑre die wahrscheinlichkeit,
' dass zwei am selben tag geburtstag haben unter 50%.
' x ist zu berechnen.

DEFDBL A-Z
OPEN "c:\windows\desktop\geb-p.txt" FOR OUTPUT AS #1
PRINT #1, "Anz der Tage: d"
PRINT #1, "Anz der Leute: x"
PRINT #1, "Wahrscheinlichkeit: p"


n = 1#
FOR q = 1 TO 18
 n = n * 10
 p = 1
 FOR x = n TO 1 STEP -1
  p = p * x / n
'''  'PRINT 1 + n - x, 1 - p
  IF p <= 1 / 2 THEN EXIT FOR
'''  'PSET (640 - x * 639 / n, p * 470)
 NEXT x
 PRINT #1, "d = 10^"; q; " x = "; 1 + n - x; " p = "; 1 - p
 PRINT "d = 10^"; q; " x = "; 1 + n - x; " p = "; 1 - p
NEXT q
CLOSE

