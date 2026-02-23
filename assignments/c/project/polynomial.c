#include "polynomial.h"
#include "basiclist.h"
#include "term.h"
#include <stdio.h>
#include <stdlib.h>

poly_t *new_polynomial() {
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

  poly_t *rtnPoly = new_polynomial();

  /* Initializes array of zeros for coefficient totals*/
  int maxDeg = poly->degree;
  int *coefArr = malloc((maxDeg+1) * sizeof(int));
  for (int p = 0; p <= maxDeg; p++) {
    *(coefArr + p) = 0;
  }

  node_t *termLs = poly->trmLsPtr;
  term_t *currTerm;
  while (termLs != NULL) {
    currTerm = (term_t *)termLs->data;
    /* Add coefficient to exponent array */
    termLs = termLs->next;
  }

  return rtnPoly;
}

void delete_polynomial(poly_t **poly) { free(*poly); }
