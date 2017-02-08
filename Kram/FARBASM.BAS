DIM i(0) AS STRING * 1
OPEN "c:\rafael\coding\basic\farben.com" FOR BINARY AS #1
OPEN "c:\rafael\coding\basic\farbdata.bas" FOR OUTPUT AS #2
PRINT #2, "data ";
FOR x = 1 TO LOF(1)
 GET #1, x, i(0)
 PRINT #2, RIGHT$("  " + RTRIM$(STR$(ASC(i(0)))), 3);
 IF x MOD 18 <> 0 THEN PRINT #2, ",";  ELSE PRINT #2, "": PRINT #2, "data ";
NEXT x
CLOSE

