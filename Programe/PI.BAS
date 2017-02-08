CLS
DIM q(0) AS STRING * 1
gen = 100
PRINT "Bereite Dateien vor .";
OPEN "c:\pi\ecken.num" FOR OUTPUT AS #1
OPEN "c:\pi\llaenge.num" FOR OUTPUT AS #2
OPEN "c:\pi\mlaenge.num" FOR OUTPUT AS #3
FOR x = 1 TO gen
 PRINT #1, "0";
 PRINT #2, "0";
 PRINT #3, "0";
NEXT x
CLOSE
PRINT ".";
OPEN "c:\pi\x1.num" FOR OUTPUT AS #4
OPEN "c:\pi\x2.num" FOR OUTPUT AS #5
OPEN "c:\pi\x3.num" FOR OUTPUT AS #6
FOR x = 1 TO gen
 PRINT #4, "0";
 PRINT #5, "0";
 PRINT #6, "0";
NEXT x
CLOSE
PRINT ".";
OPEN "c:\pi\ecken.num" FOR BINARY AS #1
q(0) = "6"
PUT #1, gen, q(0)
OPEN "c:\pi\llaenge.num" FOR BINARY AS #2
OPEN "c:\pi\mlaenge.num" FOR BINARY AS #3
CLOSE
OPEN "c:\pi\x1.num" FOR BINARY AS #4
OPEN "c:\pi\x2.num" FOR BINARY AS #5
OPEN "c:\pi\x3.num" FOR BINARY AS #6
CLOSE
PRINT " Dateien vorbereitet."

