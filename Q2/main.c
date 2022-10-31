#include <msp430.h> 


/**
 * main.c
 */

int mySum(int a, int b);
int main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer

    unsigned int a = 0b1000000000000000;
    unsigned int b = 0b0000000000000001;
    unsigned int c = mySum(a,b);

    while(1);
    return 0;
}

int mySum(int a, int b) {
    return a + b;
}
