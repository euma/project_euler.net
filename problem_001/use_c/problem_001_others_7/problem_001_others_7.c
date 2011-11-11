#include<stdio.h>
int main() {
  int result = 0;
  int x;
  for(x = 3; x < 1000;){
    if(x % 5 != 0){
      result = result + x;
    }
    x = x + 3;
  }
  for(x = 5; x < 1000;){
    result = result + x;
    x = x + 5;
  }
  printf("%d\n",result);

  return 0;
}
