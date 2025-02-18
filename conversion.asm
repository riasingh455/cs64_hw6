# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $v0, 0 # this is z
    li $t0, 0 # start of i
    li $t1, 8 # end of i
    
loop:
    beq $t0, $t1, return
    sll $t3, $a0, 3 # 8x
    sub $v0, $v0, $t3 # z - 8x
    add $v0, $v0, $a1 # z - 8x + y
    
    li $t2, 2
    bge $a0, $t2, update

    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j loop

update:
    addi $a1, $a1, -1  # y -= 1
    addi $a0, $a0, 1   # x += 1
    addi $t0, $t0, 1   # i += 1
    j loop


return:
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall

