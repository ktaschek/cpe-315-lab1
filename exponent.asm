# Name: Darren Hong/Kyle Taschek
# Section: 1
# Description: Function which does exponentiation: x^y. Uses repeated addition instead of multiplication. Both x and y will be positive.


#public static int exponentiate(int x, int y) {
#		if (y == 0) {
#			return 1;
#		}
#		if (y == 1) {
#			return x;
#		}
#
#		int result = x;
#		for (int i = 1; i < y; i++) {
#			int sum = 0;
#			for (int j = 0; j < x; j++) {
#				sum += result;
#			}
#			result = sum;
#		}
#
#		return result;
#	}


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
	# prompt_x
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	syscall

	# read input 
	ori     $v0, $0, 5
	syscall

	# clear reg/store x
	ori     $s0, $0, 0
	add    $s0, $v0, $s0	# s0 = x

	# prompt_y
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0xA
	syscall

	# read input
	ori     $v0, $0, 5
	syscall

	# clear reg/store y
	ori     $s1, $0, 0
	add     $s1, $v0, $s1	# s1 = y

	# y = 0 case
	add		$t2, $0, $0
	add 	$s3, $0, 1
	beq		$s1, $t2, end

	# y = 1 case
	add   	$s3, $s0, $0
	addi    $t2, $0, 1		# t2 = out_count
	beq		$s1, $t2, end

loop:
	add 	$t0, $s0, $0
	addi    $t1, $0, 1		# t1 = in_count

multiply:
    beq 	$t1, $s3, update
    add		$t0, $t0, $s0   
	addi 	$t1, $t1, 1
    j multiply

update:
	add 	$s3, $t0, $0	# updates result
	addi 	$t2, $t2, 1
	bne 	$t2, $s1, loop

end:
	# result_text
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