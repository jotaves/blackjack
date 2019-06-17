#ifndef _Game_h
#define _Game_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Game_ctx.h"

/* Clause INCLUDES */
#include "Player.h"
#include "Dealer.h"

/* Clause IMPORTS */
#include "Player.h"
#include "Dealer.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Game__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Game__player_init_action(void);
extern void Game__player_hit_action(void);
extern void Game__player_stand_action(void);
extern void Game__dealer_init_action(void);
extern void Game__dealer_hit_action(void);
extern void Game__dealer_stand_action(void);
extern void Game__player_set_bet_action(int32_t bet);
extern void Game__finish_game(Game_ctx__PLAYER_TYPE *winner);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Game_h */
