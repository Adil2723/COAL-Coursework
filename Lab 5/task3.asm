INCLUDE Irvine32.inc
.data
msgCode BYTE &quot;Enter patient status code (From 0 to 255): &quot;, 0
msgUrgent BYTE &quot;Status: Urgent&quot;, 0
msgIntermediate BYTE &quot;Status: Intermediate&quot;, 0
msgTrivial BYTE &quot;Status: Trivial&quot;, 0
masks BYTE 1, 2, 4, 8, 16, 32, 64, 128
count BYTE ?
.code
main PROC
mov edx, OFFSET msgCode
call WriteString
call ReadInt
mov bl, al
xor ecx, ecx
xor eax, eax
check_bits:
cmp ecx, LENGTHOF masks
jge done_count
mov dl, masks[ecx]
test bl, dl
jz skip_inc
inc al
skip_inc:
inc ecx
jmp check_bits
done_count:
mov count, al
cmp al, 5
jg urgent

cmp al, 3
jge intermediate
jmp trivial
urgent:
mov edx, OFFSET msgUrgent
call WriteString
jmp finish
intermediate:
mov edx, OFFSET Intermediate
call WriteString
jmp finish
trivial:
mov edx, OFFSET msgTrivial
call WriteString
finish:
call Crlf
exit
main ENDP
END main
