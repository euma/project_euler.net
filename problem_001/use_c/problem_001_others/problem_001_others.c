#define MAX 1000
#include <stdio.h>

int main(){
    int i, sum=0;
    for (i=1;i<MAX;i++)    {
        if (i%3==0||i%5==0)
            sum+=i;    }
    printf("%i", sum);
    return 0;}
