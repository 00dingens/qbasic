
'Farbenspiel (abgeschrieben)

CLS
INPUT "Modul (10-1000)"; a
INPUT "Schranke ca. die H„lfte von Modul"; b
INPUT "Farbe(1,...,15)"; g
SCREEN 12
FOR c = 1 TO 480
  FOR d = 1 TO 640
    e = c * d
    f = e MOD a
    IF f <= b THEN PSET (d, c), g
  NEXT d
NEXT c
SLEEP

