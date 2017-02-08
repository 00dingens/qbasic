DIM a%(2)
DEF SEG = VARSEG(a%(0))
FOR i% = 0 TO 2
 READ d%
 POKE VARPTR(a%(0)) + i%, d%
NEXT i%
DATA 205, 5, 203  : ' int 5  retf  'Code in Maschinesprache
                                   'zum Drucken des Bildschirminhalts.
CALL ABSOLUTE(VARPTR(a%(0)))
DEF SEG

