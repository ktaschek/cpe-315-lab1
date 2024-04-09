# MOD

# Java Implementation

# Scanner sc = new Scanner(System.in);
# System.out.println("Enter a number (num): ");
# int num = sc.nextInt();
# System.out.println("Enter a number (div that's a power of 2): ");
# int div = sc.nextInt();
# sc.close();

# int res = num & (div - 1);
# System.out.println("Result: " + res);

# MIPS Implemenation

.globl numPrompt
.globl divPrompt

.data
numPrompt: .asciiz "Enter a number (num): "
divPrompt: .asciiz "Enter a number (div that's a power of 2): "

.text
# s0 is the input number
# s1 is the input divisor
# s3 is the result
main:
    # Prompt for num
    ori $v0, $0, 4
    lui $a0, 0x1001
    syscall

    # read num
    ori $v0, $0, 5
    syscall
    add $s0, $v0, $0

    # Prompt for divisor
    ori $v0, $0, 4
    lui $a0, 0x1001
    ori $a0, $a0, 0x17
    syscall

    # read divisor
    ori $v0, $0, 5
    syscall
    add $s1, $v0, $0

    # Calculate result
    addi $s1, $s1, -1
    and $s3, $s0, $s1

    # Print result
    ori $v0, $0, 1
    add $a0, $s3, $0
    syscall

    # Exit
    ori $v0, $0, 10
    syscall


