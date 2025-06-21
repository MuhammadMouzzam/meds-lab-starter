.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    bge zero, a0, fact_true
    
fact_false:

    #PREAMBLE: Start
    addi sp, sp -8
    sw ra, 0(sp)
    sw a0, 4(sp)
    #PREAMBLE: End
    
    addi a0, a0, -1
    jal ra, factorial
    
    #POSTAMBLE: Start
    lw ra, 0(sp)
    lw t1, 4(sp)
    addi sp, sp, 8
    #POSTAMBLE: End
    
    mul a0, a0, t1
    ret
    
fact_true:
    addi a0, zero, 1
    ret    