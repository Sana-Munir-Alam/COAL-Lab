INCLUDE Irvine32.inc

.data
prompt1 BYTE "Enter first number: ",0
prompt2 BYTE "Enter second number: ",0
msgGCD  BYTE "The GCD is: ",0
msgESP  BYTE "Current ESP: ",0

num1 DWORD ?
num2 DWORD ?
result DWORD ?

.code
main PROC
    call TakeInput
    exit
main ENDP

TakeInput PROC
    push ebp
    mov  ebp, esp

    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov num1, eax

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov num2, eax

    ; Show ESP value
    mov edx, OFFSET msgESP
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf

    push num2
    push num1
    call GCD
    add esp, 8
    mov result, eax

    push result
    call Display
    add esp, 4

    pop ebp
    ret
TakeInput ENDP

GCD PROC
    push ebp
    mov  ebp, esp

    mov eax, [ebp+8]   ; num1
    mov ebx, [ebp+12]  ; num2

    mov edx, OFFSET msgESP
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf

GCD_loop:
    cmp ebx, 0
    je done
    mov edx, 0
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp GCD_loop
done:
    pop ebp
    ret
GCD ENDP

Display PROC
    push ebp
    mov  ebp, esp

    mov edx, OFFSET msgGCD
    call WriteString
    mov eax, [ebp+8]
    call WriteDec
    call Crlf

    pop ebp
    ret
Display ENDP

END main
