#ifndef _Player_h
#define _Player_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Cards_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Player__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Player__player_hit(int32_t cc);
extern void Player__player_stand(void);
extern void Player__double_down(void);
extern void Player__split(void);
extern void Player__accept_insurance(void);
extern void Player__reject_insurance(void);
extern void Player__surrender(void);
extern void Player__set_bet(int32_t bet);
extern void Player__player_init(int32_t xx, int32_t yy);
extern void Player__get_player_blackjack(bool *rr);
extern void Player__get_player_lose(bool *rr);
extern void Player__get_player_points_sum(int32_t *rr);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Player_h */
