DIM MS%(52)
SCREEN 12
DEF SEG = VARSEG(MS%(0))
FOR i% = 0 TO 52: READ Byte$: POKE VARPTR(MS%(0)) + i%, VAL("&H" + Byte$): NEXT i%

ax% = 0: bx% = 0: cx% = 0: dx% = 0     'benutzte Variablen







END

'Maustreiber initialisieren
ax% = 0
CALL ABSOLUTE(ax%, bx%, cx%, dx%, VARPTR(MS%(0))) '** Aufruf
IF ax% = 0 THEN PRINT "Kein Maustreiber installiert!": END
'wenn ax% = -1 dann maus installiert
'bx% = anzahl der Maustasten

'Mauszeiger anschalten
ax% = 1
CALL ABSOLUTE(ax%, bx%, cx%, dx%, VARPTR(MS%(0))) '** Aufruf

DO: LOOP WHILE INKEY$ = ""

'Mauszeiger ausschalten
ax% = 2
CALL ABSOLUTE(ax%, bx%, cx%, dx%, VARPTR(MS%(0))) '** Aufruf

'Maustastenstatus und Position ermitteln
ax% = 3
CALL ABSOLUTE(ax%, bx%, cx%, dx%, VARPTR(MS%(0))) '** Aufruf
'bx% = Status der Maustaste
'cx% = aktuelle Mausspalte
'dx% = aktuelle Mauszeile

'Mauszeiger setzen
ax% = 4: cx% = 1: dx% = 1
'cx% = Mausspalte
'dx% = Mauszeile
CALL ABSOLUTE(ax%, bx%, cx%, dx%, VARPTR(MS%(0))) '** Aufruf


END

 DATA 55,8b,ec,56,57            'Register retten
 DATA 8b,76,0c,8b,04            'AX bis DX holen
 DATA 8b,76,0a,8b,1c
 DATA 8b,76,08,8b,0c
 DATA 8b,76,06,8b,14
 DATA cd,33                     'INT 33 (Nummer wird ver„ndert!)
 DATA 8b,76,0c,89,04            'AX bis DX zurckschreiben
 DATA 8b,76,0a,89,1c
 DATA 8b,76,08,89,0c
 DATA 8b,76,06,89,14
 DATA 5f,5e,5d                  'Register holen
 DATA ca,08,00                  'RETF 8  =>  Ende

