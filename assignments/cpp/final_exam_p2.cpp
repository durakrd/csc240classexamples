#include <iostream>
#include <vector>

using namespace std;

int funcperim(int x, int y) {
  return (2 * x) + (2 * y);
}

int funcarea(int x, int y) {
  return x * y;
}

vector<int> funclist(vector<int> xLst, int y) {
  vector<int> rtrnLst;

  for (int x : xLst) {
    rtrnLst.push_back(funcarea(x, y));
  }

  return rtrnLst;
}

int main(void) {
  cout << funcperim(10, 14) << endl;
  cout << funcarea(10, 14) << endl;

  vector<int> xLst = {1, 2, 3, 4};
  vector<int> rtrnLst = funclist(xLst, 5);

  for (int x : rtrnLst) {
    cout << x << " ";
  }
  cout << endl;

  int t = 200;
  char c = 'C';
  int *iptr = &t;
  char *cptr = &c;

  cout << iptr << "   iptr: " << iptr+1 << endl;
  cout << cptr << "   cptr: " << cptr+1 << endl;
  
  
  return 0;
}
