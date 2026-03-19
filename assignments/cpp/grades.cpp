#include <iostream>
#include <vector>

using namespace std;

class Grades {
public:
  vector<int> vec;
  
  void add(int x) {
    vec.push_back(x);
  }

  void print() {
    double totlCount = vec.size();
    int sum = 0;
    for (int grd : vec) {
      cout << grd << " ";
      sum += grd;
    }
    cout<< "     Avg: " << sum/totlCount << endl;
  }
};


int main(void) {

  Grades grader;

  grader.add(91);
  grader.add(100);
  grader.add(87);
  grader.add(95);
  grader.add(98);

  grader.print();
  
  return 0;
}
