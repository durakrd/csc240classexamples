#include <stdio.h>
#include "student.h"

float averageCalc(int *gList) {
  float total = 0.0;
  for (int ii = 0; ii < 10; ii++) {
    total += *gList;
    gList++;
  }
  return total/10.0;
}

char assignGrade(float numGrade) {
  if (numGrade >= 90.0) {
    return 'A';
  } else if (numGrade >= 80.0) {
    return 'B';
  } else if (numGrade >= 70.0) {
    return 'C';
  } else {
    return 'F';
  }
}

void printRecord(studRec *student) {
  float avg = averageCalc(student->grade);
  printf("\nName:%s Year:%d, ID:%d\n\tGrade: = %.2f (%c)\n", student->name,
	 student->year, student->studentID, avg, student->lGrade);
}
