/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Cards.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Cards__cards_points_i[52];
/* Clause INITIALISATION */
void Cards__INITIALISATION(void)
{
    
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (51))
        {
            if((ii) <= (3))
            {
                Cards__cards_points_i[ii] = 11;
            }
            else
            {
                if((ii) <= (7))
                {
                    Cards__cards_points_i[ii] = 2;
                }
                else
                {
                    if((ii) <= (11))
                    {
                        Cards__cards_points_i[ii] = 3;
                    }
                    else
                    {
                        if((ii) <= (15))
                        {
                            Cards__cards_points_i[ii] = 4;
                        }
                        else
                        {
                            if((ii) <= (19))
                            {
                                Cards__cards_points_i[ii] = 5;
                            }
                            else
                            {
                                if((ii) <= (23))
                                {
                                    Cards__cards_points_i[ii] = 6;
                                }
                                else
                                {
                                    if((ii) <= (27))
                                    {
                                        Cards__cards_points_i[ii] = 7;
                                    }
                                    else
                                    {
                                        if((ii) <= (31))
                                        {
                                            Cards__cards_points_i[ii] = 8;
                                        }
                                        else
                                        {
                                            if((ii) <= (35))
                                            {
                                                Cards__cards_points_i[ii] = 9;
                                            }
                                            else
                                            {
                                                if((ii) <= (39))
                                                {
                                                    Cards__cards_points_i[ii] = 10;
                                                }
                                                else
                                                {
                                                    if((ii) <= (43))
                                                    {
                                                        Cards__cards_points_i[ii] = 10;
                                                    }
                                                    else
                                                    {
                                                        if((ii) <= (47))
                                                        {
                                                            Cards__cards_points_i[ii] = 10;
                                                        }
                                                        else
                                                        {
                                                            if((ii) <= (51))
                                                            {
                                                                Cards__cards_points_i[ii] = 10;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ii = ii+1;
        }
    }
}

