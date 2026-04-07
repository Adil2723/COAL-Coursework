.386 
.model flat, stdcall 
option casemap:none 
INCLUDE Irvine32.inc 
includelib Irvine32.lib 
.data 
A       DWORD 5 
B       DWORD 7 
valC    DWORD 3        
RESULT  DWORD ? 
.code 
main PROC 
mov eax, A 
add eax, B        
;  
C 
 ; eax = A + B 
mov ebx, valC 
shl ebx, 1         
sub eax, ebx       
; ebx = C * 2 
; eax = (A + B) - (C * 2) 
mov RESULT, eax 
; Display result 
mov eax, RESULT 
call WriteInt 
call Crlf 
exit 
main ENDP 
END main 
