#include <iostream>
#include <mutex>
#include <thread>

using namespace std;

thread_local int thrd_counter;
thread_local int total_count = 0;

mutex writeMutex;

void addCol(vector<vector<int>> matrix, int colNum) {
  for (auto vec : matrix) {
    total_count += vec[colNum];
  }
  unique_lock<mutex> lock(writeMutex);
  cout << "Column " << colNum + 1 << ": " << total_count << endl;
}

int main(void) {
  constexpr int ROWS = 5;
  constexpr int COLS = 5;

  vector<vector<int>> matrix(ROWS, vector<int>(COLS));
  int ii, jj;

  thread t[COLS];
  srand(time(NULL));

  for (ii = 0; ii < ROWS; ii++) {
    for (jj = 0; jj < COLS; jj++) {
      matrix[ii][jj] = rand() % 10;
      cout << matrix[ii][jj] << " ";
    }
    cout << endl;
  }

  // int total_count[COLS];
  for (ii = 0; ii < COLS; ii++) {
    thrd_counter = ii;
    t[ii] = thread(addCol, matrix, thrd_counter);
  }

  for (int ww = 0; ww < COLS; ww++) {
    t[ww].join();
  }

  cout << "Finished" << endl;

  return 0;
}
