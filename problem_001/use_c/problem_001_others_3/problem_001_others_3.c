#include<stdio.h>
#include<stdlib.h>
int main()
{
	int i,n=0;
	for(i=1;i<1000;i++)
		if(!(i%3) || !(i%5))n+=i;
	printf("%d",n);
	system("pause");//to execute a shell command!
	return 0;
}
