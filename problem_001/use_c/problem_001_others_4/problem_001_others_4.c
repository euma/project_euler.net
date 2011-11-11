#include <stdio.h>
#include <stdlib.h>

int main() {
        int i=0;
        int sum = 0;
        while(i < 1000) {
                if(i % 3 == 0 || i % 5 == 0) {
                        sum += i;
                }
                i++;
        }
        printf("sum is %i\n",sum);
        exit(0);
}
