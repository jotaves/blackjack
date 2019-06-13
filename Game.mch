/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE
    Game
SEES Cards, Game_ctx
INCLUDES Player, Dealer
VARIABLES game_cards
INVARIANT game_cards <: CARDS * SUITS & game_cards /\ player_cards /\ dealer_cards = {}
INITIALISATION game_cards := CARDS * SUITS
OPERATIONS
    hit_action =
    PRE player_bet /= 0 & player_points_sum < 22 & player_has_stand = FALSE & player_points_sum < 21
    THEN
    	ANY cc
   	WHERE cc : game_cards
    	THEN game_cards := game_cards - {cc} || player_hit(cc)
    	END
    END;
    
    stand_action =
    PRE player_bet /= 0 & dealer_can_start = FALSE & dealer_can_hit = TRUE
    THEN player_stand ||
        ANY cc
        WHERE cc \/ dealer_cards <: CARDS * SUITS & (SIGMA zz . (zz : cc \/ dealer_cards | cards_points(prj1(CARDS, SUITS)(zz))) > 16)
        THEN game_cards := game_cards - cc || dealer_hit(cc)
        END
    END;

    set_bet_action(bet) =
    PRE bet : NAT & card(dealer_cards) = 0 & dealer_can_start = TRUE
    THEN set_bet(bet) || dealer_init
    END;

    winner <-- finish_game =
    PRE 1=1
    THEN winner := 0
    END
END