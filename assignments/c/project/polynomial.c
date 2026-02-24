#include "polynomial.h"
#include "basiclist.h"
#include "term.h"
#include <stdio.h>
#include <stdlib.h>

poly_t * new_polynomial(void) {
  poly_t *rtnPoly = (poly_t *)malloc(sizeof(poly_t));
  rtnPoly->trmLsPtr = NULL;
  return rtnPoly;
}

void print_polynomial(const poly_t *poly) {

  printf("Polynomial of degree %d: ", poly->degree);

  /* Prints first term without + sign */
  node_t *termLs = poly->trmLsPtr;
  term_t *currTerm = (term_t *)termLs->data;
  printf("%s", term_to_string(currTerm));
  termLs = termLs->next;

  while (termLs != NULL) {
    currTerm = (term_t *)termLs->data;
    printf(" + %s", term_to_string(currTerm));
    termLs = termLs->next;
  }
}

void add_to_polynomial(poly_t *poly, const term_t *term) {
  /* Initializes poly_t struct if first term */
  if (poly->trmLsPtr == NULL) {
    poly->degree = term->exponent;
    /* Only accepts one main variable for entire polynomial */
    poly->mainVar = term->var;
  }

  list_add(&(poly->trmLsPtr), term);

  if (term->exponent > poly->degree) {
    poly->degree = term->exponent;
  }
}

poly_t *combine_like_terms(const poly_t *poly) {

  /*
   Initializes array of terms with zeros for coefficients
   with index equal to exponent
  */
  int maxDeg = poly->degree;
  term_t *termArr = malloc((maxDeg + 1) * sizeof(term_t));
  for (int p = 0; p <= maxDeg; p++) {
    (termArr + p)->coefficient = 0;
    (termArr + p)->var = poly->mainVar;
    (termArr + p)->exponent = p;
  }

  node_t *termLs = poly->trmLsPtr;
  term_t *currTerm;
  while (termLs != NULL) {
    currTerm = (term_t *)termLs->data;
    /* Add coefficient to term array */
    (termArr + currTerm->exponent)->coefficient += currTerm->coefficient;
    termLs = termLs->next;
  }

  poly_t *rtnPoly = new_polynomial();
  for (int jj = 0; jj <= maxDeg; jj++) {
    if ((termArr+jj)->coefficient != 0) {
      add_to_polynomial(rtnPoly,(termArr+jj));
    }
  }
  return rtnPoly;
}

void delete_polynomial(poly_t **poly) {
  free(*poly);
}
