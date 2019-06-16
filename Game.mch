/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE
    Game
SEES Cards, Game_ctx
INCLUDES Player, Dealer
VARIABLES game_cards
INVARIANT game_cards <: 1..52 & game_cards /\ player_cards /\ dealer_cards = {}
INITIALISATION game_cards := 0..52
OPERATIONS
    player_init_action =
    PRE card(player_cards) = 0 & player_bet /= 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = TRUE
    THEN    ANY cc
   	WHERE cc <: game_cards & card(cc) = 2
    	THEN game_cards := game_cards - cc || player_init(cc)
    	END 
    END;

    player_hit_action =
    PRE player_bet /= 0 & player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & player_points_sum < 22 & dealer_has_start = TRUE
    THEN
    	ANY cc
   	WHERE cc : game_cards
    	THEN game_cards := game_cards - {cc} || player_hit(cc)
    	END
    END;
    
    player_stand_action =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & dealer_has_start = TRUE
    THEN player_stand
    END;

    dealer_init_action =
    PRE card(dealer_cards) = 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = FALSE & dealer_has_stand = FALSE
    THEN    ANY cc
   	WHERE cc : game_cards
    	THEN game_cards := game_cards - {cc} || dealer_init(cc)
    	END 
    END;

    dealer_hit_action =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE & player_has_stand = TRUE & dealer_points_sum < 22
    THEN	ANY cc
   	WHERE cc : game_cards
    	THEN game_cards := game_cards - {cc} || dealer_hit(cc)
    	END
    END;

    dealer_stand_action =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE & player_has_stand = TRUE
    THEN dealer_stand
    END;

    player_set_bet_action(bet) =
    PRE bet : NAT & player_has_set_bet = FALSE
    THEN set_bet(bet)
    END;

    winner <-- finish_game =
    PRE 1=1
    THEN winner := 0
    END
END