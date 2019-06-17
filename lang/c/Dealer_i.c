/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Dealer.h"

/* Clause SEES */
#include "Cards.h"
#include "Game_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */

const int32_t Dealer__cards_points_i[13] = {11,2,3,4,5,6,7,8,9,10,10,10,10};
/* Clause CONCRETE_VARIABLES */

static bool Dealer__dealer_cards_i[52];
static int32_t Dealer__dealer_points_i[52];
static int32_t Dealer__dealer_points_sum_i;
static bool Dealer__dealer_has_start_i;
static bool Dealer__dealer_has_stand_i;
static bool Dealer__dealer_lose_i;
static bool Dealer__dealer_blackjack_i;
/* Clause INITIALISATION */
void Dealer__INITIALISATION(void)
{
    
    {
        int32_t ii;
        
        ii = 0;
        while(((ii) <= (51)))
        {
            Dealer__dealer_cards_i[ii] = false;
            Dealer__dealer_points_i[ii] = 0;
            ii = ii+1;
        }
    }
    Dealer__dealer_points_sum_i = 0;
    Dealer__dealer_has_start_i = false;
    Dealer__dealer_has_stand_i = false;
    Dealer__dealer_lose_i = false;
    Dealer__dealer_blackjack_i = false;
}

/* Clause OPERATIONS */

void Dealer__dealer_hit(int32_t cc)
{
    Dealer__dealer_cards_i[cc] = true;
    {
        int32_t dp0;
        
        dp0 = Dealer__dealer_points_sum_i+Dealer__cards_points_i[cc % 13];
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
                        
                        dp = Dealer__dealer_points_i[ii];
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
                        Dealer__dealer_points_i[ii] = 1;
                        Dealer__dealer_points_i[cc] = 11;
                        Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i-10+11;
                        {
                            int32_t dp1;
                            
                            dp1 = Dealer__dealer_points_sum_i-10+11;
                            if(21 == dp1)
                            {
                                Dealer__dealer_blackjack_i = true;
                            }
                        }
                    }
                    else
                    {
                        Dealer__dealer_points_i[ii] = 1;
                        Dealer__dealer_points_i[cc] = Dealer__cards_points_i[cc % 13];
                        Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i-10+Dealer__cards_points_i[cc % 13];
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
                            
                            dp2 = Dealer__dealer_points_sum_i+11;
                            if((dp2) > (21))
                            {
                                Dealer__dealer_points_i[cc] = 1;
                                Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i+1;
                                {
                                    int32_t dp3;
                                    
                                    dp3 = Dealer__dealer_points_sum_i+1;
                                    if(21 == dp3)
                                    {
                                        Dealer__dealer_blackjack_i = true;
                                    }
                                }
                            }
                            else
                            {
                                Dealer__dealer_points_i[cc] = 11;
                                Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i+11;
                                {
                                    int32_t dp4;
                                    
                                    dp4 = Dealer__dealer_points_sum_i+11;
                                    if(21 == dp4)
                                    {
                                        Dealer__dealer_blackjack_i = true;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        Dealer__dealer_points_i[cc] = Dealer__cards_points_i[cc % 13];
                        Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i+Dealer__cards_points_i[cc % 13];
                        {
                            int32_t dp5;
                            
                            dp5 = Dealer__dealer_points_sum_i+Dealer__cards_points_i[cc % 13];
                            if((21) < (dp5))
                            {
                                Dealer__dealer_lose_i = true;
                            }
                        }
                    }
                }
            }
        }
        else
        {
            Dealer__dealer_points_i[cc] = Dealer__cards_points_i[cc % 13];
            Dealer__dealer_points_sum_i = Dealer__dealer_points_sum_i+Dealer__cards_points_i[cc % 13];
            {
                int32_t dp6;
                
                dp6 = Dealer__dealer_points_sum_i+Dealer__cards_points_i[cc % 13];
                if(21 == dp6)
                {
                    Dealer__dealer_blackjack_i = true;
                }
            }
        }
    }
}

void Dealer__dealer_stand(void)
{
    Dealer__dealer_has_stand_i = true;
}

void Dealer__dealer_init(int32_t cc)
{
    Dealer__dealer_cards_i[cc] = true;
    Dealer__dealer_points_i[cc] = Dealer__cards_points_i[cc % 13];
    Dealer__dealer_points_sum_i = Dealer__cards_points_i[cc % 13];
    Dealer__dealer_has_start_i = true;
}

