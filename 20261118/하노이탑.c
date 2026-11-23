#include <stdio.h>

void hanoi(int n, char from, char temp, char to){
    if(n == 0){
        return;
    }
    hanoi(n - 1, from, to, temp);
    printf("Move disk %d from %c to %c\n", n, from, to);
    hanoi(n - 1, temp, from, to);
}

int main(){
    hanoi(3, 'A', 'B', 'C');
    return 0;
} 