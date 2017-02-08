CLS
DIM q AS STRING * 1
DIM w(3) AS STRING * 3
DIM z(1) AS INTEGER
OPEN "c:\windows\desktop\bild1.bmp" FOR BINARY AS #1
OPEN "c:\windows\desktop\bild2.bmp" FOR OUTPUT AS #2
FOR x = 1 TO LOF(1)
 GET #1, x, q
 IF x > 55 AND x MOD 4 <> 0 THEN q = CHR$(0)
 PRINT #2, q;
 IF x MOD 1000 = 0 THEN LOCATE 1, 1: PRINT INT(x / LOF(1) * 100); "%"
NEXT x
CLOSE

