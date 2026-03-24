#include <iostream>
#include <mutex>
#include <thread>

using namespace std;

constexpr int ROWS = 5;
constexpr int COLS = 5;

thread_local int thrd_counter;
thread_local int total_count = 0;

mutex writeMutex;

void addCol(int matrix[ROWS][COLS], int colNum) {
  for (int kk = 0; kk < ROWS; kk++) {
    total_count += *(((*matrix) + kk) + colNum);
    // total_count += matrix[kk][colNum]; //both are acceptable
  }
  unique_lock<mutex> lock(writeMutex);
  cout << "Column " << colNum + 1 << ": " << total_count << endl;
}

int main(void) {

  int matrix[ROWS][COLS];
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

  for (ii = 0; ii < COLS; ii++) {
    thrd_counter = ii;
    t[ii] = thread(addCol, matrix, thrd_counter);
    t[ii].join();
  }

  // for (int ww = 0; ww < COLS; ww++) {
  //   t[ww].join();
  // }

  cout << "Finished" << endl;

  return 0;
}
