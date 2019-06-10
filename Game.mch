/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE
    Game
SEES Cards, Game_ctx
INCLUDES Player, Dealer
VARIABLES game_cards, current_player
INVARIANT game_cards <: CARDS * SUITS & current_player : PLAYER_TYPE
INITIALISATION game_cards := CARDS * SUITS || current_player := PLAYER
OPERATIONS
    hit_action =
    ANY cc
    WHERE cc : CARDS * SUITS
    THEN game_cards := game_cards - {cc} || player_hit(cc)
    END;
    
    stand_action =
    PRE player_points <= 21 & player_points >= 0
    THEN current_player := DEALER || 
        ANY cc
        WHERE cc : CARDS * SUITS
        THEN game_cards := game_cards - {cc} || dealer_hit(cc)
        END
    END
END