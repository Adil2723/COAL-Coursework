include irvine32.inc
.data
arrayr dword 45,55,70,95,95,95,100,115
lenr = lengthof arrayr
sizer = type arrayr
bytesr = sizeof arrayr
sum347 dword ?
prod25 dword ?
msglen byte &quot;a) length: &quot;, 0
msgsize byte &quot;b) size of single element: &quot;, 0
msgbytes byte &quot;c) total bytes used: &quot;, 0
msgsum byte &quot;d) sum of 3rd, 4th and 7th: &quot;, 0
msgprod byte &quot;e) product of 2nd and 5th: &quot;, 0
.code
main proc
mov edx, offset msglen
call writestring
mov eax, lenr
call writeint
call crlf
mov edx, offset msgsize
call writestring
mov eax, sizer
call writeint
call crlf
mov edx, offset msgbytes
call writestring
mov eax, bytesr
call writeint
call crlf

mov eax, arrayr[2*type arrayr]
add eax, arrayr[3*type arrayr]
add eax, arrayr[6*type arrayr]
mov sum347, eax
mov edx, offset msgsum
call writestring
mov eax, sum347
call writeint
call crlf
mov eax, arrayr[1*type arrayr]
imul eax, arrayr[4*type arrayr]
mov prod25, eax
mov edx, offset msgprod
call writestring
mov eax, prod25
call writeint
call crlf
exit
main endp
end main
