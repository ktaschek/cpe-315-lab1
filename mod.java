/*
 * Write the following fast "mod" function.  This function uses no modulus operator, multiplication, or division - it uses only basic arithmetic/logical operations (add, sub, and...).  The function takes two integers as inputs - a number (num), and a divisor (div).  You are guaranteed that div is a power of 2.  You want the remainder of num / div.  For example, if num=22 (00010110 in binary) and div = 4 (100) would return 2 (10). Your algorithm should *not* repeatedly subtract (or add) div from num. Name your file mod.asm.  Program 1 only needs to work with positive numbers.
 */

import java.util.Scanner;

public class mod {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number (num): ");
        int num = sc.nextInt();
        System.out.println("Enter a number (div that's a power of 2): ");
        int div = sc.nextInt();
        sc.close();

        int res = num & (div - 1);
        System.out.println("Result: " + res);

        int compare = num % div;
        System.out.println("Compare: " + compare);
    }

}
