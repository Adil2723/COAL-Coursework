INCLUDE Irvine32.inc

.data
a DWORD 3
b DWORD 5
varc DWORD ?
d DWORD ?
msg BYTE &quot;Value of d = &quot;, 0
.code
main PROC
call Function1
call Function2
mov edx, OFFSET msg
call WriteString
mov eax, d
call WriteInt
call Crlf
exit
main ENDP
Function1 PROC ; c = a * (b + 20)
mov eax, b
add eax, 20
mov ebx, a
imul eax, ebx
mov varc, eax
ret
Function1 ENDP
Function2 PROC ; d = (c * 10) / (a + b - 10)
mov eax, varc
imul eax, 10
mov ebx, a
add ebx, b
sub ebx, 10
cdq
idiv ebx
mov d, eax
ret
Function2 ENDP
END main
