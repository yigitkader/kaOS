;2 byte endless loop for security our ram
endlessLoop:
    jmp endlessLoop  

times 510 - ($ -$$) db 0x00 ;508 byte
dw 0xaa55 ;2byte

;db 0x55
;db 0xaa


