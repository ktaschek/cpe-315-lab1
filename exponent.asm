# Name: Darren Hong/Kyle Taschek
# Section: 1
# Description: Write a function which does exponentiation: x raised to the power of y. Your function should not use multiplies, but may use repeated addition. Both x and y will be positive.


#


.globl prompt_x
.globl prompt_y
.globl result


.data

prompt_x: #10
	.asciiz "Enter x: "

prompt_y: #11
	.asciiz "\nEnter y: "

result:
	.asciiz "\nResult: "


.text

main:
	#prompt_x
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	syscall

	#read input 
	ori     $v0, $0, 5
	syscall

	#clear reg/store x
	ori     $s0, $0, 0
	add    $s0, $v0, $s0 #s0 = x

	#prompt_y
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0xA
	syscall

	#read input
	ori     $v0, $0, 5
	syscall

	#clear reg/store y
	ori     $s1, $0, 0
	add     $s1, $v0, $s1 #s1 = y

    add     $s2, $s2, $0 #i
    addi    $s3, $s3, 1 #result
    add     $a0, $s0, $0
    addi    $s4, $0, 1

loop:
    #if i=y, print
	beq		$s1, $s2, print
    beq     $s1, $s4, if
    add     $s3, $a0, $0

multiply:
    add $a0, $a0, $a0
    addi $s2, $s2, 1
    j loop

if:
    add $s3, $s0, $0

print:
	#result_text
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0x15
	syscall

	ori     $v0, $0, 1
	add 	$a0, $s3, $0
	syscall

	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall