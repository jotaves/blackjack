/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Game.h"

/* Clause SEES */
#include "Game_ctx.h"

/* Clause IMPORTS */
#include "Player.h"
#include "Dealer.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool Game__deck_cards_i[52];
static bool Game__dealer_blackjack_i;
static bool Game__player_blackjack_i;
static bool Game__dealer_lose_i;
static bool Game__player_lose_i;
static int32_t Game__dealer_points_sum_i;
static int32_t Game__player_points_sum_i;
/* Clause INITIALISATION */
void Game__INITIALISATION(void)
{
    
    unsigned int i = 0;
    Dealer__INITIALISATION();
    Player__INITIALISATION();
    for(i = 0; i <= 51;i++)
    {
        Game__deck_cards_i[i] = true;
    }
    Game__dealer_blackjack_i = false;
    Game__player_blackjack_i = false;
    Game__dealer_lose_i = false;
    Game__player_lose_i = false;
    Game__dealer_points_sum_i = 0;
    Game__player_points_sum_i = 0;
}

/* Clause OPERATIONS */

void Game__player_init_action(void)
{
    {
        int32_t cc1;
        int32_t cc2;
        
        cc1 = 0;
        cc2 = 6;
        Game__deck_cards_i[cc1] = false;
        Game__deck_cards_i[cc2] = false;
        Player__player_init(cc1, cc2);
    }
}

void Game__player_hit_action(void)
{
    {
        int32_t cc;
        
        cc = 4;
        Game__deck_cards_i[cc] = false;
        Player__player_hit(cc);
    }
}

void Game__player_stand_action(void)
{
    Player__player_stand();
}

void Game__dealer_init_action(void)
{
    {
        int32_t cc;
        
        cc = 7;
        Game__deck_cards_i[cc] = false;
        Dealer__dealer_init(cc);
    }
}

void Game__dealer_hit_action(void)
{
    {
        int32_t cc;
        
        cc = 8;
        Game__deck_cards_i[cc] = false;
        Dealer__dealer_hit(cc);
    }
}

void Game__dealer_stand_action(void)
{
    Dealer__dealer_stand();
}

void Game__player_set_bet_action(int32_t bet)
{
    Player__set_bet(bet);
}

void Game__finish_game(Game_ctx__PLAYER_TYPE *winner)
{
    Dealer__get_dealer_blackjack(&Game__dealer_blackjack_i);
    Player__get_player_blackjack(&Game__player_blackjack_i);
    Player__get_player_lose(&Game__player_lose_i);
    Dealer__get_dealer_lose(&Game__dealer_lose_i);
    Player__get_player_points_sum(&Game__player_points_sum_i);
    Dealer__get_dealer_points_sum(&Game__dealer_points_sum_i);
    if(Game__dealer_blackjack_i == true)
    {
        (*winner) = Game_ctx__PLAYER;
    }
    else
    {
        if(Game__player_blackjack_i == true)
        {
            (*winner) = Game_ctx__DEALER;
        }
        else
        {
            if(Game__player_lose_i == true)
            {
                (*winner) = Game_ctx__DEALER;
            }
            else
            {
                if(Game__dealer_lose_i == true)
                {
                    (*winner) = Game_ctx__PLAYER;
                }
                else
                {
                    if((Game__player_points_sum_i) > (Game__dealer_points_sum_i))
                    {
                        (*winner) = Game_ctx__PLAYER;
                    }
                    else
                    {
                        (*winner) = Game_ctx__DEALER;
                    }
                }
            }
        }
    }
}

