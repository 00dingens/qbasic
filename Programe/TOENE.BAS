DEFDBL A-Z
CLS
OPEN "c:\eigene~1\rafael\toene.wav" FOR BINARY AS #1
DIM i(0) AS STRING * 2
r# = 2 * 3.141592653#
PRINT r#
i(0) = CHR$(255) + CHR$(0)
FOR x = 0 TO 5
 PUT #1, x * 80000 + 48, i(0)
 PUT #1, x * 80000 + 20048, i(0)
 PUT #1, x * 80000 + 40048, i(0)
 PUT #1, x * 80000 + 50048, i(0)
 PUT #1, x * 80000 + 60048, i(0)
NEXT x
'FOR x = 32001 TO 40000   ' V Frequenz
' w = (x - 32000) * 2
' q = (q + (r# * w / 44100)) MOD r#
' i(0) = CHR$(INT(127 * COS(q) + 127))
' PUT #1, 47 + x, i(0)
' LOCATE 15, 1: PRINT x, i(0), q, w, 127 * COS(q)
'NEXT x
CLOSE

