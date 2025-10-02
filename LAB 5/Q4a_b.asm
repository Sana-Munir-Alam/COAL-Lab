INCLUDE Irvine32.inc

.data
arrayB BYTE 11h, 22h, 33h
arrayW WORD 4444h, 5555h, 6666h

.code
main PROC
    
    ; Part (a): Read arrayB (BYTE array). Doing this STep By Step

    mov esi, OFFSET arrayB    ; ESI points to the first element (11h)
    mov al, [esi]             ; AL = 11h (read first element)
    inc esi                   ; Point to next BYTE element
    mov al, [esi]             ; AL = 22h (read second element)
    inc esi                   ; Point to next BYTE element  
    mov al, [esi]             ; AL = 33h (read third elemen

    ; Part (b): Read arrayW (WORD array). Doing this using loop

    mov esi, OFFSET arrayW    ; Reset ESI to start of array
    mov ecx, 3                ; Loop counter = 3 elements
    ReadWordArray:
        mov ax, [esi]             ; Read current word element
        add esi, 2                ; Move to next word (2 bytes forward)
        loop ReadWordArray        ; Automatically Decreases ECX by 1, and ends when ECX has reached 0
    
    exit
main ENDP
END main
