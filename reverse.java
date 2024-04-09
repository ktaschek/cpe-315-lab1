/*
 * Write a program which prints the number that represents reverse-ordered
 * binary of the input number. Reverse the full 32-bit number (include leading
 * 0's). This means the your program will print the 32-bit number that is
 * generated if the 32-bit input number's bits are written in reverse order (MSB
 * becomes LSB and so on). Name your file reverse.asm. Program 2 only needs to
 * work with positive numbers as input.
 */

import java.util.Scanner;

public class reverse {
    public static void main(String[] args) {
        try {
            // take user input
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter a number: ");
            int num = sc.nextInt();
            sc.close();

            System.out.println("Input: ");
            printBinary(num);

            // res stores the result
            int res = 0;

            // mask is used to check each bit of the input number
            int mask = 1;

            // setter is used to set the bit in the result
            int setter = 1 << 31;
            for (int i = 0; i < 32; i++) {
                // if the bit is 1, set the corresponding bit in the result
                if ((num & mask) != 0) {
                    res = res | setter;
                }
                // shift the mask and setter to the next bit
                setter = setter >>> 1;
                mask = mask << 1;
            }

            System.out.println("Output: ");
            printBinary(res);

            System.out.println("Result: " + res);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    private static void printBinary(int num) {
        for (int i = 31; i >= 0; i--) {
            System.out.print((num & (1 << i)) == 0 ? "0" : "1");
        }
        System.out.println();
    }
}
