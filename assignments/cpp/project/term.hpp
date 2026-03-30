#ifndef TERM_H
#define TERM_H

#include <string>

using namespace std;

class Term {
public:
  int coefficient;
  int exponent;
  string variable;

  Term(int c = 0, int e = 0, string v = "x")
      : coefficient(c), exponent(e), variable(v) {}

  string toString(void) {
    if (coefficient == 0) {
      return "0";
    }
    else if (exponent == 0) {
      return to_string(coefficient);
    }
    else if (exponent == 1) {
      return to_string(coefficient) + variable;
    }
    else {
      return to_string(coefficient) + variable + "^" +
	to_string(exponent);
    }
  }
};

#endif
