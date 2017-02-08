DEFDBL A-Z
DIM i(2) AS INTEGER
OPEN "c:\windows\desktop\test.wav" FOR BINARY AS #1
pi = 2 * 3.14159
freq = 8000
p = .001
CLS
PRINT zz
FOR x = 101 TO LOF(1) STEP 2
 k = k + 2
 IF k > 44100 THEN k = 0: freq = freq * zz: LOCATE 1, 1: PRINT INT(freq)
 p = p + .00001
 ps = ps + p
 IF ps > 2 * pi THEN ps = ps - 2 * pi
 a = SIN(ps) * 16000
 LOCATE 3, 2: PRINT freq, p, ps, a
 i(0) = a
 PUT #1, x, i(0)
NEXT x
CLOSE

