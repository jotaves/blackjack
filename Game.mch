/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE Game
SEES Game_ctx
INCLUDES Player, Dealer, Cards
INVARIANT deck_cards /\ player_cards /\ dealer_cards = {}
OPERATIONS
    player_init_action =
    PRE card(player_cards) = 0 & player_bet /= 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = TRUE
    THEN    ANY cc
   	WHERE cc <: deck_cards & card(cc) = 2
    	THEN set_cards(deck_cards - cc) || player_init(cc)
    	END 
    END;

    player_hit_action =
    PRE player_bet /= 0 & player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & player_points_sum < 22 & dealer_has_start = TRUE
    THEN
    	ANY cc
   	WHERE cc : deck_cards
    	THEN set_cards(deck_cards - {cc}) || player_hit(cc)
    	END
    END;
    
    player_stand_action =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & dealer_has_start = TRUE
    THEN player_stand
    END;

    dealer_init_action =
    PRE card(dealer_cards) = 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = FALSE & dealer_has_stand = FALSE
    THEN    ANY cc
   	WHERE cc : deck_cards
    	THEN set_cards(deck_cards - {cc}) || dealer_init(cc)
    	END 
    END;

    dealer_hit_action =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE & player_has_stand = TRUE & dealer_points_sum < 22
    THEN	ANY cc
   	WHERE cc : deck_cards
    	THEN set_cards(deck_cards - {cc}) || dealer_hit(cc)
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
    PRE player_has_set_bet = TRUE & (player_blackjack = TRUE or dealer_blackjack = TRUE or player_lose = TRUE or dealer_lose = TRUE)
    THEN IF dealer_blackjack = TRUE THEN
            winner := PLAYER
        ELSE IF player_blackjack = TRUE THEN
                winner := DEALER
            ELSE IF player_lose = TRUE THEN
                    winner := DEALER
                ELSE IF dealer_lose = TRUE THEN
                        winner := PLAYER
                    END
                END
            END
        END
    END
END