DIM oz(130), abk$(130), masse(130), nam$(130), schmelz(130), siede(130), dichte(130), eneg(130), gruppe$(130), peri(130)
RANDOMIZE TIMER
DO
 READ x1, x2$, x3, x4$, x5, x6, x7, x8, x9$
 oz(x1) = x1
 abk$(x1) = x2$
 masse(x1) = x3
 nam$(x1) = x4$
 schmelz(x1) = x5
 siede(x1) = x6
 dichte(x1) = x7
 eneg(x1) = x8
 gruppe$(x1) = x9$
 SELECT CASE x1
 CASE 1 TO 2: peri(x1) = 1
 CASE 3 TO 10: peri(x1) = 2
 CASE 11 TO 18: peri(x1) = 3
 CASE 19 TO 36: peri(x1) = 4
 CASE 37 TO 54: peri(x1) = 5
 CASE 55 TO 86: peri(x1) = 6
 CASE 87 TO 118: peri(x1) = 7
 CASE ELSE: peri(x1) = 8
 END SELECT
LOOP UNTIL x1 = 0
CLS
GOSUB pse
DO                      'gegeben: Ordnungszahl  abgefragt: Symbol
 ein$ = " "
 nr = INT(RND * 130 + 1)
 IF oz(nr) <> 0 THEN
  PRINT "Ordnungszahl: "; oz(nr); "  Symbol: ";
  INPUT "", ein$
  IF UCASE$(ein$) = UCASE$(abk$(nr)) THEN COLOR 10: PRINT "Richtig!       "; abk$(nr); " fÅr "; nam$(nr); " in "; gruppe$(nr)
  IF UCASE$(ein$) <> UCASE$(abk$(nr)) THEN COLOR 12: PRINT "Falsch! Es ist "; abk$(nr); " fÅr "; nam$(nr); " in "; gruppe$(nr); " Periode "; peri(nr)
  COLOR 7
  IF ein$ = "pse" THEN GOSUB pse
 END IF
LOOP UNTIL ein$ = ""

DO                      'gegeben: Symbol  abgefragt: Ordnungszahl
 ein = 1
 nr = INT(RND * 130 + 1)
 IF oz(nr) <> 0 THEN
  PRINT "Symbol:"; abk$(nr); " Ordunngszahl: ";
  INPUT "", ein
  IF ein = oz(nr) THEN COLOR 10: PRINT "Richtig! "; oz(nr); " fÅr "; nam$(nr); " in "; gruppe$(nr)
  IF ein <> oz(nr) THEN COLOR 12: PRINT "Falsch!  Richtig wÑre: "; oz(nr); " fÅr "; nam$(nr); " in "; gruppe$(nr)
  COLOR 7
 END IF
LOOP UNTIL ein = 0




END
DATA   1,H ,  1.01,Wasserstoff,-259,-253, 0.09,2.1,"HG I"
DATA   2,He,  4.00,Helium     ,   0,-269, 0.18,  0,"HG VIII"
DATA   3,Li,  6.94,Lithium    , 181,1330, 0.53,1.0,"HG I"
DATA   4,Be,  9.01,Beryllium  ,1277,2970, 1.85,1.5,"HG II"
DATA   5,B , 10.81,Bor        ,2030,2550, 2.35,2.0,"HG III"
DATA   6,C , 12.01,Kohlenstoff,3550,4830, 2.2 ,2.5,"HG IV"
DATA   7,N , 14.01,Stickstoff ,-210,-196, 1.25,3.0,"HG V"
DATA   8,O , 16.00,Sauerstoff ,-219,-183, 1.43,3.5,"HG VI"
DATA   9,F , 19.00,Fluor      ,-220,-188, 1.7 ,4.0,"HG VII"
DATA  10,Ne, 20.18,Neon       ,-249,-246, 0.9 ,  0,"HG VIII"
DATA  11,Na, 22.99,Natrium    ,  98, 892, 0.97,0.9,"HG I"
DATA  12,Mg, 24.31,Magnesium  , 650,1107, 1.74,1.2,"HG II"
DATA  13,Al, 26.98,Aluminium  , 660,2450, 2.70,1.5,"HG III"
DATA  14,Si, 28.09,Silicium   ,1410,2680, 2.33,1.8,"HG IV"
DATA  15,P , 30.97,Phosphor   ,  44, 280, 1.82,2.1,"HG V"
DATA  16,S , 32.06,Schwefel   , 119, 445, 2.07,2.5,"HG VI"
DATA  17,Cl, 35.45,Chlor      ,-101, -35, 3.2 ,3.0,"HG VII"
DATA  18,Ar, 39.95,Argon      ,-198,-196, 1.78,  0,"HG VIII"
DATA  19,K , 39.10,Kalium     ,    ,    ,     ,   ,"HG I"
DATA  20,Ca, 40.08,Calcium    ,    ,    ,     ,   ,"HG II"

DATA  31,Ga, 69.72,Gallium    ,    ,    ,     ,   ,"HG III"
DATA  32,Ge, 72.59,Germannium ,    ,    ,     ,   ,"HG IV"
DATA  33,As, 74.92,Arsen      ,    ,    ,     ,   ,"HG V"
DATA  34,Se, 78.96,Selen      ,    ,    ,     ,   ,"HG VI"
DATA  35,Br, 79.90,Brom       ,    ,    ,     ,   ,"HG VII"
DATA  36,Kr, 83.80,Krypton    ,    ,    ,     ,   ,"HG VIII"
DATA  37,Rb, 85.47,Rubidium   ,    ,    ,     ,   ,"HG I"
DATA  38,Sr, 87.62,Strontium  ,    ,    ,     ,   ,"HG II"

DATA  49,In,114.82,Indium     ,    ,    ,     ,   ,"HG III"
DATA  50,Sn,118.69,Zinn       ,    ,    ,     ,   ,"HG IV"
DATA  51,Sb,121.75,Antimon    ,    ,    ,     ,   ,"HG V"
DATA  52,Te,127.60,Tellur     ,    ,    ,     ,   ,"HG VI"
DATA  53,I ,126.90,Iod        ,    ,    ,     ,   ,"HG VII"
DATA  54,Xe,131.29,Xenon      ,    ,    ,     ,   ,"HG VIII"
DATA  55,Cs,132.91,Caesium    ,    ,    ,     ,   ,"HG I"
DATA  56,Ba,137.33,Barium     ,    ,    ,     ,   ,"HG II"

DATA  81,Tl,204.38,Thallium   ,    ,    ,     ,   ,"HG III"
DATA  82,Pb,207.20,Blei       ,    ,    ,     ,   ,"HG IV"
DATA  83,Bi,208.98,Bismut     ,    ,    ,     ,   ,"HG V"
DATA  84,Po,209   ,Polonium   ,    ,    ,     ,   ,"HG VI"
DATA  85,At,210   ,Astat      ,    ,    ,     ,   ,"HG VII"
DATA  86,Rn,222   ,Radon      ,    ,    ,     ,   ,"HG VIII"

DATA  87,Fr,223   ,Francium   ,    ,    ,     ,   ,"HG I"
DATA  88,Ra,226.03,Radium     ,    ,    ,     ,   ,"HG II"
DATA 118,M , 18.02,YerbaMate  ,    ,    ,     ,   ,"HG VIII"
DATA    ,  ,      ,           ,    ,    ,     ,   ,
DATA 0                                       



pse:
COLOR 7
PRINT "    1   2      3   4   5   6   7   8"
PRINT "1  H                              He"
PRINT "2  Li  Be     B   C   N   O   F   Ne"
PRINT "3  Na  Mg     Al  Si  P   S   Cl  Ar"
PRINT "4  K   Ca ... Ga  Ge  As  Se  Br  Kr"
PRINT "5  Rb  Sr ... In  Sn  Sb  Te  I   Xe"
PRINT "6  Cs  Ba ... Tl  Pb  Bi  Po  At  Rn"
PRINT "7  Fr  Ra ..."
RETURN

