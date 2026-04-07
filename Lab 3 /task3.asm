INCLUDE Irvine32.inc 
 
.data 
baseSalary  DWORD 30000 
leaveCost   DWORD 900         
otAllowance DWORD 600 
leaves      DWORD 3          
otHours     DWORD 6           
netSalary   DWORD ? 
 
.code 
main PROC 
    mov eax, baseSalary 
 
    ; Deduct leave cost 
    mov ebx, leaves 
    imul ebx, leaveCost 
    sub eax, ebx 
 
    ; Add overtime allowance 
    mov ebx, otHours 
    imul ebx, otAllowance 
    add eax, ebx 
 
    mov netSalary, eax 
 
    ; Display result 
    mov eax, netSalary 
    call WriteInt 
    call Crlf 
 
    exit 
main ENDP 
END main 
