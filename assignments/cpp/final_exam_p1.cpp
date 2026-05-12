#include <cmath>
#include <iostream>


using namespace std;

int recur_func(int x) {
  if (x == 1 || x == 0) {
    return 1;
  }
  else {
    return pow(recur_func(x-1), 2) + recur_func(x - 2);
  }
}

int main(void) {
  cout << recur_func(3) << endl;

  return 0;
}
