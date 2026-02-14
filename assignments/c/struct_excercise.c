#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
  void * things[4];

  things[0] = malloc(sizeof(int));
  things[1] = malloc(sizeof(float));
  things[2] = malloc(sizeof(char[9]));
  things[3] = malloc(sizeof(struct point));

  *((int *) things[0]) = 10;
  *((float *)things[1]) = 3.24;
  strncpy((char *)things[2], "Exercise", 9);
  (*((struct point *)things[3])).x = -4.2f;
  ((struct point *)things[3]) -> y = 7.5f;
  

  
  printf("\nthings[0] = %p = %d\n", things[0], *((int *)things[0]));

  printf("\nthings[1] = %p = %f\n", things[1], *((float *)things[1]));

  printf("\nthings[2] = %p = %s\n", things[2], (char *)things[2]);
  
  printf("\nthings[3] = %p = (%f, %f)\n", things[3], ((struct point *)things[3]) -> x , ((struct point *)things[3]) -> y);
 
  return 0;
}
