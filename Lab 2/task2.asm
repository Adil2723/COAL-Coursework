include irvine32.inc

.code 
main Proc 
mov eax,24 
call writedec 
call crlf 
call writehex 
call crlf 
call writebin 
call crlf 

exit 
main ENDP 
end main 
