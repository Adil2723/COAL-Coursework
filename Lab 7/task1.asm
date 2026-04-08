INCLUDE Irvine32.inc
.data
prompt1 BYTE "Enter a 16-bit value: ";, 0
prompt2 BYTE "Enter the rotation key (1-7): ". 0
encrypted BYTE "Encrypted value (after left rotation):", 0
decrypted BYTE "Decrypted value (after right rotation):", 0
.code
main PROC
mov edx, OFFSET prompt1
call WriteString
call ReadInt
mov bx, ax
mov edx, OFFSET prompt2
call WriteString
call ReadInt
mov cl, al
mov ax, bx
rol ax, cl
mov edx, OFFSET encrypted
call WriteString
call WriteDec
call Crlf
mov ax, bx
rol ax, cl
ror ax, cl
mov edx, OFFSET decrypted
call WriteString
call WriteDec
call Crlf
exit
main ENDP
END main
