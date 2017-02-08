
'Spiel von Thorsten

30 CLS
RESTORE
CLEAR
COLOR 11, 0
PRINT "                       MENö"
PRINT "                 ---------------"
PRINT ""
COLOR 14, 0
PRINT "                 1 Simpson - Quiz"
PRINT ""
COLOR 13, 0
PRINT "                 2 WÅnsch Dir was"
PRINT ""
COLOR 2, 0
PRINT "                 3 Programm beenden"
PRINT ""
PRINT ""
COLOR 15, 0
50 INPUT "?", i%
IF i% = 1 THEN GOTO 10
IF i% = 2 THEN GOTO 20
IF i% = 3 THEN GOTO 40
IF i% > 3 THEN GOTO 50
IF i% < 1 THEN GOTO 50

10 CLS
COLOR 12, 0
PRINT "                                  "
PRINT "                                    "
PRINT "                                    "
PRINT "                                    "
PRINT "                                  "
PRINT ""
PRINT ""
PRINT ""
COLOR 14, 0
PRINT "                                 "
PRINT "                                        "
PRINT "                             "
PRINT "                                                   "
PRINT "                                      "
SLEEP 2
COLOR 14, 0
PRINT "*****************************************************************************"
PRINT "*                    DAS GROSSE SIMPSONS - QUIZ                             * "; ""
PRINT "*****************************************************************************"
PRINT "               Nicht nur was fÅr eingefleischte Fans !!!"
PRINT "                                                          "
PRINT ""
COLOR 12, 0
PRINT "                                                        ∏by Thorsten Friesen "
PRINT ""
COLOR 14, 0
SLEEP 3
 CLS
COLOR 13, 0
PRINT "                                Level 1"
PRINT "                                -------"
COLOR 14, 0
FOR k = 1 TO 5
 PRINT
 READ f$, a1$, a2$, a3$, z
 PRINT f$: PRINT
 PRINT "1 "; a1$
 PRINT "2 "; a2$
 PRINT "3 "; a3$
410 INPUT "Welche Antwort ist richtig"; r
CLS
 IF r > 3 OR r < 1 THEN 410
 IF r = z THEN PRINT "Richtig": GOTO 420
 IF r > 3 OR r = 0 THEN 410
 PRINT "Leider falsch !": f = f + 1
 IF z = 1 THEN r$ = a1$: GOTO 415
 IF z = 2 THEN r$ = a2$: GOTO 415
 r$ = a3$
415 PRINT "Richtig wÑre gewesen:"; r$
420 NEXT
PRINT : PRINT : PRINT
 PRINT 5 - f; "richtige Antworten"
 PRINT f; "falsche Antworten"
 IF 5 - f = 5 THEN GOTO 15 ELSE 45
35 CLS
PRINT "                          |   |   |   |   | "
PRINT "                        |   |   |   |   |   |"
PRINT "                        |                   |"
PRINT "                        |                   |"
PRINT "                        |                   |"
PRINT "                       0000  0000           |  "
PRINT "                      0    00    0          |"
PRINT "                      0  O 00  O 0         000"
PRINT "                       0000  0000          000"
PRINT "                       |                    |"
PRINT "                      |___                  |"
PRINT "                         |                  |"
PRINT "                        |                   |       "
PRINT "                       |                    |"
PRINT "                        ||||||||||||        |"
PRINT "                           |                |"
PRINT "                            |               |"
PRINT "                             ||||||||||||||||"
 
END

DATA Wie hei·t die Frau mit der hohen Turmfrisur
DATA Marge, Margot, Maria, 1
DATA "Wie hei·en die beiden Zeichentrickfiguren, die dauernd versuchen sich           totzuschlagen?"
DATA Bart und Lisa, Itchy und Scratchy, Tom und Jerry, 2
DATA Was ist Maggies Lieblingsspielzeug
DATA Ball, Teddy, Schnuller,3
DATA Wo arbeitet Homer
DATA Bar, Atomkraftwerk, Polizist,2
DATA Wo wohnen die Simpsons
DATA Cleveland, Washington, Springfield, 3

15 COLOR 13, 0
PRINT "                                LEVEL 2"
PRINT "                                -------"
COLOR 14, 0
FOR k = 1 TO 5
 PRINT
READ f$, a1$, a2$, a3$, z
 PRINT f$: PRINT
 PRINT "1 "; a1$
 PRINT "2 "; a2$
 PRINT "3 "; a3$
310 INPUT "Welche Antwort ist richtig"; r
CLS
 IF r > 3 OR r < 1 THEN 310
 IF r = z THEN PRINT "Richtig": GOTO 320
 IF r > 3 OR r = 0 THEN 310
PRINT "Leider falsch !": f = f + 1
 IF z = 1 THEN r$ = a1$: GOTO 315
 IF z = 2 THEN r$ = a2$: GOTO 315
 r$ = a3$
315 PRINT "Richtig wÑre gewesen:"; r$
320 NEXT
PRINT : PRINT : PRINT
 PRINT 5 - f; "richtige Antworten"
 PRINT f; "falsche Antworten"
 IF 5 - f = 5 THEN GOTO 25 ELSE 45

DATA Wie hei·t Barts grî·tes Idol
DATA Otto, Jimbo, Krusty,3
DATA Wie hei·t der Hund der Simpsons
DATA Nikolaus, Knecht Ruprecht, Rex,2
DATA Wohin geht Homer am liebsten
DATA Moe, Apu, Flanders, 1
DATA Wie hei·en die beiden Schwestern von Marge
DATA Patty und Selma, Kitty und Gitta, Lise und Lotti, 1
DATA Was ist Homers Lieblingsbier
DATA Warsten, Duff, Alpbeer,2

25 COLOR 13, 0
 PRINT "                               LEVEL 3 "
 PRINT "                               -------  "
COLOR 14, 0
FOR k = 1 TO 5
 PRINT
READ f$, a1$, a2$, a3$, z
 PRINT f$: PRINT
 PRINT "1 "; a1$
 PRINT "2 "; a2$
 PRINT "3 "; a3$
210 INPUT "Welche Antwort ist richtig"; r
CLS
 IF r > 3 OR r < 1 THEN 210
 IF r = z THEN PRINT "Richtig": GOTO 220
 IF r > 3 OR r = 0 THEN 210
PRINT "Leider falsch !": f = f + 1
 IF z = 1 THEN r$ = a1$: GOTO 215
 IF z = 2 THEN r$ = a2$: GOTO 215
 r$ = a3$
215 PRINT "Richtig wÑre gewesen:"; r$
220 NEXT
PRINT : PRINT : PRINT
 PRINT 5 - f; "richtige Antworten"
 PRINT f; "falsche Antworten"
 IF 5 - f = 5 THEN GOTO 35 ELSE 45

DATA Und wo haben sie Knecht Ruprecht gefunden
DATA Hunderennen, Stra·e, Tierheim, 1
DATA Wie hei·t Mr. Smithers Vorgesetzer
DATA Mr. Burns, Mr. Skinner, Mr. Quimby,1
DATA Und wie hei·t Mr. Burns mit Vornamen
DATA Morton, Montgomery, Marvin, 2
DATA Wie hei·t der BÅrgermeister von Springfield
DATA Wiggam, Quimby, Millhaus,2
DATA Wie hei·t die Lieblingssendung von Petty und Selma
DATA MacGyver, Matlock, Roseanne, 1

45 COLOR 12, 0
PRINT "SCHADE Du hast es nicht bis zum Schlu· geschafft.Du solltest îfters die Simpsons Kucken !!!"
COLOR 14, 0
85 INPUT "Nochmal 1=j 2=n ?", a%
IF a% = 1 THEN GOTO 30
IF a% = 2 THEN GOTO 75
IF a% > 2 THEN GOTO 85
IF a% = 0 THEN GOTO 85
75 END


20 CLS
COLOR 14, 0
PRINT "*******************************************************************************"
PRINT "*                             WöNSCH DIR WAS DU PENNER                        *"
PRINT "*****************************************************************************+*"
COLOR 12, 0
PRINT ""
PRINT ""
PRINT "Wovon hast du in der letzten Nacht getrÑumt?"
60 INPUT "Gib eine Zahl zwischen 1 und 25 ein", i%
IF i% > 25 THEN GOTO 60
PRINT ""
IF i% = 1 THEN PRINT "Einmal in Dagobert Ducks Geldspeicher geschwommen zu haben"
IF i% = 2 THEN PRINT "Du hÑttest den KÅhlschrank geîffnet und eine riesengro·e KÅchenschabe kam dir entgegen"
IF i% = 3 THEN PRINT "Du wÑrst in ein gro·es Nutellaglas gefallen"
IF i% = 4 THEN PRINT "Du wÑrst in einem gro·en Glas gefangen gewesen"
IF i% = 5 THEN PRINT "Es wÅrden vier gro·e Dinosaurier hinter dir herlaufen"
IF i% = 6 THEN PRINT "Ein gro·er Wal hÑtte dich aufgefressen"
IF i% = 7 THEN PRINT "Du wÑrst in einem Meer aus Cola ertrunken"
IF i% = 8 THEN PRINT "Man hÑtte dich in einem Briefumschlag einmal um die Welt geschickt"
IF i% = 9 THEN PRINT "Du wÅrdest in einem Kartenhaus wohnen"
IF i% = 10 THEN PRINT "Du wÅrdest Fallschirmspringen, doch leider ohne Fallschirm"
IF i% = 11 THEN PRINT "Ein riesiger Hamburger wÅrde dich verfolen"
IF i% = 12 THEN PRINT "Auf deinem FrÅhstÅckstisch wÅrden lauter SchokoladenplÑtzchen liegen"
IF i% = 13 THEN PRINT "Du wÑrst auf einem Haufen Butter ausgerutscht"
IF i% = 14 THEN PRINT "Man hÑtte dir Hunderte von Kaugummis an den Kopf gehÑngt"
IF i% = 15 THEN PRINT "Eine Weintraube hÑtte dich K.O. geschlagen"
IF i% = 16 THEN PRINT "Die TÅr der Schultoilette lie·e sich nicht îffnen"
IF i% = 17 THEN PRINT "Man hÑtte dich auf einer WÑscheleine aufgehangen"
IF i% = 18 THEN PRINT "Du befÑndest dich in einem KÑnguruhbeutel"
IF i% = 19 THEN PRINT "Eine Fee kÑme und wÅrde dir drei WÅnsche erfÅllen"
IF i% = 20 THEN PRINT "Du wÅrdest in deinen schlechtesten FÑchern nur noch einser schreiben"
IF i% = 21 THEN PRINT "Du kînntest zaubern"
IF i% = 22 THEN PRINT "Du wÑrst Bundeskanzler geworden"
IF i% = 23 THEN PRINT "Dein TeddybÑr hÑtte dich umgebracht"
IF i% = 24 THEN PRINT "Du stÑndest als Gartenzwerg im Rosenbeet"
IF i% = 25 THEN PRINT "Du seist ins Aquarium gefallen und beinahe ertrunken"

PRINT "________________________________________________________________________________"
PRINT ""
PRINT ""
COLOR 3, 0
PRINT "Was ist deine Lieblingsband?"
70 INPUT "Gib eine Zahl zwischen 1 und 25 ein", k%
IF i% > 25 THEN GOTO 70
PRINT ""
IF k% = 1 THEN PRINT "Die Backstreetboys, weil deine Freundin von ihnen schwÑrmt"
IF k% = 2 THEN PRINT "Guildo, weil er dich lieb hat"
IF k% = 3 THEN PRINT "Heino, wegen deiner schînen Sonnenbrille"
IF k% = 4 THEN PRINT "BlÅmchen, weil du so ein gro·er Sesamstra·en - Fan bist"
IF k% = 5 THEN PRINT "Tic Tac Two, weil sie einen dritten SÑnger brauchen "
IF k% = 6 THEN PRINT "Spice Girls, weil du so chaotisch bist"
IF k% = 7 THEN PRINT "Captain Jack, weil du zur Bundeswehr willst"
IF k% = 8 THEN PRINT "Der Wolf, weil du so gerne Kuchen backst"
IF k% = 9 THEN PRINT "Michael Jackson, weil dir eine Schînheitsoperation nicht schaden wÅrde"
IF k% = 10 THEN PRINT "Sabrina Setlur, weil du gerne frei sein willst"
IF k% = 11 THEN PRINT "Die Fantastischen Vier, weil du gerne Picknick machst"
IF k% = 12 THEN PRINT "Caught in the Act, weil du unzertrennlich bist"
IF k% = 13 THEN PRINT "Kelly Family, wegen deiner langen Haare"
IF k% = 14 THEN PRINT "Aqua, weil du so gerne mit Barbies spielst"
IF k% = 15 THEN PRINT "No Mercy, weil du ohne deine Gitarre nicht leben kannst"
IF k% = 16 THEN PRINT "Fettes Brot, weil du so viele Silberfische in deinem Haus hast"
IF k% = 17 THEN PRINT "H - Blockx, weil du Ameisen sammelst"
IF k% = 18 THEN PRINT "Coolio, weil du so cool bist"
IF k% = 19 THEN PRINT "The Bates, weil du so Schizophren bist (Film: Psycho)"
IF k% = 20 THEN PRINT "Lotto King Karl, weil du im Lotto gewonnen hast"
IF k% = 21 THEN PRINT "Die Prinzen, weil du gerne klaust"
IF k% = 22 THEN PRINT "Stefan Raab, weil du gerne Die Sendung mit der Maus guckst"
IF k% = 23 THEN PRINT "2 PAC, weil du um ihn trauerst"
IF k% = 24 THEN PRINT "R ÔnÔ G, weil du auf die Sonne wartest"
IF k% = 25 THEN PRINT "Ginuwine, weil du gerne auf deinem Pony reitest"

PRINT "___________________________________________________________________________"
PRINT ""
PRINT ""
COLOR 10, 0
PRINT "Was ist deine LieblingsbeschÑftigung?"
80 INPUT "Gib eine Zahl zwischen 1 und 25 ein", l%
IF i% > 25 THEN GOTO 80
PRINT ""
IF l% = 1 THEN PRINT "In der Nase bohren"
IF l% = 2 THEN PRINT "Vor einer riesigen Portion Eis zu sitzen"
IF l% = 3 THEN PRINT "Hemden bÅgeln"
IF l% = 4 THEN PRINT "Von morgens bis abends Fu·ball spielen"
IF l% = 5 THEN PRINT "Meine Haare zÑhlen"
IF l% = 6 THEN PRINT "RegenwÅrmer sammeln"
IF l% = 7 THEN PRINT "Mit den Enten im Teich schwimmen zu gehen"
IF l% = 8 THEN PRINT "Auf einer Gie·kanne Musik zu machen"
IF l% = 9 THEN PRINT "Die Treppen vom Kîlner Dom rauf und runter zu laufen"
IF l% = 10 THEN PRINT "Tee mit dem Lîffel zu trinken"
IF l% = 11 THEN PRINT "Suppe mit der Gabel zu essen"
IF l% = 12 THEN PRINT "Auf einem Bein hÅpfen und Lieder singen"
IF l% = 13 THEN PRINT "FahrplÑne auswendig lernen"
IF l% = 14 THEN PRINT "Obstaufkleber sammeln"
IF l% = 15 THEN PRINT "Kakteen pflÅcken"
IF l% = 16 THEN PRINT "Kleine Kinder auf dem Balkon einzusperren"
IF l% = 17 THEN PRINT "Die HÑnde waschen"
IF l% = 18 THEN PRINT "Vor dem Essen Gitarre zu spielen"
IF l% = 19 THEN PRINT "GartenhÑuser aufzurÑumen"
IF l% = 20 THEN PRINT "Schlafen"
IF l% = 21 THEN PRINT "Auf FlohmÑrkte gehen"
IF l% = 22 THEN PRINT "KlingelmÑnnchen zu spielen"
IF l% = 23 THEN PRINT "Im Schlafanzug herumzulaufen"
IF l% = 24 THEN PRINT "Das Alphabet aufzusagen"
IF l% = 25 THEN PRINT "In der HundhÅtte zu schlafen"

PRINT "_________________________________________________________________________"
PRINT ""
PRINT ""
COLOR 9, 0
PRINT "Welcher Blume oder welchem Tier gleichst du?"
90 INPUT "Gib eine Zahl zwischen 1 und 25 ein", j%
IF i% > 25 THEN GOTO 90
PRINT ""
IF j% = 1 THEN PRINT "Dem Affen, weil du soviel rumhampelst"
IF j% = 2 THEN PRINT "Dem Elefanten, weil du soviel i·t"
IF j% = 3 THEN PRINT "Der Rose, weil du so gut riechst"
IF j% = 4 THEN PRINT "Der Tulpe, weil deine Haare so hoch stehen"
IF j% = 5 THEN PRINT "Dem Elefanten, weil du so gerne in PorzellanlÑden gehst"
IF j% = 6 THEN PRINT "Dem KÑnguruh, weil du so hoch hÅpfst"
IF j% = 7 THEN PRINT "Dem Papagei, weil du immer alles nach plapperst"
IF j% = 8 THEN PRINT "Dem Delphin, weil du gerne schwimmst"
IF j% = 9 THEN PRINT "Der Kuh, weil du so wahnsinnig bist"
IF j% = 10 THEN PRINT "Dem Stinktier, weil du so selten badest"
IF j% = 11 THEN PRINT "Dem Affen, weil du so behaart bist"
IF j% = 12 THEN PRINT "Dem Hasen, weil du so gerne Ostereier versteckst"
IF j% = 13 THEN PRINT "Der Giraffe, wegen deines langen Halses"
IF j% = 14 THEN PRINT "Dem Hund, wegen deiner platten Schnauze"
IF j% = 15 THEN PRINT "Der Maus, weil du so eine pipsige Stimme hast"
IF j% = 16 THEN PRINT "Der Katze, weil du dich so gerne Streicheln lÑsst"
IF j% = 17 THEN PRINT "Dem Kaktus, weil du so stichelig bist"
IF j% = 18 THEN PRINT "Dem Hamster, weil du so viel in dir behÑlst"
IF j% = 19 THEN PRINT "Dem SiebenschlÑfer, weil du so lange schlÑfst"
IF j% = 20 THEN PRINT "Dem Elefant, wegen deiner langen Nase"
IF j% = 21 THEN PRINT "Dem Gorilla, wegen deinem GebrÅll"
IF j% = 22 THEN PRINT "Dem BÑr, weil du so gerne Honig i·t"
IF j% = 23 THEN PRINT "Der Biene, weil du so flei·ig bist"
IF j% = 24 THEN PRINT "Der Ameise, wegen deiner StÑrke"
IF j% = 25 THEN PRINT "Der Schlange, weil du alles in dich hineinschlingst"
PRINT ""
PRINT ""
PRINT ""
PRINT ""
COLOR 14, 0
PRINT "                                          ∏ by Thorsten Friesen "
PRINT "                                          ~~~~~~~~~~~~~~~~~~~~~~"
SLEEP 6
PRINT "DANKE an ALLE, die mir mit kleinen TIPS und ANTWORTEN zu WöNSCH DIR WAS zu SEITE standen !!!"
PRINT ""
COLOR 3, 0
PRINT ""
PRINT "Thorsten Friesen"
PRINT "Thorsten Friesen"
PRINT "Thorsetn Friesen"
PRINT "Thorsten friesen"
PRINT "Thorsten Friesen"
SLEEP 5
GOTO 30

40 PRINT "Wie du willst schon aufhîren Rafael du Penner , ICH INFORMATIKER sage dir du Arsch!!"

END

