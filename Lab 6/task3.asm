INCLUDE Irvine32.inc
.data
prompt BYTE &quot;Enter a number (0-12): &quot;, 0
outputMsg BYTE &quot;Factorial is: &quot;, 0
buffer BYTE 10 DUP(0) ; buffer for input string
invalidMsg BYTE &quot;Invalid input. Enter number between 0 and 12.&quot;, 0
.code
main PROC
mov edx, OFFSET prompt
call WriteString
call ReadInt
mov ecx, eax
cmp ecx, 0
jl InvalidInput
cmp ecx, 12
jg InvalidInput
mov eax, 1
mov ebx, ecx
factorial_loop:
cmp ebx, 1
jle factorial_done
mul ebx
dec ebx
jmp factorial_loop
factorial_done:

mov edx, OFFSET outputMsg
call WriteString
call WriteDec
call Crlf
jmp ExitProgram
InvalidInput:
mov edx, OFFSET invalidMsg
call WriteString
call Crlf
ExitProgram:
exit
main ENDP
