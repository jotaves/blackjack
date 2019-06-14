/* Player
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Player
SEES Cards
VARIABLES player_cards, player_bet, player_points, player_points_sum, player_has_stand, player_has_start, player_has_set_bet
INVARIANT player_cards <: CARDS * SUITS & player_bet : NAT & player_points : (CARDS * SUITS) <-> NAT & player_points_sum : NAT & player_points_sum = SIGMA zz . (zz : player_points | prj2((CARDS * SUITS), NAT)(zz)) & player_has_stand : {TRUE, FALSE} & player_has_start : {TRUE, FALSE} & player_has_set_bet : {TRUE, FALSE}
INITIALISATION player_cards := {} || player_bet := 0 || player_points := {} || player_points_sum := 0 || player_has_stand := FALSE || player_has_start := FALSE || player_has_set_bet := FALSE
OPERATIONS
    player_hit(cc) = 
    PRE cc : CARDS * SUITS & player_bet /= 0 & cc /: player_cards & player_has_stand = FALSE & player_has_start = TRUE & player_has_set_bet = TRUE
    THEN player_cards := player_cards \/ {cc} 
	// SE AO ADICIONAR A CARTA NOVA DER MAIS QUE 21
	|| IF player_points_sum  + cards_points(prj1(CARDS, SUITS)(cc)) > 21
		// SE TIVER UM ACE NOS PONTOS DO JOGADOR
	THEN 	IF # ss . (ss : SUITS & (ACE |-> ss) |-> 11 : player_points)
		// MUDAR PONTUAÇÃO DO ACE PARA 1 E ADICIONAR PONTUAÇÃO DA CARTA
		THEN 	ANY xx
			// ACHA UM ACE QUE POSSUI 11 DE PONTUAÇÃO PARA MUDAR PARA 1
			WHERE xx : dom(player_points)  & prj1(CARDS, SUITS)(xx) = ACE & 11 = player_points(xx)
				// SE A CARTA A SER INSERIDA FOR UM ACE
			THEN 	IF prj1(CARDS, SUITS)(cc) = ACE
					// SE JUNTANDO COM ESSE NOVO ACE DER ACIMA DE 21
				THEN 	IF player_points_sum - 10 + 11 > 21
					// MUDA PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 1
					THEN player_points := (player_points <+ {(xx |-> 1)}) \/ {(cc |-> 1)} || player_points_sum := player_points_sum - 10 + 1
					// MUDA A PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 11, CASO NÃO ULTRAPASSE 21
					ELSE player_points := (player_points <+ {(xx |-> 1)}) \/ {(cc |-> 11)} || player_points_sum := player_points_sum - 10 + 11
					END
				// SE A CARTA INSERIDA NÃO FOR UM ACE, MUDA A PONTUAÇÃO DE UM ACE E A ACRESCENTA
				ELSE	player_points := player_points <+ {(xx |-> 1)} \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || player_points_sum := player_points_sum - 10 + cards_points(prj1(CARDS, SUITS)(cc))
				END
			END
		// CASO NÃO TENHA ACE NOS PONTOS DO JOGADOR, SE A CARTA A SER INSERIDA FOR UM ACE
		ELSE 	IF prj1(CARDS, SUITS)(cc) = ACE
			THEN 	IF player_points_sum + 11 > 21
				THEN player_points := player_points \/ {(cc |-> 1)} || player_points_sum := player_points_sum + 1
				ELSE player_points := player_points \/ {(cc |-> 11)} || player_points_sum := player_points_sum + 11
				END
			// CASO NÃO SEJA UM ACE
			ELSE	player_points := player_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || player_points_sum := player_points_sum + cards_points(prj1(CARDS, SUITS)(cc))
			END
		END
	// SE NÃO FOR DAR MAIS QUE 21 E TIVER UM ACE PARA INSERIR APENAS INSERE
	ELSE player_points := player_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || player_points_sum := player_points_sum + cards_points(prj1(CARDS, SUITS)(cc))
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
    PRE cc <: CARDS * SUITS & card(player_cards) = 0 & card(cc) = 2 & player_bet /= 0 & player_has_start = FALSE & player_has_set_bet = TRUE
    THEN 	player_cards := cc 
	|| ANY xx WHERE xx : cc 
	THEN 	ANY yy  WHERE yy: cc & yy /= xx
 		THEN 	IF prj1(CARDS, SUITS)(xx) = ACE & prj1(CARDS, SUITS)(yy) = ACE
			THEN player_points := {(xx |-> 11)} \/ {(yy |-> 1)} || player_points_sum := player_points_sum + 11 + 1
			ELSE 	IF prj1(CARDS, SUITS)(xx) = ACE & prj1(CARDS, SUITS)(yy) /= ACE
				THEN player_points := {(xx |-> 11)} \/ {(yy |-> cards_points(prj1(CARDS, SUITS)(yy)))} || player_points_sum := player_points_sum + 11 + cards_points(prj1(CARDS, SUITS)(yy))
				ELSE 	IF prj1(CARDS, SUITS)(xx) /= ACE & prj1(CARDS, SUITS)(yy) = ACE
					THEN player_points := {(xx |-> cards_points(prj1(CARDS, SUITS)(xx)))} \/ {(yy |-> 11)} || player_points_sum := player_points_sum + cards_points(prj1(CARDS, SUITS)(xx)) + 11
					ELSE player_points :=  {(xx |-> cards_points(prj1(CARDS, SUITS)(xx)))} \/ {(yy |-> cards_points(prj1(CARDS, SUITS)(yy)))} || player_points_sum := player_points_sum + cards_points(prj1(CARDS, SUITS)(xx)) + cards_points(prj1(CARDS, SUITS)(yy))
					END
				END
			END
		END
	END || player_has_start := TRUE
    END
END