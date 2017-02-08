OPEN "c:\windows\desktop\u2010000.wav" FOR BINARY AS #1
DIM i(0) AS INTEGER   'STRING * 1 'fr 8bit
a = 0         'position der welle
aa = 31.4159 / 176400    '5 drehungen in 2sec(88200 samples)

FOR x = 0 TO 14
 CLS : PRINT x
 w = 2 ^ x * 31.4159 / 176400
 ww = w / 88200
 FOR y = 1 TO 88200
  w = w + ww
  a = a + w
  IF a > 6.28318 THEN a = a - 3.14159 * 2
  ''i(0) = CHR$(INT(127 * SIN(a)) + 128) '8bit
  ''PUT #1, 70 + y + 88200 * x, i(0)     '8bit
  i(0) = INT(32767 * SIN(a))             '16bit
  PUT #1, 45 + y * 2 + 176400 * x, i(0)  '16bit
  IF y MOD 1000 = 0 THEN LOCATE 2, 1: PRINT INT(100 * y / 88200)
 NEXT y
NEXT x
CLOSE

