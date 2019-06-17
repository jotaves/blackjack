/* Player
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Player
SEES Cards
VARIABLES player_cards, player_bet, player_points, player_points_sum, player_has_stand, player_has_start, player_has_set_bet, player_blackjack, player_lose
INVARIANT player_cards <: 0..51 & player_bet : NAT & player_points : 0..51 <-> 0..11 & player_points_sum : NAT & player_points_sum = SIGMA zz . (zz : player_points | prj2(0..51, NAT)(zz)) & player_has_stand : {TRUE, FALSE} & player_has_start : {TRUE, FALSE} & player_has_set_bet : {TRUE, FALSE} & player_blackjack : BOOL & player_lose : BOOL
INITIALISATION player_cards := {} || player_bet := 0 || player_points := (0..51)*{0} || player_points_sum := 0 || player_has_stand := FALSE || player_has_start := FALSE || player_has_set_bet := FALSE || player_blackjack := FALSE || player_lose := FALSE
OPERATIONS
    player_hit(cc) = 
    PRE cc : 0..51 & cc /: player_cards & player_bet /= 0 & cc /: player_cards & player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE & player_blackjack = FALSE & player_lose = FALSE
    THEN player_cards := player_cards \/ {cc} 
	// SE AO ADICIONAR A CARTA NOVA DER MAIS QUE 21
	|| IF player_points_sum  + cards_points(cc mod 13) > 21
		// SE TIVER UM ACE NOS PONTOS DO JOGADOR
	THEN 	IF # ss . (ss : 0..51 & (ss) |-> 11 : player_points)
		// MUDAR PONTUAÇÃO DO ACE PARA 1 E ADICIONAR PONTUAÇÃO DA CARTA
		THEN 	ANY xx
			// ACHA UM ACE QUE POSSUI 11 DE PONTUAÇÃO PARA MUDAR PARA 1
			WHERE xx : player_cards & player_points(xx) = 11
				// SE A CARTA A SER INSERIDA FOR UM ACE
			THEN 	IF cc = 0 or cc = 13 or cc = 26 or cc = 39
					// SE JUNTANDO COM ESSE NOVO ACE DER ACIMA DE 21
				THEN
					// MUDA PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 1
					player_points := (player_points <+ {(xx |-> 1)}) \/ {(cc |-> 11)} || player_points_sum := player_points_sum - 10 + 11 || IF 21 = player_points_sum - 10 + 11 THEN player_blackjack := TRUE END
				// SE A CARTA INSERIDA NÃO FOR UM ACE, MUDA A PONTUAÇÃO DE UM ACE E A ACRESCENTA
				ELSE	player_points := player_points <+ {(xx |-> 1)} \/ {(cc |-> cards_points(cc mod 13))} || player_points_sum := player_points_sum - 10 + cards_points(cc mod 13)
				END
			END
		// CASO NÃO TENHA ACE NOS PONTOS DO JOGADOR, SE A CARTA A SER INSERIDA FOR UM ACE
		ELSE 	IF cc = 0 or cc = 13 or cc = 26 or cc = 39
			THEN 	IF player_points_sum + 11 > 21
				THEN player_points := player_points \/ {(cc |-> 1)} || player_points_sum := player_points_sum + 1 || IF 21 = player_points_sum + 1 THEN player_blackjack := TRUE END
				ELSE player_points := player_points \/ {(cc |-> 11)} || player_points_sum := player_points_sum + 11 || IF 21 = player_points_sum + 11 THEN player_blackjack := TRUE END
				END
			// CASO NÃO SEJA UM ACE
			ELSE	player_points := player_points \/ {(cc |-> cards_points(cc mod 13))} || player_points_sum := player_points_sum + cards_points(cc mod 13) || IF 21 < player_points_sum + cards_points(cc mod 13) THEN player_lose := TRUE END
			END
		END
	// SE NÃO FOR DAR MAIS QUE 21, APENAS INSERE
	ELSE player_points := player_points \/ {(cc |-> cards_points(cc mod 13))} || player_points_sum := player_points_sum + cards_points(cc mod 13) || IF 21 = player_points_sum + cards_points(cc mod 13) THEN player_blackjack := TRUE END
	END
    END;
    
    player_stand =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN player_has_stand := TRUE
    END;
    
    double_down =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN skip
    END;
    
    split =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN skip
    END; 
    
    accept_insurance =
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN skip
    END;
    
    reject_insurance = 
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN skip
    END;
    
    surrender = 
    PRE player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN skip
    END;
    
    set_bet(bet) =
    PRE bet : NAT & player_has_set_bet = FALSE
    THEN player_bet := bet || player_has_set_bet := TRUE
    END;

    player_init(cc) = 
    PRE cc <: 0..51 & card(player_cards) = 0 & card(cc) = 2 & player_bet /= 0 & player_has_start = FALSE & player_has_set_bet = TRUE
    THEN 	player_cards := cc 
	|| ANY xx WHERE xx : cc 
	THEN 	ANY yy  WHERE yy: cc & yy /= xx
 		THEN 	IF (xx = 0 or xx = 13 or xx = 26 or xx = 39) & (yy = 0 or yy = 13 or yy = 26 or yy = 39)
			THEN player_points := {(xx |-> 11)} \/ {(yy |-> 1)} || player_points_sum := player_points_sum + 11 + 1
			ELSE 	IF (xx = 0 or xx = 13 or xx = 26 or xx = 39) & (yy /= 0 & yy /= 13 & yy /= 26 & yy /= 39)
				THEN player_points := {(xx |-> 11)} \/ {(yy |-> cards_points(yy mod 13))} || player_points_sum := player_points_sum + 11 + cards_points(yy mod 13)
				ELSE 	IF (xx /= 0 & xx /= 13 & xx /= 26 & xx /= 39) & (yy = 0 or yy = 13 or yy = 26 or yy = 39)
					THEN player_points := {(xx |-> cards_points(xx mod 13))} \/ {(yy |-> 11)} || player_points_sum := player_points_sum + cards_points(xx mod 13) + 11
					ELSE player_points :=  {(xx |-> cards_points(xx mod 13))} \/ {(yy |-> cards_points(yy mod 13))} || player_points_sum := player_points_sum + cards_points(xx mod 13) + cards_points(yy mod 13)
					END
				END
			END
		END
	END || player_has_start := TRUE
    END
END