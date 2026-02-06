#include <stdio.h>
#include <string.h>

/* This file will not compile until it is complete - you can comment out
 * any failing code that you haven't completed yet.
 */

int array_max(int a[], int len);
int letter_count(char a[], int len);
void printThem(int count);
int triple_it(int x);

int num;
float farray[10];
/* Define practice1_t structure below */

struct practice1_t {
  char subject[4];
  int classNum;
  float hours;
};

int main(void) {
  int nums[11] = {1, 3, 5, 7, 9, 11, 10, 8, 6, 4, 2};
  char str[] = "CSC240 Fall 2019";

  printf("triple_it: ");
  for (int ii = 0; ii < 10; ii++) {
    printf("%d ", triple_it(ii));
  }
  printf("\n");

  printf("\narray_max: %d\n", array_max(nums, 11));

  printf("\nletter_count: %d\n", letter_count(str, strlen(str)));

  printf("\nprintThem:\n");
  printThem(50);

  struct practice1_t csc240 = {.subject = "CSC", .classNum = 240, .hours = 8.8};
  struct practice1_t ece103 = {.subject = "ECE", .classNum = 103, .hours = 6.1};

  printf("\n%s%d for %.1f hours\n", csc240.subject, csc240.classNum, csc240.hours);
  printf("\n%s%d for %.1f hours\n", ece103.subject, ece103.classNum, ece103.hours);

  return 0;
}

int triple_it(int x) { return (x * 3); }

int array_max(int a[], int len) {
  int max = a[0];
  for (int ii = 0; ii < len; ii++) {
    if (a[ii] > max) {
      max = a[ii];
    }
  }
  return max;
}

int letter_count(char a[], int len) {
  int letCt = 0;
  char c;
  for (int ii = 0; ii < len; ii++) {
    c = a[ii];
    if (((c >= 'A') && (c <= 'Z')) || ((c >= 'a') && (c <= 'z'))) {
      letCt++;
    }
  }
  return letCt;
}

void printThem(int count) {
  int dispNum = 15;
  for (int ii = 1; ii <= count; ii++) {
    if (ii % 7 == 0) {
      continue;
    }
    else if (ii % 3 == 0 && ii % 5 == 0) {
      printf("fifteen ");
      dispNum--;
    }
    else if (ii % 3 == 0) {
      printf("three ");
      dispNum--;
    }
    else if (ii % 5 == 0) {
      printf("five ");
      dispNum--;
    }
    else {
      printf("%d ", ii);
      dispNum--;
    }

    if (dispNum == 0) {
      printf("\n");
      dispNum = 15;
    }
  }
  printf("\n");
}
