#include<stdio.h>
int main()
{
  int a,b,c,n,m,p,num;
  double x,y,z;
  printf("Insert number= ");
  scanf("%d",&num);
  a=0;
  b=0;
  c=0;
  x=0;
  y=0;
  z=0;
  for(n=1;n<=num/3;n++){a=a+3;x=x+a;}
  for(m=1;m<=num/5;m++){b=b+5;y=y+b;}
  for(p=1;p<=num/15;p++){c=c+15;z=z+c;}
  printf("The sum of the divisors of 3 or 5 which are less than %d\n= %.0f\n",num,x+y-z);
  return 0;
}
