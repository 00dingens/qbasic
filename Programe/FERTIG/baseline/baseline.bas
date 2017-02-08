CLS
DIM u(1) AS STRING * 1 ' 8bit
DIM i(0) AS INTEGER    '16bit
DIM l(0) AS LONG       '32bit

OPEN "c:\windows\desktop\lied.txt" FOR INPUT AS #1
INPUT #1, gbs, bpm       'gesamtbeats, beats per minute


p = 2 * 3.141592653#     '2*pi
wz2 = 2 ^ (1 / 12)       '12te wurzel von 2
dpos = 47                'position in der datei
w = 0                    'wellenposition
o = 5                    'oktave           o=0 -> ca 3-5 hz  o=7 -> a=440

fps = 44100              'fps=44100 frames per sekunde
                         '16 bit stereo
bps = bpm / 60           'beats per sekunde
fpb = fps / bps           'frames per beat
s = fpb                    'speed
datenmenge = fpb * gbs * 4  'datenmenge in Bytes


'Wav-Datei erzeugen
PRINT "Datei wird erstellt "
OPEN "c:\windows\desktop\lied.wav" FOR OUTPUT AS #2

n$ = CHR$(0)
PRINT #2, "RIFF    WAVEfmt " + CHR$(18) + n$ + n$ + n$ + CHR$(1) + n$ + CHR$(2) + n$;
PRINT #2, "        " + CHR$(4) + n$ + CHR$(16) + n$ + n$ + n$ + "data    ";
a$ = ""
FOR x = 1 TO 4000
 a$ = a$ + CHR$(0)
NEXT x
FOR x = 1 TO INT(datenmenge / 4000)
 LOCATE 1, 21: PRINT INT(400000 * x / datenmenge); "%"
 PRINT #2, a$;
NEXT x
a$ = CHR$(0) + CHR$(0) + CHR$(0) + CHR$(0)
FOR x = 1 TO (datenmenge) MOD 4000
 PRINT #2, a$;
NEXT x
LOCATE 1, 21: PRINT 100; "%"
CLOSE



OPEN "c:\windows\desktop\lied.txt" FOR BINARY AS #1
OPEN "c:\windows\desktop\lied.wav" FOR BINARY AS #2

'wav-daten schreiben
l(0) = 38 + datenmenge
PUT #2, 5, l(0)
l(0) = fps
PUT #2, 25, l(0)
l(0) = fps * 4
PUT #2, 29, l(0)
l(0) = datenmenge
PUT #2, 43, l(0)


'musiksequenz bearbeiten
PRINT "Sequenz wird bearbeitet"
FOR x = 1 TO LOF(1)
 GET #1, x, u(0)
 IF u(0) = "#" THEN start = x + 1: EXIT FOR
 IF x = LOF(1) THEN PRINT "Vor der Tonsequenz muá ein # stehen!": END
NEXT x
PRINT "#";
FOR x = start TO LOF(1) - 1
 GET #1, x, u(0)
 GET #1, x + 1, u(1)
 PRINT u(0);
 SELECT CASE u(0)
 CASE "S"
  IF u(1) = "-" THEN s = s * 2
  IF u(1) = "+" THEN s = s / 2
  IF u(1) = "0" THEN s = fpb
  IF VAL(u(1)) <> 0 THEN s = 8 * fpb / (2 ^ VAL(u(1)))
 CASE "O"
  IF u(1) = "-" THEN o = o - 1
  IF u(1) = "+" THEN o = o + 1
  IF u(1) = "0" THEN o = 5
  IF VAL(u(1)) <> 0 THEN o = VAL(u(1))
 CASE "c": freq = 4186: GOSUB ton
 CASE "d": freq = 4699: GOSUB ton
 CASE "e": freq = 5274: GOSUB ton
 CASE "f": freq = 5588: GOSUB ton
 CASE "g": freq = 6272: GOSUB ton
 CASE "a": freq = 7040: GOSUB ton
 CASE "b": freq = 7459: GOSUB ton
 CASE "h": freq = 7902: GOSUB ton
 CASE "p": freq = 0: GOSUB ton
 CASE "#": PRINT : PRINT "Fertig!": GOTO ende
 CASE ELSE
 END SELECT
NEXT x

ende:
CLOSE
PRINT
PRINT "Bitte Taste Drcken!"
DO: LOOP WHILE INKEY$ = ""
CLS
END

ton:
freq = freq * (2 ^ o) / 1024
IF u(1) = "+" THEN freq = freq * wz2
IF u(1) = "-" THEN freq = freq / wz2

schritt = p * freq / fps
npos = dpos + s * 4            'bis npos wird weitergemalt
DO
 dpos = dpos + 4
 w = w + schritt
 i(0) = INT(SIN(w) * 32765)
 PUT #2, dpos, i(0)
 PUT #2, dpos + 2, i(0)
LOOP UNTIL dpos > npos
IF dpos > LOF(2) THEN PRINT "Tonsequenz l„nger als angegeben (gesamtbeats erh”hen!)": GOTO ende
RETURN


'Wav-verschlsselung
'00 - "RIFF" + 4Byte Dateigr”áe-8 + "WAVEfmt " +
'10 - 12 00 00 00 + 1Byte Spurenzahl + 00 + 4Byte Frequenz + 4Byte Byte/sec +
'18 - 2Byte Bytes/sample(alle spuren) + 2Byte Bits/sample/spur + 00 00 + "data" +
'4Byte Dateigr”áe-46 +
'Daten Sampleweise Spurweise(l->r)
'Lowbyte->Highbyte (Signed komplement, falls 16bit(-32768 - 32767); unsigned, falls 8bit (0 - 255))

