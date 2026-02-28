
#include <string>
#include <iostream>

using namespace std;

class Movie {

public:
  string title;
  string director;
  int year;
  string rating;

  Movie(string t, string d, int y, string r)
      : title(t), director(d), year(y), rating(r) {}

  void printMovie() {
    cout << title + " by " + director + "\n" + to_string(year) + "(" + rating + ")" << endl;
  }
};


int main(void) {
  // Reference Semantic
  Movie *m1 = new Movie("Dark Knight", "Christopher Nolan", 2008, "PG-13");

  // Value Semantic
  Movie m2("Interstellar", "Christopher Nolan", 2011, "PG-13");

  m1->printMovie();
  m2.printMovie();
}
