/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Player.h"

/* Clause SEES */
#include "Cards_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */

const int32_t Player__cards_points_i[13] = {11,2,3,4,5,6,7,8,9,10,10,10,10};
/* Clause CONCRETE_VARIABLES */

static bool Player__player_cards_i[52];
static int32_t Player__player_bet;
static int32_t Player__player_points_i[52];
static int32_t Player__player_points_sum_i;
static bool Player__player_has_stand_i;
static bool Player__player_has_start_i;
static bool Player__player_has_set_bet_i;
static bool Player__player_blackjack_i;
static bool Player__player_lose_i;
/* Clause INITIALISATION */
void Player__INITIALISATION(void)
{
    
    unsigned int i = 0;
    Player__player_bet = 0;
    for(i = 0; i <= 51;i++)
    {
        Player__player_cards_i[i] = false;
    }
    for(i = 0; i <= 51;i++)
    {
        Player__player_points_i[i] = 0;
    }
    Player__player_points_sum_i = 0;
    Player__player_has_stand_i = false;
    Player__player_has_start_i = false;
    Player__player_has_set_bet_i = false;
    Player__player_blackjack_i = false;
    Player__player_lose_i = false;
}

/* Clause OPERATIONS */

void Player__player_hit(int32_t cc)
{
    Player__player_cards_i[cc] = true;
    {
        int32_t dp0;
        
        dp0 = Player__player_points_sum_i+Player__cards_points_i[cc % 13];
        if((dp0) > (21))
        {
            {
                int32_t ii;
                bool not_found_11_ace;
                
                ii = 0;
                not_found_11_ace = true;
                while(((not_found_11_ace == true) &&
                    ((ii) <= (51))))
                {
                    {
                        int32_t dp;
                        
                        dp = Player__player_points_i[ii];
                        if(dp == 11)
                        {
                            not_found_11_ace = false;
                        }
                        else
                        {
                            ii = ii+1;
                        }
                    }
                }
                if(not_found_11_ace == false)
                {
                    if((((cc == 0) ||
                            (cc == 13)) ||
                        (cc == 26)) ||
                    (cc == 39))
                    {
                        Player__player_points_i[ii] = 1;
                        Player__player_points_i[cc] = 11;
                        Player__player_points_sum_i = Player__player_points_sum_i-10+11;
                        {
                            int32_t dp1;
                            
                            dp1 = Player__player_points_sum_i-10+11;
                            if(21 == dp1)
                            {
                                Player__player_blackjack_i = true;
                            }
                        }
                    }
                    else
                    {
                        Player__player_points_i[ii] = 1;
                        Player__player_points_i[cc] = Player__cards_points_i[cc % 13];
                        Player__player_points_sum_i = Player__player_points_sum_i-10+Player__cards_points_i[cc % 13];
                    }
                }
                else
                {
                    if((((cc == 0) ||
                            (cc == 13)) ||
                        (cc == 26)) ||
                    (cc == 39))
                    {
                        {
                            int32_t dp2;
                            
                            dp2 = Player__player_points_sum_i+11;
                            if((dp2) > (21))
                            {
                                Player__player_points_i[cc] = 1;
                                Player__player_points_sum_i = Player__player_points_sum_i+1;
                                {
                                    int32_t dp3;
                                    
                                    dp3 = Player__player_points_sum_i+1;
                                    if(21 == dp3)
                                    {
                                        Player__player_blackjack_i = true;
                                    }
                                }
                            }
                            else
                            {
                                Player__player_points_i[cc] = 11;
                                Player__player_points_sum_i = Player__player_points_sum_i+11;
                                {
                                    int32_t dp4;
                                    
                                    dp4 = Player__player_points_sum_i+11;
                                    if(21 == dp4)
                                    {
                                        Player__player_blackjack_i = true;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        Player__player_points_i[cc] = Player__cards_points_i[cc % 13];
                        Player__player_points_sum_i = Player__player_points_sum_i+Player__cards_points_i[cc % 13];
                        {
                            int32_t dp5;
                            
                            dp5 = Player__player_points_sum_i+Player__cards_points_i[cc % 13];
                            if((21) < (dp5))
                            {
                                Player__player_lose_i = true;
                            }
                        }
                    }
                }
            }
        }
        else
        {
            Player__player_points_i[cc] = Player__cards_points_i[cc % 13];
            Player__player_points_sum_i = Player__player_points_sum_i+Player__cards_points_i[cc % 13];
            {
                int32_t dp6;
                
                dp6 = Player__player_points_sum_i+Player__cards_points_i[cc % 13];
                if(21 == dp6)
                {
                    Player__player_blackjack_i = true;
                }
            }
        }
    }
}

void Player__player_stand(void)
{
    Player__player_has_stand_i = true;
}

void Player__set_bet(int32_t bet)
{
    Player__player_bet = bet;
    Player__player_has_set_bet_i = true;
}

void Player__player_init(int32_t xx, int32_t yy)
{
    Player__player_cards_i[xx] = true;
    Player__player_cards_i[yy] = true;
    if((((((xx == 0) ||
                    (xx == 13)) ||
                (xx == 26)) ||
            (xx == 39))) &&
    (((((yy == 0) ||
                    (yy == 13)) ||
                (yy == 26)) ||
            (yy == 39))))
    {
        Player__player_points_i[xx] = 11;
        Player__player_points_i[yy] = 1;
        Player__player_points_sum_i = Player__player_points_sum_i+11+1;
    }
    else
    {
        if((((((xx == 0) ||
                        (xx == 13)) ||
                    (xx == 26)) ||
                (xx == 39))) &&
        ((((((yy) != (0)) &&
                        ((yy) != (13))) &&
                    ((yy) != (26))) &&
                ((yy) != (39)))))
        {
            Player__player_points_i[xx] = 11;
            Player__player_points_i[yy] = Player__cards_points_i[yy % 13];
            Player__player_points_sum_i = Player__player_points_sum_i+11+Player__cards_points_i[yy % 13];
        }
        else
        {
            if(((((((xx) != (0)) &&
                            ((xx) != (13))) &&
                        ((xx) != (26))) &&
                    ((xx) != (39)))) &&
            (((((yy == 0) ||
                            (yy == 13)) ||
                        (yy == 26)) ||
                    (yy == 39))))
            {
                Player__player_points_i[xx] = Player__cards_points_i[xx % 13];
                Player__player_points_i[yy] = 11;
                Player__player_points_sum_i = Player__player_points_sum_i+Player__cards_points_i[xx % 13]+11;
            }
            else
            {
                Player__player_points_i[xx] = Player__cards_points_i[xx % 13];
                Player__player_points_i[yy] = Player__cards_points_i[yy % 13];
                Player__player_points_sum_i = Player__player_points_sum_i+Player__cards_points_i[xx % 13]+Player__cards_points_i[yy % 13];
            }
        }
    }
    Player__player_has_start_i = true;
}

void Player__get_player_blackjack(bool *rr)
{
    (*rr) = Player__player_blackjack_i;
}

void Player__get_player_lose(bool *rr)
{
    (*rr) = Player__player_lose_i;
}

void Player__get_player_points_sum(int32_t *rr)
{
    (*rr) = Player__player_points_sum_i;
}

