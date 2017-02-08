DIM a(1) AS INTEGER
OPEN "c:\windows\desktop\Wave1.wav" FOR BINARY AS #1
PRINT LOF(1)
freq = 1
FOR z = 1 TO 75
 p = 3.14159 * (freq + z) / 44100
 FOR x = 1 TO 44100 STEP 2
  a(0) = INT(16000 * SIN(p * x))
  PUT #1, 100 + x + z * 44100, a(0)
    IF x MOD 1000 THEN LOCATE 1, 1: PRINT x, z
 NEXT x
NEXT z
CLOSE

