.model tiny
.code
;dieses programm ist für einen speziellen einsatz innerhalb eines
;anderen programmes geschrieben. alleine ist es nicht lauffähig.
;Voraussetzung: bildschirm 13 ist mit punkten gefüllt, am besten nach zufall

;für bildschirmspeicherstelle
mov ax,0a000
mov es,ax

;a Schleife
mov w va,0
schla:

;b Schleife
mov w vb,0
schlb:

;x Schleife
mov ax,va
mov vx,ax
schlx:

;y Schleife
mov ax,vb
mov vy,ax
schly:

mov w pkt,0

;v Schleife
mov w vv,0
schlv:

;w Schleife
mov w vw,0
schlw:


;koordinaten zum ablesen zusammenzählen
mov ax,vb
add ax,vy
add ax,vw
mov cx,320
mul cx
add ax,va
add ax,vx
add ax,vv
mov bx,ax
xor ah,ah
es:
mov al,[bx]
add pkt,ax  ;wert zum farbwertzähler dazu


;ende w Schleife
mov ax,vw
inc ax
mov vw,ax
cmp ax,5
jl schlw


;ende v Schleife
mov ax,vv
inc ax
mov vv,ax
cmp ax,5
jl schlv


;punkt setzen
;weiss oder schwarz?
mov ax,pkt
cmp ax,3188         ;3187,5 ist die mitte
jl klein
mov dx,0ffffh
jmp gross
klein:
xor dx,dx
gross:
mov pkt,dx

;koordinaten zusammenzählen
mov ax,vb
add ax,vy
mov cx,320
mul cx
add ax,va
add ax,vx
add ax,642
mov bx,ax
mov dx,pkt
es:
mov [bx],dl  ;punkt setzen


;ende y Schleife
mov cx,vb
add cx,197
mov ax,vy
add ax,5
mov vy,ax
cmp ax,cx
jge scy
jmp schly
scy:

;ende x Schleife
mov cx,va
add cx,319
mov ax,vx
add ax,5
mov vx,ax
cmp ax,cx
jge scx
jmp schlx
scx:

;ende b Schleife
mov ax,vb
inc ax
mov vb,ax
cmp ax,5
jge scb
jmp schlb
scb:

;ende a Schleife
mov ax,va
inc ax
mov va,ax
cmp ax,5
jge sca
jmp schla
sca:

;2 zeilen kopieren
mov cx,640
kop:
mov bx,62720
add bx,cx
es:
mov dl,[bx]
mov bx,cx
es:
mov [bx],dl
loop kop

retf
;ende


.data

va	dw 0 ;schleifenzähler
vb	dw 0
vx	dw 0
vy	dw 0
vv	dw 0
vw	dw 0

xx	dw 0 ;pixelkoordinaten
yy	dw 0

pkt	dw 0 ;farbenzähler

end