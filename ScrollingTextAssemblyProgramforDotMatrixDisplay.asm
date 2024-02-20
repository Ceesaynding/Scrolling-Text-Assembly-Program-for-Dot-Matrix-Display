

org 100h

    #start=Emulation Kit.exe#
    
    mov dx,2000h	   
    mov bx, 0
    push dx 
    
MAINLOOP:

    mov si, 0
    mov cx, 5

NEXT:

    mov al,Dots[bx][si]
    out dx,al
    inc si
    inc dx
    
    cmp si, 5
    loopne NEXT      
    cmp dx,2028h       
    je  Reset
    
    Back:
    
    add bx, 5
    cmp bx, 40
    jl MAINLOOP
	
    mov cx, 1H
    wait:
    loop wait
	  
    pop dx
    add dx,5
    mov bx,0h
    cmp dx,2028h
    jge  Reset2
	
    
    Stack:
    push dx
    jmp  MAINLOOP
       
    Reset:
    mov dx,2000h
    jmp Back 
    
    Reset2:
    mov dx,2000h
    jmp Stack


ret

Dots	DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b  
	DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b  
	DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b   
	DB	00000000b, 00000000b, 00000000b, 00000000b, 00000000b   
	DB	01111111b, 01001001b, 01001001b, 01001001b, 01000001b  
	DB	01001111b, 01001001b, 01001001b, 01001001b, 01111001b 
	DB	01111111b, 01001001b, 01001001b, 01001001b, 01000001b  
	DB	01001111b, 01001001b, 01001001b, 01001001b, 01111001b 

