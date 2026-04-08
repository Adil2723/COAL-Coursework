INCLUDE Irvine32.inc

.data
promptStr BYTE "Enter a string: ", 0
wordMsg  BYTE "Word count: ", 0
inputBuffer BYTE 256 DUP(0)
maxLen DWORD 255

.code
main PROC

    ; Display prompt
    mov edx, OFFSET promptStr
    call WriteString

    ; Read input string
    mov ecx, maxLen
    mov edx, OFFSET inputBuffer
    call ReadString

    ; Initialize
    mov esi, OFFSET inputBuffer
    xor ebx, ebx        ; BL = flag (0 = space, 1 = inside word)
    xor ecx, ecx        ; ECX = word count

count_loop:
    mov al, [esi]

    ; End of string
    cmp al, 0
    je done

    ; Ignore newline characters
    cmp al, 13
    je done
    cmp al, 10
    je done

    ; Check for space
    cmp al, ' '
    je is_space

    ; If already inside a word, skip
    cmp bl, 1
    je advance_char

    ; New word found
    inc ecx
    mov bl, 1
    jmp advance_char

is_space:
    mov bl, 0

advance_char:
    inc esi
    jmp count_loop

done:
    ; Display result
    mov edx, OFFSET wordMsg
    call WriteString

    mov eax, ecx
    call WriteDec

    call Crlf
    exit

main ENDP
END main
