#include<stdio.h>
#include<stdlib.h>

int main(int argc, char* argv[])
{
  int n=0;
  int i=0;
  int sum=0;
  if (argc == 2) {
    n=atoi(argv[1])-1;//there must less 1000 so I choose 1000-1 to set sum up boud!
  }
  else
  {
    printf("please enter a number at the command line\n");
    exit(1);
  }
  //printf("%d\n",n);
  for (i=1;i<n;i++) {
    if (i % 3 == 0 || i % 5 == 0)
    {
      sum += i;
    }
  }
  printf("%d\n",sum);

  return 0;
}
