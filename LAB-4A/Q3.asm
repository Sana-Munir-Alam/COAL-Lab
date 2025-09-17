INCLUDE Irvine32.inc

.data
DayTemp WORD 30     ; Day Temperature
NightTemp WORD 18   ; Night Temperature
Difference  DWORD ?

msgDayTemp BYTE "Day Tempertaure: ", 0
msgNightTemp BYTE "Night Temperature: ", 0
msgDifference BYTE "Temperature Difference: ", 0
msgInc BYTE "Incremented Night Temperature: ", 0

.code
main PROC
    
    movzx eax, DayTemp          ; EAX = DayTemp      => EAX = 30
    mov edx, OFFSET msgDayTemp
    call WriteString            ; Print Current Day Temperature
    call WriteDec               ; Printing Day Temperature
    call Crlf                   ; Printing New Line

    movzx ebx, NightTemp        ; EBX =  NightTemp      => EBX = 18
    XCHG eax, ebx               ; Exhanging the temp values so that temp could be printed
    mov edx, OFFSET msgNightTemp
    call WriteString            ; Print Current Night Temperature
    call WriteDec               ; Printing Night Temperature
    call Crlf                   ; Printing New Line
    
    XCHG eax, ebx
    sub eax, ebx                ; EAX = EAX - EBX    => EAX = 30 - 18
    mov Difference, eax
    mov edx, OFFSET msgDifference
    call WriteString            ; Print Temperature Difference
    call WriteDec               ; Printing Temperature Difference
    call Crlf 

    mov ax, NightTemp
    INC ax                     ; EAX = EAX + 1     => EAX = 18 + 1
    INC ax                     ; EAX = EAX + 1     => EAX = 19 + 1
    mov NightTemp, ax
    mov edx, OFFSET msgInc
    call WriteString            ; Print Incremented Night Temperature
    call WriteDec               ; Printing Night Temperature
    call Crlf 

exit
main ENDP
END main
