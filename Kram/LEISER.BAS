DEFDBL A-Z
DIM a AS INTEGER
OPEN "c:\a\ka123.wav" FOR BINARY AS #1
'f = 1 / 352800
'FOR x = 1 TO 352800 STEP 2
' GET #1, x + 15170400, a
' a = INT(a * (1 - x / 352800))
' PUT #1, x + 15170400, a
'NEXT x
f = 1 / 176400
FOR x = 1 TO 176400 STEP 2
 GET #1, x + 18874800, a
 a = INT(a * (1 - x / 176400))
 PUT #1, x + 18874800, a
NEXT x
CLOSE

