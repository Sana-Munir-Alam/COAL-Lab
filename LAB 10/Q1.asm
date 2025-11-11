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
    call ThreeProd
    add esp, 12          ; clean up (3 parameters × 4 bytes)
    exit
main ENDP

ThreeProd PROC
    push ebp
    mov  ebp, esp

    mov eax, [ebp+8]     ; Var3
    mov ebx, [ebp+12]    ; Var2
    mul ebx              ; EAX = Var3 * Var2
    mov ecx, [ebp+16]    ; Var1
    mul ecx              ; EAX = (Var3*Var2)*Var1

    call WriteDec
    call Crlf

    pop ebp
    ret
ThreeProd ENDP
END main
