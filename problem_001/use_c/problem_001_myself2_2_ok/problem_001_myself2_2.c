#include<stdio.h>
#include<stdlib.h>
int sum_natural(int n)
{
  if (n < 1) { return 0; }
  else { return n*(n+1)/2; }
}

int main(int argc, char* argv[])
{
  int n=0;
  if (argc == 2) {
    n=atoi(argv[1])-1;//there must less 1000 so I choose 1000-1 to set sum up boud!
  }
  else
  {
    printf("there only need one number\n");
    exit(1);
  }
  //printf("%d\n",n);
  int sum3=3*sum_natural(n/3);
  int sum5=5*sum_natural(n/5);
  int sum15=15*sum_natural(n/15);
  int sum=sum3+sum5-sum15;
  printf("%d+%d-%d=%d\n",sum3,sum5,sum15,sum);
  return 0;
}
