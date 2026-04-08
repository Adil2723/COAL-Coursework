INCLUDE Irvine32.inc
.data
promptMsg BYTE "Enter a string: ", 0
resultMsg BYTE "String without spaces: ", 0
inputStr BYTE 80 DUP(0)
outputStr BYTE 80 DUP(0)
maxLen DWORD 79
.code
main PROC
mov edx, OFFSET promptMsg
call WriteString
mov edx, OFFSET inputStr
mov ecx, maxLen
call ReadString
mov esi, OFFSET inputStr
mov edi, OFFSET outputStr
mov ecx, eax
remove_spaces:
lodsb
cmp al, 0
je done
cmp al, &#39; &#39;
je skip_space
stosb
skip_space:
loop remove_spaces
done:
mov al, 0
stosb
call Crlf
mov edx, OFFSET resultMsg
call WriteString
mov edx, OFFSET outputStr
call WriteString
call Crlf
exit

main ENDP
END main
