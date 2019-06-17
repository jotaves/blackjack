#ifndef _Dealer_h
#define _Dealer_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Cards.h"
#include "Game_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Dealer__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Dealer__dealer_hit(int32_t cc);
extern void Dealer__dealer_stand(void);
extern void Dealer__dealer_init(int32_t cc);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Dealer_h */
