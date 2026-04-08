INCLUDE Irvine32.inc
.data
sum DWORD 0
count DWORD 0
msgPrompt BYTE &quot;Enter a number (0 to stop): &quot;, 0
msgResult BYTE &quot;The sum of entered numbers is: &quot;, 0
.code
main PROC
mov sum, 0
mov count, 0
mov ecx, 10
L1:
mov edx, OFFSET msgPrompt
call WriteString
call ReadInt
cmp eax, 0
je done_input
add sum, eax
inc count
loop L1
done_input:
mov edx, OFFSET msgResult
call WriteString
mov eax, sum
call WriteInt
call Crlf
exit
main ENDP
END main
