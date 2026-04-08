INCLUDE Irvine32.inc
.data
msgPrompt BYTE &quot;Enter student marks: &quot;, 0
msgGrade BYTE &quot;YOU GOT GRADE: &quot;, 0
gradeA BYTE &quot;A&quot;, 0
gradeB BYTE &quot;B&quot;, 0
gradeC BYTE &quot;C&quot;, 0
gradeD BYTE &quot;D&quot;, 0
gradeF BYTE &quot;F&quot;, 0
.code
main PROC
mov edx, OFFSET msgPrompt
call WriteString
call ReadInt
cmp eax, 90
jge grade_A
cmp eax, 70
jge grade_B
cmp eax, 60
jge grade_C
cmp eax, 50
jge grade_D
jmp grade_F
grade_A:
mov edx, OFFSET msgGrade
call WriteString
mov edx, OFFSET gradeA

call WriteString
jmp done
grade_B:
mov edx, OFFSET msgGrade
call WriteString
mov edx, OFFSET gradeB
call WriteString
jmp done
grade_C:
mov edx, OFFSET msgGrade
call WriteString
mov edx, OFFSET gradeC
call WriteString
jmp done
grade_D:
mov edx, OFFSET msgGrade
call WriteString
mov edx, OFFSET gradeD
call WriteString
jmp done
grade_F:
mov edx, OFFSET msgGrade
call WriteString
mov edx, OFFSET gradeF
call WriteString
done:
call Crlf
exit
main ENDP
END main
