#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* Rewrite using a pointer to char str[] */
void array_to_ptr() {
  int len = 1;
  char str[ ] = "Hello World!";
  char *s = str;
  while (*s != '\0') {
    putc(*s, stdout);
    s++;
    len++;
  }
  printf("\nlength = %d\n", len);
}

int contains (char * str, char c) {
  while (*str != '\0') {
    if (*str == c) {
      return 1;
    }
    str++;
  }
  return 0;
}

int * makearray(int n) {
  int *dynPtr = (int *)calloc(n, sizeof(int));
  for (int ii = 1; ii <= n; ii++) {
    *dynPtr = ii;
    dynPtr++;
  }
  return dynPtr-n;
}

int main (void) {
  printf("Question #3B - array_to_ptr:\n");
  array_to_ptr();   
  printf("\n------------------------------------\n\n");

  printf("Question #3C - contains:\n");
  printf("Test #1: ");
  if ( contains("Hello", 'e') == 1) {
    printf("The string \"Hello\" contains the character 'e'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'e'\n");
  }
  printf("Test #2: ");
  if ( contains("Hello", 'x') == 1) {
    printf("The string \"Hello\" contains the character 'x'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'x'\n");
  }
  printf("\n------------------------------------\n\n");

  printf("Question #3D: - makearray:\n");
  int * arr = makearray(10);
  for (int ii=0;ii<10;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf("\n");
  printf("\n------------------------------------\n\n");
  return 0;
}
