DECLARE SUB QuickSort (Feld%(), anfindex%, endindex%)
SCREEN 13
CONST feldlaenge = 16000
DIM Feld%(1 TO feldlaenge)
DO
 RANDOMIZE TIMER
 x = 0: y = 0
 FOR i = 1 TO feldlaenge
  Feld%(i) = INT(RND * 256 * 50)
  PSET (x, y), Feld%(i)
  x = x + 1
  IF x = 320 THEN x = 0: y = y + 1
 NEXT i
 CALL QuickSort(Feld%(), 1, feldlaenge)
 x = 0: y = 100
 FOR i = 1 TO feldlaenge
  PSET (x, y), Feld%(i) MOD 256
  x = x + 1
  IF x = 320 THEN x = 0: y = y + 1
 NEXT i
 t$ = INKEY$
LOOP UNTIL t$ <> ""

SUB QuickSort (Feld%(), anfindex%, endindex%)
von% = anfindex%
bis% = endindex%
mittelelement% = Feld%((anfindex% + endindex%) \ 2)
DO
 WHILE Feld%(von%) < mittelelement%: von% = von% + 1: WEND
 WHILE Feld%(bis%) > mittelelement%: bis% = bis% - 1: WEND
 IF von% <= bis% THEN
 SWAP Feld%(von%), Feld%(bis%)
  von% = von% + 1
  bis% = bis% - 1
 END IF
LOOP UNTIL von% > bis%
IF anfindex% < bis% THEN CALL QuickSort(Feld%(), anfindex%, bis%)
IF endindex% > von% THEN CALL QuickSort(Feld%(), von%, endindex%)
END SUB

