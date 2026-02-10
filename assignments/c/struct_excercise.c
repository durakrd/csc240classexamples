#include <stdio.h>
#include <math.h>


struct point {
  float x;
  float y;
};

void distance (struct point p1, struct point p2);

void distance(struct point p1, struct point p2) {
  float deltX = p1.x - p2.x;
  float deltY = p1.y - p2.y;

  printf("\nPoint 1: (%f, %f)\n", p1.x, p1.y);
  printf("\nPoint 2: (%f, %f)\n", p2.x, p2.y);
  printf("\nDistance: %f\n",  sqrtf((deltX*deltX)+(deltY*deltY)));
}


int main(void) {
  struct point p1 = {.x = 2, .y = 7};
  struct point p2 = {.x = 1, .y = 4};

  distance(p1, p2);

  /* void pointer excercise */
  void *things[4];
  
  int num = 10;
  float fNum = 3.24;
  char name[] = "Excercise";
  struct point testPoint = {.x = -4, .y=7};

  things[0] = &num;
  things[1] = &fNum;
  things[2] = &name;
  things[3] = &testPoint;

  
  int *nPtr = things[0];
  printf("\nthings[0] = %p = %d\n", nPtr, *nPtr);

  float *fPtr = things[1];
  printf("\nthings[1] = %p = %f\n", fPtr, *fPtr);

  printf("\nthings[2] = %p = %s\n", things[2], *(things + 2));

  struct point *ptrPoint = things[3];
  printf("\nthings[3] = %p = (%f, %f)\n", things[3], ptrPoint -> x, ptrPoint -> y);
 
  return 0;
}
