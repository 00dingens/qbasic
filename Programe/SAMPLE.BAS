'macht einen sound schneller oder langsamer

DIM q(1) AS STRING * 1
OPEN "c:\windows\desktop\sample.wav" FOR BINARY AS #1

qq = 44100         'klangqualit„t
s1 = 264           'tonh”he des samples
s2 = 440           'tonh”he der „nderung
ss = .3            'l„nge des samples in sek.(ver„ndertes darf nicht l„nger sein)
                   'datei ist doppelt so lang, sample in der ersten h„lfte.
rep = ss * qq * 5  'replacement

FOR x1 = ss * qq TO 0 STEP -1
 x2 = x1 * s2 / s1
 x2a = INT(x2)
 x2b = x2 - x2a
 IF x2b = 0 THEN x2a = x2a + 1
 GET #1, INT(x2a) + 70, q(0)
 GET #1, INT(x2a + 1) + 70, q(1)
 q(0) = CHR$(ASC(q(0)) * x2b + ASC(q(0)) * (1 - x2b))
 IF x2a < ss * qq THEN PUT #1, x1 + rep + 70, q(0)
 IF x1 MOD 500 = 0 THEN LOCATE 12, 30: PRINT INT(x1 * 100 / (ss * qq)); "%"
NEXT x1
CLOSE

