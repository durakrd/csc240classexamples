#include "term.h"
#include <stdio.h>
#include <stdlib.h>

char *term_to_string(const term_t *term) {

  char *rtnPtr = malloc(10 * sizeof(char));

  if (term->coefficient == 0) {
    sprintf(rtnPtr, "%d", 0);
  } else if (term->exponent == 0) {
    sprintf(rtnPtr, "%d", term->coefficient);
  } else if (term->exponent == 1) {
    sprintf(rtnPtr, "%d%c", term->coefficient, term->var);
  } else {
    sprintf(rtnPtr, "%d%c^%d", term->coefficient, term->var, term->exponent);
  }
  return rtnPtr;
}
