#include <iostream>
#include <vector>

using namespace std;

class NumberList {
public:
  vector<int> vec;
  
  NumberList(int capacity) {
    vec = vector<int>(capacity);
  }

  void add(int x) {
    if (vec.size() == vec.capacity()) {
      throw out_of_range("You've reached full capacity");
    }
    vec.push_back(x);
  }

  void print_list(void) {
    cout << "Size: " << vec.size() << endl;
    for (int x : vec) {
      cout << x << " ";
    }
    cout << endl;
  }
};


int main(void) {
  NumberList n(10);
  NumberList a(2);

  n.add(3);
  n.add(9);

  n.print_list();

  a.add(3);
  a.add(4);
  a.add(7);
  
  return 0;
}
