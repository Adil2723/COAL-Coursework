include irvine32.inc 
; num1 = ((num1%4)/num3)(num2 + (num3*3)) 
 .data  
num1 dd 24  
num2 dd 12  
num3 dd 3 
 
.code  
main Proc 
mov eax,num1 
mov edx,0 
mov ebx,4 
 
div ebx    
mov eax,edx ; (num1%4) 
mov ebx,num3 
div ebx  ; (num1%4)/num3 
mov ecx,eax   ; ecx = (num1%4)/num3 
mov eax,num3 
mov ebx,3 
mul ebx    ; (num3*3) 
add eax,num2  ; num2 + (num3*3) 
 
mul ecx  ; ((num1%4)/num3)*(num2 + (num3*3)) 
mov num1,eax   ; storing result in num1 
 
call writedec  ; printing result 
 
exit 
main ENDP  
end main 
