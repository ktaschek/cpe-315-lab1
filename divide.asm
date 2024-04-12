# Name: Darren Hong/Kyle Taschek
# Section: 1
# Description: Function which divides a 64-bit unsigned number with a 31-bit unsigned number, quotient prints out as 2 32-bit numbers.

#public static int[] div(int upDd, int loDd, int dr) {
#		int mask = 1;
#		while (mask < dr) {
#			mask <<= 1;
#		}
#
#		while (mask != 1) {
#			upDd >>>= 1;
#			loDd >>>= 1;
#			if ((upDd & 1) != 0) {
#				loDd |= 0x80000000;
#			}
#			mask >>>= 1;
#		}
#
#		return new int[] {upDd, loDd};
#	}

.globl prompt_up
.globl prompt_lo	
.globl prompt_div
.globl result


.data

prompt_up: #32
	.asciiz "Enter integer's upper 32 bits: "

prompt_lo: #33
	.asciiz "\nEnter integer's lower 32 bits: "

prompt_div: #24
	.asciiz "\nEnter 31 bit integer: "

result:
	.asciiz "\nResults: "


.text

main:
	#prompt_up
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	syscall

	#read input 
	ori     $v0, $0, 5
	syscall

	#clear reg/store up dd
	ori     $s0, $0, 0
	addu    $s0, $v0, $s0 #s0 = up dd

	#prompt_lo
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0x20
	syscall

	#read input
	ori     $v0, $0, 5
	syscall

	#clear reg/store low dd
	ori     $s1, $0, 0
	addu    $s1, $v0, $s1 #s1 = lo dd

	#prompt_div
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0x41
	syscall

	#read input
	ori     $v0, $0, 5
	syscall

	#clear reg/store div
	ori     $s2, $0, 0
	addu    $s2, $v0, $s2 #s2 = div

	addi	$s3, $0, 1 #s3 = mask


loop:
	#goto print if div = mask
	beq		$s2, $s3, print
	
	sll		$s3, $s3, 1 #logical left shift mask
	srl		$s1, $s1, 1 #logical right shift lo dd, divide by 2
	
	#check LSB of up dd = t0
	andi	$t0, $s0, 1

	#if t0 = 1, set MSB of lo dd, else goto shift_up
	beq     $t0, $0, shift_up
	ori     $t1, $0, 1
	sll     $t1, $t1, 31
	or   	$s1, $s1, $t1


shift_up: 
	srl 	$s0, $s0, 1 #logical right shift up dd
	j 		loop


print:
	#result_text
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0x59
	syscall

	#print result up 32 bits
	ori     $v0, $0, 1
	add 	$a0, $s0, $0
	syscall	

	#result_text
	ori     $v0, $0, 4	
	lui     $a0, 0x1001
	ori     $a0, $a0, 0x59
	syscall

	#print result lo 32 bits
	ori     $v0, $0, 1
	add 	$a0, $s1, $0
	syscall	

	# Exit (load 10 into $v0)
	ori     $v0, $0, 10
	syscall