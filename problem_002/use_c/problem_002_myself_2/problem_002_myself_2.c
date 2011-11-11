#include<stdio.h>
int main()
{
  int f1=0;
  int f2=1;
  //int limit=100;
  int limit=4000000;
  int sum_odd=0;
  while(1) {
    int f1_tmp=f1;
    f1=f2;
    f2=f1_tmp+f2;
    if (f2 > limit) { break; }
    else {
      if (f2 % 2 == 0) { sum_odd += f2; }
    }
    printf("%d\n",f2);
  }
  printf("\n%d\n",sum_odd);
  return 0;
}
