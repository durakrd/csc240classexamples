#include "student.h"

int main(void) {
  int s1Nums[10] = {100, 100, 100, 93, 93, 93, 98, 93, 92, 94};
  float s1Average = averageCalc(s1Nums);
  char s1Grade = assignGrade(s1Average);
  studRec s1 = {.year = 2000,
                .name = "Chistopher Nolan",
                .studentID = 234234,
                .grade = &s1Nums[0],
                .lGrade = s1Grade};

  int s2Nums[10] = {0, 80, 100, 93,50, 55, 55, 34, 92, 94};
  float s2Average = averageCalc(s2Nums);
  char s2Grade = assignGrade(s2Average);
  studRec s2 = {.year = 1919,
                .name = "Batman",
                .studentID = 2334,
                .grade = s2Nums,
                .lGrade = s2Grade};

  printRecord(&s1);
  printRecord(&s2);

  return 0;
}
