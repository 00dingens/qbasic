'sortiert datei zeilenweise

DIM a(1000) AS STRING
OPEN "c:\windows\desktop\ct.txt" FOR INPUT AS #1
OPEN "c:\windows\desktop\ct1.txt" FOR OUTPUT AS #2
'Zeilen einlesen
DO
 LINE INPUT #1, aa$
 a(x) = aa$
 x = x + 1
LOOP UNTIL EOF(1)

'Sortieren
FOR i = 0 TO x - 1
 FOR j = i TO x
  IF UCASE$(a(i)) > UCASE$(a(j)) THEN SWAP a(i), a(j)
 NEXT j
NEXT i

'in datei schreiben
FOR i = 0 TO x
 PRINT #2, a(i)
NEXT i
CLOSE

