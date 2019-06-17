/* Game
* Author: João Victor
* Creation date: 29/05/2019
*/
MACHINE Game

SEES Game_ctx

INCLUDES Player, Dealer

VARIABLES deck_cards

INVARIANT deck_cards <: 0..51

INITIALISATION deck_cards := (0..51)

OPERATIONS
    player_init_action =
    PRE card(player_cards) = 0 & player_bet /= 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = TRUE
    THEN ANY xx, yy WHERE xx : deck_cards & yy : deck_cards & xx /= yy THEN
            deck_cards := deck_cards - {xx, yy} || player_init(xx, yy)
        END 
    END;
    
    player_hit_action =
    PRE player_bet /= 0 & player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & player_points_sum < 22 & dealer_has_start = TRUE & player_blackjack = FALSE & player_lose = FALSE & dealer_blackjack = FALSE & dealer_lose = FALSE
    THEN
        ANY cc
        WHERE cc : deck_cards
        THEN deck_cards := deck_cards - {cc} || player_hit(cc)
        END
    END;
    
    player_stand_action =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & dealer_has_start = TRUE & player_blackjack = FALSE & player_lose = FALSE & dealer_blackjack = FALSE & dealer_lose = FALSE
    THEN player_stand
    END;
    
    dealer_init_action =
    PRE card(dealer_cards) = 0 & player_has_start = FALSE & player_has_set_bet = TRUE & dealer_has_start = FALSE & dealer_has_stand = FALSE
    THEN    ANY cc
        WHERE cc : deck_cards
        THEN deck_cards := deck_cards - {cc} || dealer_init(cc)
        END 
    END;
    
    dealer_hit_action =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE & player_has_stand = TRUE & dealer_points_sum < 22 & player_blackjack = FALSE & player_lose = FALSE & dealer_blackjack = FALSE & dealer_lose = FALSE
    THEN	ANY cc
        WHERE cc : deck_cards
        THEN deck_cards := deck_cards - {cc} || dealer_hit(cc)
        END
    END;
    
    dealer_stand_action =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE & player_has_stand = TRUE & player_blackjack = FALSE & player_lose = FALSE & dealer_blackjack = FALSE & dealer_lose = FALSE
    THEN dealer_stand
    END;
    
    player_set_bet_action(bet) =
    PRE bet : NAT1 & player_has_set_bet = FALSE & player_blackjack = FALSE & player_lose = FALSE & dealer_blackjack = FALSE & dealer_lose = FALSE
    THEN set_bet(bet)
    END;
    
    winner <-- finish_game =
    PRE player_has_set_bet = TRUE & (player_blackjack = TRUE or dealer_blackjack = TRUE or player_lose = TRUE or dealer_lose = TRUE or dealer_has_stand = TRUE)
    THEN IF dealer_blackjack = TRUE THEN
            winner := PLAYER
        ELSE IF player_blackjack = TRUE THEN
                winner := DEALER
            ELSE IF player_lose = TRUE THEN
                    winner := DEALER
                ELSE IF dealer_lose = TRUE THEN
                        winner := PLAYER
                    ELSE IF player_points_sum > dealer_points_sum THEN
                            winner := PLAYER
                        ELSE winner := DEALER
                        END
                    END
                END
            END
        END
    END
END