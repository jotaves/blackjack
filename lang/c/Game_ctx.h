#ifndef _Game_ctx_h
#define _Game_ctx_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Game_ctx__PLAYER,
    Game_ctx__DEALER
    
} Game_ctx__PLAYER_TYPE;
#define Game_ctx__PLAYER_TYPE__max 2

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Game_ctx__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Game_ctx_h */
