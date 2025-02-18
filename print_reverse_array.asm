# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  	# Write the definition here
	cout: .asciiz "The contents of the array are:\n" 	# Write the definition here

	newline: .asciiz "\n"

.text
printArr:
    # TODO: Write your function code here
    
    addi $t0, $a1, -1  # last idx
	move $t4, $a0 
	# $a0 = base addy of arr, $a1 = length of arr

loop:
    blt $t0, $zero, return

    sll $t1, $t0, 2 
    add $t2, $t4, $t1    # curr addy of num to print
    lw $t3, 0($t2)       # load into $a0
	move $a0, $t3

    li $v0, 1 
    syscall

    li $v0, 4        
    la $a0, newline     
    syscall

    addi $t0, $t0, -1
    j loop               

return:
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

