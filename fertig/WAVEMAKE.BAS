' erfordert wave.wav auf dem desktop (4-5 sek. 44Khz. 8bit mono)

'bedienung:

'im hauptmen:
'pfeiltasten=aktuelle welle wechseln
'entf=welle1 bestimmen
'einfg=welle1 auf aktuelle welle kopieren
'tab= welle1 und aktuelle welle tauschen
'm=welle1 auf aktuelle welle mischen
'+=bearbeiten
'enter=aktuelle welle in datei schreiben
'esc=ende

'im editor:
'pfeile=samples ver„ndern
'+=genauigkeit einstellen
'-=welle l”schen
'enter=ins hauptmen



DIM i(0) AS STRING * 1
DIM a(-10 TO 310, 3)   '300 samples, 4 wellen
SCREEN 12

FOR x = 0 TO 300
 FOR y = 0 TO 3
  a(x, y) = 120
 NEXT y
NEXT x
GOSUB malen

hauptmenue:
GOSUB boxhin
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
 CASE CHR$(0) + "H": p = p XOR 2
 CASE CHR$(0) + "P": p = p XOR 2
 CASE CHR$(0) + "K": p = p XOR 1
 CASE CHR$(0) + "M": p = p XOR 1
 CASE "+": GOSUB genau
 CASE CHR$(0) + "S": nimm = p
 CASE CHR$(0) + "R": gib = p: GOSUB kopie
 CASE CHR$(9): gib = p: GOSUB tausch
 CASE "m": gib = p: GOSUB misch
 CASE CHR$(13): GOSUB datei
 CASE CHR$(27): END
 CASE ELSE: BEEP
 END SELECT
 GOSUB malen
 GOSUB boxhin
LOOP

END



malen:
CLS
FOR x = 1 TO 300
 PSET (x, 239 - a(x, 0)), 9
 PSET (320 + x, 239 - a(x, 1)), 10
 PSET (x, 479 - a(x, 2)), 14
 PSET (320 + x, 479 - a(x, 3)), 12
NEXT x
RETURN

datei:
OPEN "c:\windows\desktop\wave.wav" FOR BINARY AS #1
FOR x = 1 TO 300
 IF a(x, p) > 240 THEN a(x, p) = 240
 IF a(x, p) < 0 THEN a(x, p) = 0
 FOR z = 1 TO 147
  i(0) = CHR$(a(x, p) + 8)
  PUT #1, p * 44100 + z * 300 + x, i(0)
 NEXT z
 SELECT CASE p
 CASE 0: PSET (x, 239 - a(x, 0)), 15
 CASE 1: PSET (320 + x, 239 - a(x, 1)), 15
 CASE 2: PSET (x, 479 - a(x, 2)), 15
 CASE 3: PSET (320 + x, 479 - a(x, 3)), 15
 END SELECT
NEXT x
CLOSE
RETURN

boxhin:
SELECT CASE p
CASE 0: px = 0: py = 0
CASE 1: px = 320: py = 0
CASE 2: px = 0: py = 239
CASE 3: px = 320: py = 239
END SELECT
LINE (px, py)-STEP(300, 240), 7, B
RETURN

kopie:
FOR x = 0 TO 300
 a(x, gib) = a(x, nimm)
NEXT x
RETURN

tausch:
FOR x = 0 TO 300
 SWAP a(x, gib), a(x, nimm)
NEXT x
RETURN

misch:
FOR x = 0 TO 300
 a(x, gib) = INT((a(x, gib) + a(x, nimm)) / 2)
NEXT x
RETURN

leer:
FOR x = 0 TO 300
 a(x, p) = 120
NEXT x
RETURN

genau:
CLS
FOR x = 1 TO 300
 PSET (x * 2 + 20, 360 - a(x, p)), 15
NEXT x
ein = 1
xx = 150
DO
 PSET (xx * 2 + 20, 360 - a(xx, p)), 12
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 SELECT CASE t$
  CASE CHR$(0) + "H"
   IF ein = 0 THEN
    a(xx, p) = a(xx, p) + 1
   ELSE
    FOR x = -9 TO 9
     d = 10 - SGN(x) * x
     a(xx + x, p) = a(xx + x, p) + d
    NEXT x
   END IF
  CASE CHR$(0) + "P"
   IF ein = 0 THEN
    a(xx, p) = a(xx, p) - 1
   ELSE
    FOR x = -9 TO 9
     d = 10 - SGN(x) * x
     a(xx + x, p) = a(xx + x, p) - d
    NEXT x
   END IF
  CASE CHR$(0) + "K"
   IF ein = 0 THEN
    xx = xx - 1
   ELSE
    xx = xx - 10
   END IF
  CASE CHR$(0) + "M"
   IF ein = 0 THEN
    xx = xx + 1
   ELSE
    xx = xx + 10
   END IF
  CASE "+": ein = ein XOR 1
  CASE "-": GOSUB leer
  CASE CHR$(13): RETURN
 END SELECT
 xx = (xx + 299) MOD 300 + 1
 GOSUB mal2
LOOP
RETURN

mal2:
CLS
FOR x = 1 TO 300
 PSET (x * 2 + 20, 360 - a(x, p)), 15
NEXT x
RETURN

