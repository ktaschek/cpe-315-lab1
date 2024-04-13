# Name: Darren Hong/Kyle Taschek
# Section:  1
# Description:  This program takes an input number and reverse the bits

# Java Implementation

# Scanner sc = new Scanner(System.in);
# System.out.println("Enter a number to reverse: ");
# int num = sc.nextInt();
# sc.close();

# int res = 0;
# int mask = 1;
# int setter = 1 << 31;

# for (int i = 0; i < 32; i++) {
#     if ((num & mask) != 0) {
#         res = res | setter;
#     }

#     setter = setter >>> 1;
#     mask = mask << 1;
# }
# System.out.println("Result: " + res);

# MIPS Implementation

.globl prompt

.data
prompt: .asciiz "Enter a number to reverse: "
resText: .asciiz "Result: "

.text

# s0 contains the input number
# s1 contains the result
# s2 contains the bit mask
# s3 contains the bit setter
# s4 is the loop counter
# s5 is the loop limit

main:
    # load and print the prompt
    ori $v0, $0, 4
    lui $a0, 0x1001
    syscall

    # read the input number
    ori $v0, $0, 5
    syscall

    # input numeber
    add $s0, $v0, $0

    # result
    add $s1, $0, $0

    # bit mask
    add $s2, $0, 1

    # bit setter
    add $s3, $0, 1
    sll $s3, $s3, 31

    # loop counter
    add $s4, $0, $0

    # loop limit
    add $s5, $0, 32
loop:
    # check if the loop counter is equal to the loop limit
    beq $s4, $s5, end
    and $t0, $s0, $s2

    # if the bit is 1, set the corresponding bit in the result
    beq $t0, $0, skip
    or $s1, $s1, $s3
skip:
    # shift the mask and setter to the next bit and increment the loop counter
    srl $s3, $s3, 1
    sll $s2, $s2, 1
    addi $s4, $s4, 1
    j loop
end:
    # print the result  
    ori $v0, $0, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0x1C
    syscall

    ori $v0, $0, 1
    add $a0, $s1, $0
    syscall

    # exit
    ori $v0, $0, 10
    syscall





