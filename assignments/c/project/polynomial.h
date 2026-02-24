#ifndef POLY_H
#define POLY_H

#include "basiclist.h"
#include "term.h"

typedef struct {
  node_t *trmLsPtr;
  int degree;
  /* assumes only one variable for entire polynomial */
  char mainVar;
} poly_t;

poly_t * new_polynomial(void);
void print_polynomial(const poly_t *poly);
void add_to_polynomial(poly_t *poly, const term_t *term);
poly_t *combine_like_terms(const poly_t *poly);
void delete_polynomial(poly_t **poly);

#endif
