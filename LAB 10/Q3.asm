INCLUDE Irvine32.inc

.data
array DWORD 5,9,2,15,7,1,20,11,6,8,4,13,17,10,3,14,16,12,19,18
msgMin BYTE "Minimum value: ",0
msgMax BYTE "Maximum value: ",0
minVal DWORD ?
maxVal DWORD ?

.code
main PROC
    lea eax, array
    push eax
    push LENGTHOF array
    call MinMaxArray
    add esp, 8
    exit
main ENDP

MinMaxArray PROC
    push ebp
    mov  ebp, esp

    mov ecx, [ebp+8]      ; size (length of array to run loop)
    mov esi, [ebp+12]     ; array pointer start
    mov eax, [esi]
    mov ebx, eax

    nextItem:
        add esi, 4
        dec ecx
        jz done
        mov edx, [esi]
        cmp edx, eax
        jl newMin
        cmp edx, ebx
        jg newMax
        jmp nextItem

    newMin:
        mov eax, edx
        jmp nextItem

    newMax:
        mov ebx, edx
        jmp nextItem

    done:
        mov minVal, eax
        mov maxVal, ebx

        mov edx, OFFSET msgMin
        call WriteString
        mov eax, minVal
        call WriteDec
        call Crlf

        mov edx, OFFSET msgMax
        call WriteString
        mov eax, maxVal
        call WriteDec
        call Crlf

        pop ebp
        ret
MinMaxArray ENDP
END main
