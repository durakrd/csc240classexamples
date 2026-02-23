/* Function works with basiclist */
#include <stdio.h>
#include <stdlib.h>
#include "basiclist.h"

typedef struct {
  int x;
  int y;
} point_t;


int main(void) {
  point_t origin = {0, 0};
  point_t one = {1, 1};
  point_t two = {2, 2};
  point_t three = {3, 3};

  node_t *frontListPtr = NULL;
  list_add(&frontListPtr, &origin);
  list_add(&frontListPtr, &one);
  list_add(&frontListPtr, &two);
  list_add(&frontListPtr, &three);

  node_t *curr = frontListPtr;
  point_t *currData;
  while (curr != NULL) {
    currData = (point_t *) curr -> data;
    printf("Point: {%d, %d}\n", currData->x, currData->y);
    curr = curr -> next;
  }
  return 0;
}
