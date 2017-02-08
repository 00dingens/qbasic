DECLARE SUB GetMaus ()
DECLARE FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)

DIM SHARED MS%(45)                      '** Feld fÅr Maschinenprogramm

'** DATAs fÅr Maschinenprogramm in MS%() einlesen
RESTORE MS.Data
DEF SEG = VARSEG(MS%(0))
FOR i% = 0 TO 99
 READ Byte$
 IF Byte$ = "#" THEN EXIT FOR
 POKE VARPTR(MS%(0)) + i%, VAL("&H" + Byte$)
NEXT i%

'** Warten, bis Maus bewegt oder Maustaste gedrÅckt/losgelassen
GetMaus
X% = MausX%: Y% = MausY%: k% = MausK%
DO
 GetMaus
LOOP UNTIL X% <> MausX% OR Y% <> MausY% OR k% <> MausK%

'** Warten, bis Maustaste losgelassen
WHILE MausK%
 GetMaus
WEND


' Maustreiber initialisieren
R% = Interr%(&H33, 0, BX%, CX%, DX%)           '** Maustreiber initialisieren
R% = Interr%(&H33, 10, 0, &HFFFF, &HFF00)      '** Maushintergrund: blinken

' Position des Mauszeigers setzen ***
' X% und Y% sind Zeichenkoordinaten im Textmodus
R% = Interr%(&H33, 4, BX%, X% * 8 - 8, Y% * 8 - 8)
'''R% = Interr%(&H33, 4, BX%, X%, Y%)    'hier nicht mehr

' Mausgeschwindigkeit einstellen (0=Schnell, 100=extrem langsam)
R% = Interr%(&H33, 15, BX%, Speed%, Speed% * 2)

' Mausbewegungsbereich horizontal setzen von X1% bis X2%
' X1% und X2% sind Zeichenkoordinaten im Textmodus
R% = Interr%(&H33, 7, 0, X1% * 8 - 8, X2% * 8 - 8)
'''R% = Interr%(&H33, 7, 0, X1%, X2%)         'hier nicht mehr

' Mausbewegungsbereich vertikal setzen von Y1% bis Y2%
' Y1% und Y2% sind Zeichenkoordinaten im Textmodus
R% = Interr%(&H33, 8, BX%, Y1% * 8 - 8, Y2% * 8 - 8)
'''R% = Interr%(&H33, 8, BX%, Y1%, Y2%)        'hier nicht mehr


'Status
R% = Interr%(&H33, 3, BX%, CX%, DX%)
MausK% = BX%                  '** Maustaste (1=links, 2=rechts)
MausX% = CX%                  '** X-Position
MausY% = DX%                  '** Y-Position

'Mauszeiger an aus
IF OnOff% = 0 THEN OnOff% = 2 ELSE OnOff% = 1
R% = Interr%(&H33, OnOff%, BX%, CX%, DX%)




 DATA 55,8b,ec,56,57            'Register retten
 DATA 8b,76,0c,8b,04            'AX bis DX holen
 DATA 8b,76,0a,8b,1c
 DATA 8b,76,08,8b,0c
 DATA 8b,76,06,8b,14
 DATA cd,21                     'INT 21 (Nummer wird verÑndert!)
 DATA 8b,76,0c,89,04            'AX bis DX zurÅckschreiben
 DATA 8b,76,0a,89,1c
 DATA 8b,76,08,89,0c
 DATA 8b,76,06,89,14
 DATA 5f,5e,5d                  'Register holen
 DATA ca,08,00                  'RETF 8  =>  Ende

FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)
'** Interrupt Nummer Num% auslîsen mit Registerinhalten AX% bix DX%

 IF MS%(0) = 0 THEN                     '** Ist MS%() initialisiert?
  PRINT "FEHLER: Maschinenprogramm nicht eingelesen! Abbruch!"
  END
 END IF

 DEF SEG = VARSEG(MS%(0))               '** Segment bestimmen
 POKE VARPTR(MS%(0)) + 26, Num%         '** Interrupt-Nummer einsetzen

 CALL ABSOLUTE(AX%, BX%, CX%, DX%, VARPTR(MS%(0))) '** Aufruf

 Interr% = AX%                          '** RÅckgabewert aus AX% Åbernehmen

END FUNCTION

