#include <stdio.h>
int sum1toN(int n) {
  return n * (n + 1) / 2;
}
int sumMultiples(int limit, int a){
  return sum1toN((limit - 1) / a) * a;
}
int main(){
  int sum=sumMultiples(1000, 3) + sumMultiples(1000, 5) - sumMultiples(1000, 15);
  printf("%i", sum);
  return 0;
}
