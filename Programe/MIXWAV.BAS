'nimmt 2 wav dateien (16bit) und mischt sie so zusammen,
'dass in test3 das wichtige byte von test2 zuerst kommt,
'und in test4 das wichtige byte von test1 zuerst.
'somit kann man jemand zB test3 schicken, was sich einfach
'nach test2 anh”rt, der shiftet das ab byte 70 um 1 byte,
'und h”rt test1. geheimbotschaften k”nnte man so schicken.

DIM a1 AS STRING * 1
DIM a2 AS STRING * 1

OPEN "c:\esim\test1.wav" FOR BINARY AS #1
OPEN "c:\esim\test2.wav" FOR BINARY AS #2

OPEN "c:\esim\test3.wav" FOR OUTPUT AS #3
OPEN "c:\esim\test4.wav" FOR OUTPUT AS #4

FOR x = 1 TO 70
 GET #1, x, a1
 PRINT #3, a1;
 PRINT #4, a1;
NEXT x
PRINT LOF(1), LOF(2)
FOR x = 70 TO LOF(1) STEP 2
 LOCATE 1, 1: PRINT x
 GET #1, x, a1
 GET #2, x, a2
 PRINT #3, a1; a2;
 PRINT #4, a2; a1;
NEXT x

CLOSE

