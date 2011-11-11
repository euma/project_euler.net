#include<stdio.h>
int main() {
  int i;
  int limit=1000;
  int sum=0;
  int multiple_of_three=0;
  int multiple_of_five=0;
  for (i=1; i <= limit/3; i++)
  {
    multiple_of_three=3*i;
    multiple_of_five=5*i;

    if (multiple_of_three >= limit)
      multiple_of_three=0;
    if (multiple_of_five >= limit)
      multiple_of_five=0;

    // This is done in order to avoid adding "common" multiples twice. 
    if(multiple_of_three%5==0)   
      multiple_of_three=0;

    sum=sum+multiple_of_three+multiple_of_five;
  }
  printf("%d\n",sum);
  return 0;
}
