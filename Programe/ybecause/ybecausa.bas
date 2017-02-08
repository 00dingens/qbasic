DIM text(1000) AS STRING              'der text in dem jeweiligen Knotenpunkt
DIM folge(1000, 10) AS INTEGER        'verknpfungen abw„rts
DIM xx(1000), yy(1000)                  'Position der Box (mitte?)
OPEN "test1.ybc" FOR INPUT AS #1      'Datei mit eingaben
DO                                    '\
 LINE INPUT #1, text(anz)             '  Daten einlesen
 anz = anz + 1                        ' /
LOOP UNTIL LOF(1)                     '/

'Hier die Zeilen ohne eigene Box markieren und auswerten
'Eintr„ge Sortieren
FOR x = 0 TO anz - 1
 FOR y = x TO anz
  IF text(x) > text(y) THEN SWAP text(x), text(y)
 NEXT y
NEXT x

