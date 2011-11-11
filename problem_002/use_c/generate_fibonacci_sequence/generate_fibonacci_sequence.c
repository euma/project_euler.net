#include<stdio.h>
int main()
{
  int f1=0;
  int f2=1;
  int i=0;
  while(i<10) {
    int f1_tmp=f1;
    f1=f2;
    f2=f1_tmp+f2;
    printf("%d\n",f2);
    i++;
  }
  return 0;
}
