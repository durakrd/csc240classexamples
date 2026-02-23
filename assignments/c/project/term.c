#include "term.h"
#include <stdio.h>
#include <stdlib.h>

char *term_to_string(const term_t *term) {

  char *rtnPtr = malloc(10 * sizeof(char));

  if (term->exponent == 0) {
    sprintf(rtnPtr, "%d", term->coefficient);
  }
  else if (term->coefficient == 0) {
    sprintf(rtnPtr, "%d", 0);
  }
  else {
    sprintf(rtnPtr, "%d%c^%d", term->coefficient, term->var, term->exponent);
  }
  return rtnPtr;
}
