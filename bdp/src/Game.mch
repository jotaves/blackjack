/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE
    Game
SEES Cards , Game_ctx
INCLUDES Player , Dealer
ABSTRACT_VARIABLES game_cards , current_player
INVARIANT game_cards <: CARDS * SUITS & current_player : PLAYER_TYPE
INITIALISATION game_cards := CARDS * SUITS || current_player := PLAYER
OPERATIONS
    hit_action =
    PRE player_bet /= 0
    THEN
            ANY cc
           WHERE cc : game_cards
            THEN game_cards := game_cards - { cc } || player_hit ( cc )
            END
    END ;

    stand_action =
    PRE SIGMA zz . ( zz : ran ( player_points ) | zz ) <= 21 & SIGMA zz . ( zz : ran ( player_points ) | zz ) >= 0 & player_bet /= 0
    THEN current_player := DEALER ||
        ANY cc
        WHERE cc : CARDS * SUITS
        THEN game_cards := game_cards - { cc } || dealer_hit ( cc )
        END
    END ;

    set_bet_action ( bet ) =
    PRE bet : NAT
    THEN set_bet ( bet )
    END
END
