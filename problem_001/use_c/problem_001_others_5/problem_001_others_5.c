#include <stdio.h>
#include <assert.h>

int sum_3_5(int n);
int main() {
  assert(23 == sum_3_5(10));
  //assert(23 != sum_3_5(10));
  printf("%d\n",sum_3_5(1000));
  return 0;
}

int sum_3_5(int n) {
  int i;
  int sum = 0;

  for (i = 1; i < n; i++) {
    if (i % 3 == 0) {
      sum += i;
    } else if (i % 5 == 0) {
      sum += i;
    }
  }
  return sum;
}
