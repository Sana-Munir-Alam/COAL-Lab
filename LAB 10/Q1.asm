INCLUDE Irvine32.inc

.data
Var1 DWORD 12
Var2 DWORD 2
Var3 DWORD 3

.code
main PROC
	push Var1
	push Var2
	push Var3

	Call ThreeProd
	exit
main ENDP

ThreeProd PROC
	mov eax, [esp + 4]    ; Var3 (topmost pushed)
    mov ebx, [esp + 8]    ; Var2
    mul ebx               ; EAX = Var3 * Var2
    mov ecx, [esp + 12]   ; Var1
    mul ecx               ; EAX = (Var3*Var2)*Var1
    call WriteDec
    ret
ThreeProd ENDP
END main
