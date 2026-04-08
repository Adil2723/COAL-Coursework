INCLUDE Irvine32.inc
.data
numbers DWORD 21, 14, 9, 6, 18, 25, 30, 11, 12, 15
msgResult BYTE &quot;Smallest number that is a multiple of 3: &quot;,0
msgNone BYTE &quot;No number is a multiple of 3.&quot;,0
minNum DWORD 99999
found DWORD 0
.code
main PROC
mov ecx, LENGTHOF numbers
mov esi, OFFSET numbers
pushLoop:
push [esi]
add esi, TYPE numbers
loop pushLoop
mov ecx, LENGTHOF numbers
popLoop:
pop eax
mov ebx, eax
mov edx, 0
mov edi, 3
div edi
cmp edx, 0
jne notMultiple
mov found, 1
mov eax, ebx
cmp eax, minNum
jge notMultiple

mov minNum, eax
notMultiple:
loop popLoop
cmp found, 0
je noMultiple
mov edx, OFFSET msgResult
call WriteString
mov eax, minNum
call WriteInt
call Crlf
jmp done
noMultiple:
mov edx, OFFSET msgNone
call WriteString
call Crlf
done:
exit
main ENDP
END main
