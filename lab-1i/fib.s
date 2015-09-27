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
    push {r3, r4, r5, lr}

    
    @ if(x <= 0) retrun 0;
    cmp r0, #0
    ble .L3

    @ else if(x <= 2) retrun 1;
    cmp r0, #2 
    ble .L4 
    
    @ temp = x
    mov r3, r0
    
    @ a = fibonacci(temp - 1);
    subs r0, r3, #1
    bl fibonacci
    mov r4, r0

    @ b = fibonacci(temp - 2);
    subs r0, r3, #2
    bl fibonacci 
    
    @ return a+b;
    adds r0, r0, r4
    pop {r3, r4, r5, pc}        @EPILOG

    @ END CODE MODIFICATION
.L3:
    mov r0, #0            @ R0 = 0
    pop {r3, r4, r5, pc}        @ EPILOG

.L4:
    mov r0, #1            @ R0 = 1
    pop {r3, r4, r5, pc}        @ EPILOG

    .size fibonacci, .-fibonacci
    .end
