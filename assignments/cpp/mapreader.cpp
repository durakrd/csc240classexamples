#include <map>
#include <fstream>
#include <iostream>
#include <sstream>

using namespace std;

int main(int argc, char *argv[]) {
  map<string, int> counter;

  ifstream bentext;
  string buffer;
  string token;

  bentext.open(argv[1]);

  while (getline(bentext, buffer)) {
    auto lineStream = istringstream(buffer);

    while (lineStream >> token) {
      if (counter.find(token) == counter.end()) {
        counter.insert(pair<string, int>(token, 1));
      } else {
        counter.at(token) += 1;
      }
    }
  }

  int totalCount = 0;
  for (auto itr = counter.begin(); itr != counter.end(); itr++) {
    cout << itr->first << " appeared " << itr->second << " times" << endl;
    totalCount += itr->second;
  }
  cout << totalCount << " total words" << endl;

  return 0;
}
