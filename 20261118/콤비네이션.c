#include <stdio.h>

int combination(int n, int k){
    if(k == 0 || n == k){
        return 1;
    }
    return combination(n - 1, k - 1) + combination(n - 1, k);
}

int main(){
    printf("%d\n", combination(4, 2));
    printf("%d\n", combination(5, 2));
    return 0;
}