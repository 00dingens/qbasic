OPEN "c:\windows\desktop\s2010000.wav" FOR BINARY AS #1
'datei muss verd*sec sekunden lang sein, 44100Hz, 16bit, mono.  =>ca. verd*sec*44100*2 Byte
DIM i(0) AS INTEGER    'STRING * 1 'fÅr 8bit
a = 0                  'position der welle
freq = 4               'startfrequenz   (schwingungen pro sekunde)
sec = 60               'sekunden zum verdoppeln
verd = 3               'anzahl der verdopplungen

freq = freq * sec
IF LOF(1) < verd * sec * 2 * 44100 + 45 THEN PRINT "Datei zu klein": CLOSE : END
IF verd * sec * 44100 > 8388583 THEN PRINT "Sound darf nur 190 sekunden dauern": CLOSE : END
FOR x = 0 TO verd - 1
 CLS : PRINT "Verdopplungen: "; x
 w = 2 ^ x * 3.14159 * freq / (22100 * sec) 'weiterdrehung (startwert)
 ww = w / (44100 * sec)                     'weiterdrehungserhîhung
 FOR y = 1 TO (44100 * sec)
  w = w + ww
  a = a + w
  IF a > 6.28318 THEN a = a - 6.28318
  i(0) = INT(32767 * SIN(a))                      '16bit
  PUT #1, 45 + y * 2 + 44100 * sec * 2 * x, i(0)  '16bit
  IF y MOD 10000 = 0 THEN LOCATE 2, 1: PRINT "NÑchste Verdopplung zu"; INT(100 * y / (44100 * sec)); "% Fertig.": PRINT "Noch"; verd - x; "Verdopplungen Åbrig."
 NEXT y
NEXT x
CLOSE
CLS : PRINT "Fertig"

