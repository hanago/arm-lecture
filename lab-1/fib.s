    .syntax unified
    .arch armv7-a
    .text
    .align 2
    .thumb
    .thumb_func

    .global fibonacci
    .type fibonacci, function

fibonacci:
    @ ADD/MODIFY CODE BELOW
    @ PROLOG
    push {r3, r4, r5, r6, r7, lr}

    
    @ if(x <= 0) retrun 0;
    cmp r0, #0
    ble .L3

    @ else if(x <= 2) retrun 1;
    cmp r0, #2 
    ble .L4 
    
    @ a = 0;
    @ b = 1;
    @ c = 1;
    @ for(i = 3; i < x; i++){
    @     temp = b;       
    @     b = a + b;
    @     a = b;
    @     c = a + b;
    @ }
    mov r3, #0
    mov r4, #1
    mov r5, #1
    mov r7, #3
.FOR:
    mov  r6, r4
    adds r4, r4, r3
    mov  r3, r6
    adds r5, r3, r4
    adds r7, r7, #1        
    cmp  r7, r0
    ble .FOR
    
    @ return b;
    mov r0, r5
    pop {r3, r4, r5, r6, r7, pc}        @EPILOG

    @ END CODE MODIFICATION

.L3:
    mov r0, #0            @ R0 = 0
    pop {r3, r4, r5, r6, r7, pc}        @ EPILOG

.L4:
    mov r0, #1            @ R0 = 1
    pop {r3, r4, r5, r6, r7, pc}        @ EPILOG

    .size fibonacci, .-fibonacci
    .end
