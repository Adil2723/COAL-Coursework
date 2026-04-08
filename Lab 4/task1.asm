include irvine32.inc
.data
salaries dword 22000, 30000, 36000, 43000, 50000
totalcount dword ?
sumall dword ?
avgsal dword ?
msgtotal byte "total number = ",0
msgsum byte "Sum = ",0
msgavg byte "Avg = ",0
.code
main proc
mov eax, lengthof salaries
mov totalcount, eax
mov eax, salaries[0*type salaries]
add eax, salaries[1*type salaries]
add eax, salaries[2*type salaries]
add eax, salaries[3*type salaries]
add eax, salaries[4*type salaries]
mov sumall, eax
mov ebx, totalcount
xor edx, edx
idiv ebx
mov avgsal, eax
mov edx, offset msgtotal
call writestring
mov eax, totalcount
call writeint
call crlf
mov edx, offset msgsum
call writestring
mov eax, sumall
call writeint
call crlf
mov edx, offset msgavg
call writestring

mov eax, avgsal
call writeint
call crlf
exit
main endp
end main
