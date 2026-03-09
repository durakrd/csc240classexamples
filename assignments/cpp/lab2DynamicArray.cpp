#include <iostream>

class DynamicArray {
public:
  int arrLength;
  int *dynArr;

  DynamicArray(int len) {
    arrLength = len;
    dynArr = new int[len];
  }

  ~DynamicArray(void) {
    delete[] dynArr;
    dynArr = nullptr;
  }

  void fill_array(int num) {
    for (int ii = 0; ii < arrLength; ii++) {
      dynArr[ii] = num;
    }
  }

  void print_array(void) {

    std::cout << "Dynamic Array Length: " << arrLength << std::endl;

    for (int ii = 0; ii < arrLength; ii++) {
      std::cout << dynArr[ii] << " ";
    }
    std::cout << std::endl;
  }
};

int main(void) {
  DynamicArray a(9);
  a.fill_array(1); /* fills array with consecutive #’s */
  a.print_array();

  DynamicArray b(10);
  b.fill_array(2);
  b.print_array();

  return 0;
}
