INCLUDE Irvine32.inc 
 
.data 
base EQU 8 
height = 5 
area DWORD ? 
 
.code 
main PROC 
    mov eax, base 
    imul eax, height    ; eax = base * height 
    mov ebx, 2 
    cdq 
    idiv ebx            ; eax = (base * height)/2 
    mov area, eax 
 
    ; Display result 
    mov eax, area 
    call WriteInt 
    call Crlf 
 
    exit 
main ENDP 
END main 
