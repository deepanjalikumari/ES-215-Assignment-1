#include <stdio.h>
#include <time.h>

void fibonacci_in_loop_memoized() {
  
unsigned long long fib[50];
fib[0] = 0;
fib[1] = 1;
  
printf("%llu %llu ",fib[0],fib[1]);

int i = 2;
while(i < 50) {
fib[i] = fib[i - 1] + fib[i - 2];
printf("%llu ",fib[i]);
i++;
}
  
printf("\n");
}

int main() {
struct timespec start, end;
double elapsed;
timespec_get(&start, TIME_UTC);
fibonacci_in_loop_memoized(50);
timespec_get(&end, TIME_UTC);
elapsed = (end.tv_sec - start.tv_sec) + (end.tv_nsec -
start.tv_nsec) / 1e9;
printf("\nThe memoization time in the loop is: %.9f seconds\n",
elapsed);
return 0;
}
