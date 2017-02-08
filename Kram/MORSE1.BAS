neu:
CLS
m$ = ""
PRINT "Satz eingeben:"
ant$ = ""
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 IF t$ <> CHR$(13) THEN ant$ = ant$ + t$
 IF t$ = CHR$(8) THEN ant$ = LEFT$(ant$, LEN(ant$) - 2)
 LOCATE 2, 1: PRINT SPACE$(200)
 LOCATE 2, 1: PRINT ant$
LOOP UNTIL t$ = CHR$(13)
CLS
a$ = RTRIM$(LTRIM$(LCASE$(ant$)))
IF a$ = "" THEN GOTO neu
FOR x = 1 TO LEN(a$)
 SELECT CASE MID$(a$, x, 1)
 CASE "a": m$ = m$ + ".- "
 CASE "b": m$ = m$ + "-... "
 CASE "c":
  IF MID$(a$, x, 2) <> "ch" THEN m$ = m$ + "-.-. " ELSE m$ = m$ + "---- ": x = x + 1
 CASE "d": m$ = m$ + "-.. "
 CASE "e": m$ = m$ + ". "
 CASE "f": m$ = m$ + "..-. "
 CASE "g": m$ = m$ + "--. "
 CASE "h": m$ = m$ + ".... "
 CASE "i": m$ = m$ + ".. "
 CASE "j": m$ = m$ + ".--- "
 CASE "k": m$ = m$ + "-.- "
 CASE "l": m$ = m$ + ".-.. "
 CASE "m": m$ = m$ + "-- "
 CASE "n": m$ = m$ + "-. "
 CASE "o": m$ = m$ + "--- "
 CASE "p": m$ = m$ + ".--. "
 CASE "q": m$ = m$ + "--.- "
 CASE "r": m$ = m$ + ".-. "
 CASE "s": m$ = m$ + "... "
 CASE "t": m$ = m$ + "- "
 CASE "u": m$ = m$ + "..- "
 CASE "v": m$ = m$ + "...- "
 CASE "w": m$ = m$ + ".-- "
 CASE "x": m$ = m$ + "-..- "
 CASE "y": m$ = m$ + "-.-- "
 CASE "z": m$ = m$ + "--.. "
 CASE "Ñ": m$ = m$ + ".-.- "
 CASE "î": m$ = m$ + "---. "
 CASE "Å": m$ = m$ + "..-- "
 CASE "1": m$ = m$ + ".---- "
 CASE "2": m$ = m$ + "..--- "
 CASE "3": m$ = m$ + "...-- "
 CASE "4": m$ = m$ + "....- "
 CASE "5": m$ = m$ + "..... "
 CASE "6": m$ = m$ + "-.... "
 CASE "7": m$ = m$ + "--... "
 CASE "8": m$ = m$ + "---.. "
 CASE "9": m$ = m$ + "----. "
 CASE "0": m$ = m$ + "----- "
 CASE ".": m$ = m$ + ".-.-.- "
 CASE ",": m$ = m$ + "--..-- "
 CASE ";": m$ = m$ + "-.-.-. "
 CASE ":": m$ = m$ + "---... "
 CASE "?": m$ = m$ + "..--.. "
 CASE "-": m$ = m$ + "-....- "
 CASE "/": m$ = m$ + "-..-. "
 CASE "(": m$ = m$ + "-.--.- "
 CASE ")": m$ = m$ + "-.--.- "
 CASE " ": m$ = m$ + "  "
 CASE ELSE: GOTO neu
 END SELECT
NEXT x
PLAY "t60MFMLo2"
LOCATE 1, 1
FOR x = 1 TO LEN(m$)
 SELECT CASE MID$(m$, x, 1)
 CASE ".": PLAY "l32cp16": PRINT "˙";
 CASE "-": PLAY "l8c.p16": PRINT "-";
 CASE " ": PLAY "p8": PRINT " ";
 END SELECT
NEXT x
LOCATE 10, 1
PRINT "Der Satz heisst:"
ant$ = ""
DO
 DO: t$ = INKEY$: LOOP WHILE t$ = ""
 IF t$ <> CHR$(13) THEN ant$ = ant$ + t$
 IF t$ = CHR$(8) THEN ant$ = LEFT$(ant$, LEN(ant$) - 2)
 LOCATE 11, 1: PRINT SPACE$(200)
 LOCATE 11, 1: PRINT ant$
LOOP UNTIL t$ = CHR$(13)
IF ant$ = a$ THEN PLAY "l64cdefgabagfedc": PRINT "Richtig!" ELSE PRINT "Falsch, richtig wÑre:"; a$: PLAY "l64bagfedc": END
DO: LOOP WHILE INKEY$ = ""
GOTO neu

