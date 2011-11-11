#include<stdio.h>
int main()
{
	int a=0,b=0,i,result;
	for(i=1;i<1000;i++)
	{
		if(i%3==0) a=a+i;
		else if(i%5==0) b=b+i;
	}
	result=a+b;
	printf("%d\n",result);
	return 0;
}
