CLS
OPEN "c:\a\gross.com" FOR OUTPUT AS #1
DIM a(0) AS STRING * 10000
a(0) = SPACE$(10000)
DO
 q = q + 1
 FOR x = 1 TO 100
  PRINT #1, a(0);
 NEXT x
 CLS : LOCATE 12, 35: PRINT "Datei ist"; q; "MByte gross."
LOOP WHILE INKEY$ = ""
CLOSE

