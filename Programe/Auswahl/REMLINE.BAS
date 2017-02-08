'
'   Microsoft RemLine - Dienstprogramm zum Entfernen von Zeilennummern
'   Copyright (C) Microsoft Corporation 1985-1991
'
'   Das Programm REMLINE.BAS entfernt die Zeilennummern aus einem
'   Microsoft Basic Programm. BerÅcksichtigt werden nur diejenigen
'   Zeilennummern, die nicht Objekt einer der folgenden Anweisungen
'   sind: GOSUB, RETURN, GOTO, THEN, ELSE, RESUME, RESTORE oder RUN.
'
'   Wenn REMLINE ausgefÅhrt wird, erfragt es den Namen der zu bearbeitenden
'   Datei und den Namen des GerÑts oder der Datei, in die die umformatierte
'   Ausgabe geschrieben wird. Fehlt eine Dateinamenserweiterung, so wird .BAS
'   angenommen (au·er bei AusgabegerÑten). Wenn keine Dateinamen angegeben
'   werden, fordert REMLINE Sie interaktiv an. Sind die beiden Dateinamen
'   identisch, so speichert REMLINE die Originaldatei mit der Erweiterung
'   .BAK ab.
'
'   REMLINE geht von folgenden Annahmen Åber das Programm aus:
'
'     1. Es mu· syntaktisch korrekt sein und mit dem BASICA- oder dem
'         GW-BASIC -Interpreter ausgefÅhrt werden.
'     2. Es ist nicht lÑnger als 400 Zeilen. FÅr grî·ere Dateien mu· die
'         Konstante MaxLines verÑndert werden.
'     3. Die erste Zahl in einer Zeile wird als Zeilennummer angesehen;
'         nachfolgende Zeilen werden deshalb (in einer Compiler-spezifischen
'         Konstruktion) mîglicherweise nicht korrekt behandelt.
'     4. REMLINE kann mit einfachen Anweisungen umgehen, die die ERL Function
'         testen und dabei Vergleichsoperatoren wie =, <, und > enthalten.
'         Zum Beispiel wird die folgende Anweisung korrekt behandelt:
'
'             IF ERL = 100 THEN END
'
'        Zeile 100 wird nicht aus dem Quellcode entfernt. Dagegen werden
'        komplexere AusdrÅcke, die die Operatoren +, -, AND, OR, XOR, EQV,
'        MOD oder IMP enthalten, unter UmstÑnden nicht korrekt abgearbeitet.
'        Zum Beispiel erkennt REMLINE in der folgenden Anweisung die
'        Zeile 105 nicht als referenzierte Zeilennummer und entfernt sie aus
'        dem Quellcode:
'
'             IF ERL + 5 = 105 THEN END
'
'   Wenn Ihnen REMLINE's Ausgabeformat nicht gefÑllt, dann kînnen Sie
'   die Ausgabezeilen in SUB GenOutFile verÑndern. Ein Beispiel ist als
'   Kommentar angegeben.
DEFINT A-Z

' Funktions- und Unterprozedurvereinbarungen
DECLARE FUNCTION GetToken$ (Search$, Delim$)
DECLARE FUNCTION StrSpn% (InString$, Separator$)
DECLARE FUNCTION StrBrk% (InString$, Separator$)
DECLARE FUNCTION IsDigit% (Char$)
DECLARE SUB GetFileNames ()
DECLARE SUB BuildTable ()
DECLARE SUB GenOutFile ()
DECLARE SUB InitKeyTable ()

' Konstanten und globale Daten
CONST TRUE = -1
CONST false = 0
CONST MaxLines = 400

DIM SHARED LineTable!(MaxLines)
DIM SHARED LineCount
DIM SHARED Seps$, InputFile$, OutputFile$, TmpFile$

' Daten zur Keyword-Suche:
CONST KeyWordCount = 9
DIM SHARED KeyWordTable$(KeyWordCount)

KeyData:
   DATA THEN, ELSE, GOSUB, GOTO, RESUME, RETURN, RESTORE, RUN, ERL, ""

' Beginn des Programmcodes auf Modulebene
   Seps$ = " ,:=<>()" + CHR$(9)
   InitKeyTable
   GetFileNames
   ON ERROR GOTO FileErr1
   OPEN InputFile$ FOR INPUT AS 1
   ON ERROR GOTO 0
   COLOR 7: PRINT "Working"; : COLOR 23: PRINT " . . .": COLOR 7: PRINT
   BuildTable
   CLOSE #1
   OPEN InputFile$ FOR INPUT AS 1
   ON ERROR GOTO FileErr2
   OPEN OutputFile$ FOR OUTPUT AS 2
   ON ERROR GOTO 0
   GenOutFile
   CLOSE #1, #2
   IF OutputFile$ <> "CON" THEN CLS

END

FileErr1:
   CLS
   PRINT "      Invalid file name": PRINT
   INPUT "      New input file name (ENTER to terminate): ", InputFile$
   IF InputFile$ = "" THEN END
FileErr2:
   INPUT "      Output file name (ENTER to print to screen) :", OutputFile$
   PRINT
   IF (OutputFile$ = "") THEN OutputFile$ = "CON"
   IF TmpFile$ = "" THEN
      RESUME
   ELSE
      TmpFile$ = ""
      RESUME NEXT
   END IF

'
' BuildTable:
'   Durchsucht die komplette Textdatei nach Zeilennummern, die Objekt von
'   GOTO, GOSUB etc. sind. Jede, die gefunden wird, wird in eine Zeilen-
'   nummerntabelle eingetragen. Bei einem zweiten Durchlauf (siehe
'   GenOutFile) werden alle nicht in dieser Tabelle enthaltenen
'   Zeilennummern entfernt.
' Eingabe:
'   Benutzt die globalen Vereinbarungen KeyWordTable$, KeyWordCount und Seps$
' Ausgabe:
'   VerÑndert die Zeilentabelle! und die Zeilennumerierung.

SUB BuildTable STATIC

   DO WHILE NOT EOF(1)
      ' Zeile und erstes Token lesen
      LINE INPUT #1, InLin$
      Token$ = GetToken$(InLin$, Seps$)
      DO WHILE (Token$ <> "")
         FOR KeyIndex = 1 TO KeyWordCount
            ' öberprÅfen, ob Token und Keyword gleich sind:
            IF (KeyWordTable$(KeyIndex) = UCASE$(Token$)) THEN
               ' Mîgliche Zeilennummer nach dem Keyword bestimmen:
               Token$ = GetToken$("", Seps$)
               ' Jedes Token darauf prÅfen, ob es eine Zeilennummer ist:
               ' (Die Schleife ist wegen den Mehrfachnummern von ON GOSUB
               ' oder ON GOTO erforderlich).
               ' Ein nichtnumerisches Token beendet die Suche.
               DO WHILE (IsDigit(LEFT$(Token$, 1)))
                  LineCount = LineCount + 1
                  LineTable!(LineCount) = VAL(Token$)
                  Token$ = GetToken$("", Seps$)
                  IF Token$ <> "" THEN KeyIndex = 0
               LOOP
            END IF
         NEXT KeyIndex
         ' NÑchstes Token lesen
         Token$ = GetToken$("", Seps$)
      LOOP
   LOOP

END SUB

'
' GenOutFile:
'  Erzeugt als Ausgabe eine Datei, aus der die nicht
'  referenzierten Zeilennummern entfernt sind.
' Eingabe:
'  Benutzt die globalen Vereinbarungen LineTable!, LineCount und Seps$
' Ausgabe:
'  Die bearbeitete Datei
'
SUB GenOutFile STATIC

   ' Beschleunigung der AusfÅhrung durch Beseitigen von Komma und Doppelpunkt
   ' (erstes Token kann nicht getrennt werden).
   Sep$ = " " + CHR$(9)
   DO WHILE NOT EOF(1)
      LINE INPUT #1, InLin$
      IF (InLin$ <> "") THEN
         ' Erstes Token holen und - falls Zeilennummer - bearbeiten.
         Token$ = GetToken$(InLin$, Sep$)
         IF IsDigit(LEFT$(Token$, 1)) THEN
            LineNumber! = VAL(Token$)
            FoundNumber = false
            ' öberprÅfen, ob die Zeilennummer in der Tabelle der
            ' referenzierten Zeilennummern enthalten ist.
            FOR index = 1 TO LineCount
               IF (LineNumber! = LineTable!(index)) THEN
                  FoundNumber = TRUE
               END IF
            NEXT index
            ' Zeilen abÑndern.
            IF (NOT FoundNumber) THEN
               Token$ = SPACE$(LEN(Token$))
               MID$(InLin$, StrSpn(InLin$, Sep$), LEN(Token$)) = Token$
            END IF
              
            ' Um ein neues Ausgabeformat festzulegen, kînnen Sie die
            ' vorangegangenen Zeilen durch Ihren eigenen Programmcode
            ' ersetzen. Versuchen Sie es zum Beispiel mit diesen Zeilen:
               
            'TmpPos1 = StrSpn(InLin$, Sep$) + LEN(Token$)
            'TmpPos2 = TmpPos1 + StrSpn(MID$(InLin$, TmpPos1), Sep$)
            '
            'IF FoundNumber THEN
            '   InLin$ = LEFT$(InLin$, TmpPos1 - 1) + CHR$(9) + MID$(InLin$, TmpPos2)
            'ELSE
            '   InLin$ = CHR$(9) + MID$(InLin$, TmpPos2)
            'END IF

         END IF
      END IF
      ' Zeile in eine Datei  oder auf die Konsole ausgeben
      ' (PRINT arbeitet schneller als das KonsolgerÑt).
      IF OutputFile$ = "CON" THEN
         PRINT InLin$
      ELSE
         PRINT #2, InLin$
      END IF
   LOOP

END SUB

'
' GetFileNames:
'  Fordert  den Benutzer zur Eingabe des Dateinamens auf.
' Eingabe:
'  Benutzereingabe
' Ausgabe:
'  Definiert InputFiles$ und OutputFiles$
'
SUB GetFileNames STATIC

    CLS
    PRINT " Microsoft RemLine: Line Number Removal Utility"
    PRINT "       (.BAS assumed if no extension given)"
    PRINT
    INPUT "      Input file name (ENTER to terminate): ", InputFile$
    IF InputFile$ = "" THEN END
    INPUT "      Output file name (ENTER to print to screen): ", OutputFile$
    PRINT
    IF (OutputFile$ = "") THEN OutputFile$ = "CON"

   IF INSTR(InputFile$, ".") = 0 THEN
      InputFile$ = InputFile$ + ".BAS"
   END IF

   IF INSTR(OutputFile$, ".") = 0 THEN
      SELECT CASE OutputFile$
         CASE "CON", "SCRN", "PRN", "COM1", "COM2", "LPT1", "LPT2", "LPT3"
            EXIT SUB
         CASE ELSE
            OutputFile$ = OutputFile$ + ".BAS"
      END SELECT
   END IF

   DO WHILE InputFile$ = OutputFile$
      TmpFile$ = LEFT$(InputFile$, INSTR(InputFile$, ".")) + "BAK"
      ON ERROR GOTO FileErr1
      NAME InputFile$ AS TmpFile$
      ON ERROR GOTO 0
      IF TmpFile$ <> "" THEN InputFile$ = TmpFile$
   LOOP

END SUB

'
' GetToken$:
'  Holt Tokens aus einer Zeichenkette heraus. Tokens sind Wîrter, die von
'  Trennzeichen umgegeben sind, etwa von Leerzeichen oder Kommata.
'  Tokens werden beim Parsen aus SÑtzen oder Kommandos herausgelîst
'  und analysiert. Um die Funktion GetToken$ zu benutzen, ist beim ersten
'  Aufruf der zu parsende String zu Åbergeben. Geben Sie danach  bei allen
'  weiteren Aufrufen einen Null-String als Parameter an, bis die Funktion
'  einen leeren String ("") als Ergebnis liefert und damit anzeigt, da· der
'  vollstÑndige String geparst wurde.
' Eingabe:
'  Search$ = Zu durchsuchender String
'  Delim$  = Aus Trennzeichen bestehender String
' Ausgabe:
'  GetToken$ = NÑchstes Token
'
FUNCTION GetToken$ (Search$, Delim$) STATIC

   ' Beachten Sie, da· SaveStr$ und BegPos von Aufruf zu Aufruf static
   ' sein mÅssen. (Andere Variablen sind nur aus EffizienzgrÅnden static).
   ' Erzeugen Sie beim ersten Aufruf eine Kopie des String.
   IF (Search$ <> "") THEN
      BegPos = 1
      SaveStr$ = Search$
   END IF
  
   ' Anfang des nÑchsten Token finden.
   NewPos = StrSpn(MID$(SaveStr$, BegPos, LEN(SaveStr$)), Delim$)
   IF NewPos THEN
      ' Position auf Anfang des Token setzen.
      BegPos = NewPos + BegPos - 1
   ELSE
      ' Falls kein neues Token vorliegt, abbrechen und
      ' leeren String ("") zurÅckgeben.
      GetToken$ = ""
      EXIT FUNCTION
   END IF

   ' Ende des Token finden
   NewPos = StrBrk(MID$(SaveStr$, BegPos, LEN(SaveStr$)), Delim$)
   IF NewPos THEN
      ' Position auf Ende des Token setzen.
      NewPos = BegPos + NewPos - 1
   ELSE
      ' Falls das Ende des Token nicht erkannt wurde:
      NewPos = LEN(SaveStr$) + 1
   END IF
   ' Token aus dem zu durchsuchenden String herauslîsen.
   GetToken$ = MID$(SaveStr$, BegPos, NewPos - BegPos)
   ' Neue Anfangsposition setzen.
   BegPos = NewPos

END FUNCTION

'
' InitKeyTable:
'  Initialisiert eine Keyword-Tabelle. Keywords mÅssen erkannt werden, damit
'  Zeilennummern von numerischen Konstanten unterschieden werden kînnen.
' Eingabe:
'  Benutzt KeyData
' Ausgabe:
'  Modifizirt das globale Datenfeld KeyWordTable$
'
SUB InitKeyTable STATIC

   RESTORE KeyData
   FOR Count = 1 TO KeyWordCount
      READ KeyWord$
      KeyWordTable$(Count) = KeyWord$
   NEXT

END SUB

'
' IsDigit:
'  Liefert true, falls das Åbergebene Zeichen eine Dezimalziffer ist.
'  Da in Basic jedes Token, das mit einer Ziffer beginnt, eine Zahl ist,
'  braucht die Funktion nur die erste Ziffer zu ÅberprÅfen. Auf negative
'  Zahlen wird nicht abgeprÅft, aber das ist hier nicht notwendig.
' Eingabe:
'  Char$ - Anfangszeichen des zu ÅberprÅfenden String
' Ausgabe:
'  IsDigit - true, falls zwischen 0 und 9
'
FUNCTION IsDigit (Char$) STATIC

   IF (Char$ = "") THEN
      IsDigit = false
   ELSE
      CharAsc = ASC(Char$)
      IsDigit = (CharAsc >= ASC("0")) AND (CharAsc <= ASC("9"))
   END IF

END FUNCTION

'
' StrBrk:
'  Durchsucht InString$, um das erste Auftreten eines der in Separator$
'  enthaltenen Zeichen zu finden. Liefert den Index dieses Zeichens. Diese
'  Funktion wird benutzt, um das Ende eines Token zu finden.
' Eingabe:
'  InString$ = Zu durchsuchender String
'  Separator$ = Zeichen, nach denen gesucht wird.
' Ausgabe:
'  StrBrk = Index des ersten Zeichens in InString$, das in Separator$
'           enthalten ist,
'           oder 0, falls kein Zeichen aus InString$ in Separator$
'           enthalten ist.
'
FUNCTION StrBrk (InString$, Separator$) STATIC

   Ln = LEN(InString$)
   BegPos = 1
   ' Suche nach dem Ende des Token (erstes Zeichen, das Trennzeichen ist).
   DO WHILE INSTR(Separator$, MID$(InString$, BegPos, 1)) = 0
      IF BegPos > Ln THEN
         StrBrk = 0
         EXIT FUNCTION
      ELSE
         BegPos = BegPos + 1
      END IF
   LOOP
   StrBrk = BegPos
  
END FUNCTION

'
' StrSpn:
'  Durchsucht InString$, um das erste Zeichen zu finden, das nicht in
'  Separator$ enthalten ist. Liefert den Index dieses Zeichens. Diese
'  Funktion wird benutzt, um den Anfang eines Token zu finden.
' Eingabe:
'  InString$ = Zu durchsuchender String
'  Separator$ = Zeichen, nach denen gesucht wird
' Ausgabe:
'  StrSpn = Index des ersten Zeichens in InString$, das nicht in StrSpn
'  enthalten ist, oder 0, falls alle Zeichen aus InString$ in StrSpn
'  enthalten sind.
'
FUNCTION StrSpn% (InString$, Separator$) STATIC

   Ln = LEN(InString$)
   BegPos = 1
   ' Suche nach dem Anfang eines Token (Zeichen, das kein Trennzeichen ist).
   DO WHILE INSTR(Separator$, MID$(InString$, BegPos, 1))
      IF BegPos > Ln THEN
         StrSpn = 0
         EXIT FUNCTION
      ELSE
         BegPos = BegPos + 1
      END IF
   LOOP
   StrSpn = BegPos

END FUNCTION

