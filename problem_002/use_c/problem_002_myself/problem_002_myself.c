#include<stdio.h>
int main()
{
  int f1=0;
  int f2=1;
  int limit=100;
  while(1) {
    int f1_tmp=f1;
    f1=f2;
    f2=f1_tmp+f2;
    if (f2 > limit) { break; }
    printf("%d\n",f2);
  }
  return 0;
}
