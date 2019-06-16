/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Cards.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */

const int32_t Cards__cards_points_i[13] = {11,2,3,4,5,6,7,8,9,10,10,10,10};
/* Clause CONCRETE_VARIABLES */

static bool Cards__deck_cards_i[52];
/* Clause INITIALISATION */
void Cards__INITIALISATION(void)
{
    
    {
        int32_t ii;
        
        ii = 0;
        while(((ii) <= (51)))
        {
            Cards__deck_cards_i[ii] = true;
            ii = ii+1;
        }
    }
}

