#include <stdio.h>
#include <time.h>

void fib_loop(){
//calculating fibonacci using loop 
  unsigned long long first=0,second=1,sum;
  for(int i=0;i<50;i++){
    printf("%lld ",first);
    sum=first+second;
    first=second;
    second=sum;
  }
}

//calculating timespec
int main(){
  struct timespec start, end;
  double elap_time;
  timespec_get(&start, TIME_UTC);
  fib_loop();
  timespec_get(&end, TIME_UTC);
  elap_time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - 
start.tv_nsec) / 1e9;
  printf("\ntime taken by loop: %.9f seconds\n", elap_time);
  return 0;
}
