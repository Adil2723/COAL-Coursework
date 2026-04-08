INCLUDE Irvine32.inc
.data
promptMsg BYTE "Enter your password: ", 0
msgStrong BYTE "Password is Strong.", 0
msgWeak BYTE "Password must include at least 1 digit.", 0
password BYTE 50 DUP(0)
maxLen DWORD 49
.code
main PROC
mov edx, OFFSET promptMsg
call WriteString
mov edx, OFFSET password
mov ecx, maxLen
call ReadString
mov esi, OFFSET password
mov ecx, eax
mov ebx, 0
check_loop:
lodsb
cmp al, 0
je done_check
cmp al, &#39;0&#39;
jb next_char
cmp al, &#39;9&#39;
ja next_char
mov ebx, 1
jmp done_check
next_char:

loop check_loop
done_check:
cmp ebx, 1
je strong
mov edx, OFFSET msgWeak
call WriteString
jmp quit
strong:
mov edx, OFFSET msgStrong
call WriteString
quit:
call Crlf
exit
main ENDP
END main
