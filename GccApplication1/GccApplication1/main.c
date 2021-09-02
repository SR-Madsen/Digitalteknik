/*
 * GccApplication1.c
 *
 * Created: 08-05-2018 10:40:20
 * Author : Sebastian
 */ 

#include <avr/io.h>

char arr[64];
int ix;
int sum;
char adc;

void average()
{
	sum=sum+(adc-arr[ix]);
	arr[ix]=adc;
	ix=ix+1;
	
	if(ix>63)
	{
		ix=0;
	}
}

int main(void)
{
    while (1)
    {
		average();
    }
}

