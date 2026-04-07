include irvine32.inc 
  
.data 
num1 word 25 
num2 dword 2 
num3 Byte 29 
  
.code 
main Proc 
  
mov ax,num1 
mov ebx,num2 
mov cl,num3 
  
call dumpregs 
  
 
exit 
main ENDP 
end main
