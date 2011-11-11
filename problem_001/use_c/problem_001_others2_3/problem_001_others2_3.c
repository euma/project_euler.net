#include<stdio.h>
//def PE1(a, b, n):
//    def f(x, n):
//        fl = int((n-1)/x)
//        return x * fl * (fl+1)
//    return (f(a,n) + f(b,n) - f(a*b,n))/2

int f(int x, int n) {
  int fl = (int)((n-1)/x);
  return x * fl * (fl+1);
}
int PE1(int a, int b, int n) {
  return (f(a,n) + f(b,n) - f(a*b,n))/2;
}
int main() {
  int res=PE1(3,5,1000);
  printf("%d\n",res);
  return 0;
}
