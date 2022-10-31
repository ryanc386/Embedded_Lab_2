#include <msp430.h> 


float b = 5;
int main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	
	int a = 1;

	unsigned char c = 0x2000;
	unsigned char d = 0x2002;

	a += 1;
	b -= 1;

	unsigned char e = c&&d;
	unsigned char f = c||d;

	while(1);
	return 0;
}
