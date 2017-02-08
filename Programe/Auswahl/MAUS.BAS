'*** Mausroutinen Åber Interrupt in QBasic ***

DECLARE SUB Maus (OnOff%)
DECLARE SUB MausInit ()
DECLARE SUB GetMaus ()
DECLARE SUB WarteBewegung ()

DECLARE SUB ReadData ()
DECLARE FUNCTION Interr% (Num%, AX%, BX%, CX%, DX%)

DIM SHARED MS%(45)                      '** Feld fÅr Maschinenprogramm
ReadData                                '** Maschinenprogramm einlesen

DIM SHARED MausX%, MausY%, MausK%       '** Mausparameter X/Y/Knopf


 MausInit                               '** Maustreiber initialisieren



MS.Data:        '***** DATAs des Maschinenprogrammes fÅr Interr%()
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
 DATA #

Maus 1

SUB GetMaus
'** Mausposition und -knopfstatus in MausX%, MausY% und MausK% holen

  R% = Interr%(&H33, 3, BX%, CX%, DX%)
 
  MausK% = BX%                  '** Maustaste (1=links, 2=rechts)
  MausX% = CX% / 8 + 1          '** X-Position (Textmodus)
  MausY% = DX% / 8 + 1          '** Y-Position (Textmodus)

END SUB

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

SUB Maus (OnOff%)
'** Mauszeiger an/ausschalten (0=aus, 1=an)

 IF OnOff% = 0 THEN OnOff% = 2 ELSE OnOff% = 1
 R% = Interr%(&H33, OnOff%, BX%, CX%, DX%)

END SUB

SUB MausInit
'** Maustreiber initialisieren

 R% = Interr%(&H33, 0, BX%, CX%, DX%)           '** Maustreiber initialisieren

 R% = Interr%(&H33, 10, 0, &HFFFF, &HFF00)      '** Maushintergrund: blinken

END SUB

SUB MausSet (X%, Y%)
'** Position des Mauszeigers setzen ***
'** X% und Y% sind Zeichenkoordinaten im Textmodus

 R% = Interr%(&H33, 4, BX%, X% * 8 - 8, Y% * 8 - 8)

END SUB

SUB MausTempo (Speed%)
'** Mausgeschwindigkeit einstellen (0=Schnell, 100=extrem langsam)

 R% = Interr%(&H33, 15, BX%, Speed%, Speed% * 2)

END SUB

SUB MausXBereich (X1%, X2%)
'** Mausbewegungsbereich horizontal setzen von X1% bis X2%
'** X1% und X2% sind Zeichenkoordinaten im Textmodus

 R% = Interr%(&H33, 7, 0, X1% * 8 - 8, X2% * 8 - 8)

END SUB

SUB MausYBereich (Y1%, Y2%)
'** Mausbewegungsbereich vertikal setzen von Y1% bis Y2%
'** Y1% und Y2% sind Zeichenkoordinaten im Textmodus

 R% = Interr%(&H33, 8, BX%, Y1% * 8 - 8, Y2% * 8 - 8)

END SUB

SUB ReadData
'** DATAs fÅr Maschinenprogramm in MS%() einlesen

 RESTORE MS.Data
 DEF SEG = VARSEG(MS%(0))

 FOR i% = 0 TO 99
  READ Byte$
  IF Byte$ = "#" THEN EXIT FOR
  POKE VARPTR(MS%(0)) + i%, VAL("&H" + Byte$)
 NEXT i%

END SUB

SUB WarteBewegung
'** Warten, bis Maus bewegt oder Maustaste gedrÅckt/losgelassen

 GetMaus
 X% = MausX%: Y% = MausY%: k% = MausK%

 DO
  GetMaus
 LOOP UNTIL X% <> MausX% OR Y% <> MausY% OR k% <> MausK%

END SUB

SUB WarteKnopfLos
'** Warten, bis Maustaste losgelassen

 WHILE MausK%
  GetMaus
 WEND

END SUB

