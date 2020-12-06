
bits    16                ; 16 Bit Real Mod
org     0x7c00            ; 0x7C00 loaded address

start:
    jmp loader

msg db "kaOS Loading....", 0; message

write:
    lodsb                ; next byte of word  si -> al
    or al,al              ; al is Zero ?
    jz endwrite           ; if js is true go to endwrite
    mov ah,0x0e           ; function
    int 0x10              ; interrupt
    jmp write             ; call itself again

endwrite:
    ret                   ; done


loader:
    mov si,msg            ; Transfer the message to be written to the index recorder (si)
    call write            ; call write label
    cli                   ; clear interrupts
    hlt                   ; halt system

times 510 -($-$$) db 0x00
dw 0xaa55                 ; signature of boot


