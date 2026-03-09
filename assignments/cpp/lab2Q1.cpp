// Example of static, stack, and heap variables


#include <iostream>
#include <string>

using namespace std;

static string staticVar = "Static Variable";

int main(void) {

  string stackVar = "Stack Variable";

  string *heapVar = new string;
  *heapVar = "Heap Variable";

  cout << staticVar << endl << stackVar << endl << *heapVar << endl;

  return 0;
}
