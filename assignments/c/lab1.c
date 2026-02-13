#include <stdio.h>

int main(void) {
  int numArr[10];

  int numCt = 0;
  while (numCt>10 || numCt==0) {
    printf("\nEnter a number greater than 0 and less than 10\n");
    scanf("%d", &numCt);
  }

  int k;
  printf("\nEnter in %d integers\n", numCt);
  for (int ii = 0; ii < numCt; ii++) {
    scanf("%d", &k);
    numArr[ii] = k;
  }

  printf("\n");
  for (int jj = 0; jj < numCt; jj++) {
    if (numArr[jj] % 2 == 0) {
      printf("%d ", numArr[jj]);
    }
  }
  printf("\n\n");
  return 0;
}
