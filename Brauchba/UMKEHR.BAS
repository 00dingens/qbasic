'kehrt den inhalt einer datei um...also von hinten nach vorne

DIM i(0) AS STRING * 1
OPEN "c:\windows\desktop\text.txt" FOR BINARY AS #1
OPEN "c:\windows\desktop\txet.txt" FOR OUTPUT AS #2
FOR x = LOF(1) TO 1 STEP -1
 GET #1, x, i(0)
 PRINT #2, i(0);
 IF x MOD 100 = 0 THEN LOCATE 12, 10: PRINT USING "noch ###.#%"; 100 * x / LOF(1)
NEXT x
CLOSE

