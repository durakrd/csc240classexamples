#ifndef STUDENT_H
#define STUDENT_H

/* student structure */
typedef struct {
  int year;
  char *name;
  int studentID;
  int *grade;
  char lGrade;
} studRec;

void printRecord(studRec *student);
float averageCalc(int *gList);
char assignGrade(float numGrade);

#endif
