/* Player
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Player
SEES Cards
VARIABLES player_cards, player_bet, player_points, total_points
INVARIANT player_cards <: CARDS * SUITS & player_bet : NAT & player_points : (CARDS * SUITS) <-> NAT & total_points : NAT
INITIALISATION player_cards := {} || player_bet := 0 || player_points := {} || total_points := 0
OPERATIONS
    player_hit(cc) = 
    PRE cc : CARDS * SUITS & player_bet /= 0 & cc /: player_cards
    THEN player_cards := player_cards \/ {cc} 
	// SE AO ADICIONAR A CARTA NOVA DER MAIS QUE 21
	|| IF total_points  + cards_points(prj1(CARDS, SUITS)(cc)) > 21
		// SE TIVER UM ACE NOS PONTOS DO JOGADOR
	THEN 	IF # ss . (ss : SUITS & (ACE |-> ss) |-> 11 : player_points)
		// MUDAR PONTUAÇÃO DO ACE PARA 1 E ADICIONAR PONTUAÇÃO DA CARTA
		THEN 	ANY xx
			// ACHA UM ACE QUE POSSUI 11 DE PONTUAÇÃO PARA MUDAR PARA 1
			WHERE xx : dom(player_points)  & prj1(CARDS, SUITS)(xx) = ACE & 11 = player_points(xx)
				// SE A CARTA A SER INSERIDA FOR UM ACE
			THEN 	IF prj1(CARDS, SUITS)(cc) = ACE
					// SE JUNTANDO COM ESSE NOVO ACE DER ACIMA DE 21
				THEN 	IF total_points - 10 + 11 > 21
					// MUDA PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 1
					THEN player_points := (player_points <+ {(xx |-> 1)}) \/ {(cc |-> 1)} || total_points := total_points - 10 + 1
					// MUDA A PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 11, CASO NÃO ULTRAPASSE 21
					ELSE player_points := (player_points <+ {(xx |-> 1)}) \/ {(cc |-> 11)} || total_points := total_points - 10 + 11
					END
				// SE A CARTA INSERIDA NÃO FOR UM ACE, MUDA A PONTUAÇÃO DE UM ACE E A ACRESCENTA
				ELSE	player_points := player_points <+ {(xx |-> 1)} \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || total_points := total_points - 10 + cards_points(prj1(CARDS, SUITS)(cc))
				END
			END
		// CASO NÃO TENHA ACE NOS PONTOS DO JOGADOR, SE A CARTA A SER INSERIDA FOR UM ACE
		ELSE 	IF prj1(CARDS, SUITS)(cc) = ACE
			THEN 	IF total_points + 11 > 21
				THEN player_points := player_points \/ {(cc |-> 1)} || total_points := total_points + 1
				ELSE player_points := player_points \/ {(cc |-> 11)} || total_points := total_points + 11
				END
			// CASO NÃO SEJA UM ACE
			ELSE	player_points := player_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || total_points := total_points + cards_points(prj1(CARDS, SUITS)(cc))
			END
		END
	// SE NÃO FOR DAR MAIS QUE 21 E TIVER UM ACE PARA INSERIR APENAS INSERE
	ELSE player_points := player_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || total_points := total_points + cards_points(prj1(CARDS, SUITS)(cc))
	END 
    END;
    
    player_stand =
    PRE player_bet /= 0
    THEN skip
    END;
    
    double_down =
    PRE player_bet /= 0
    THEN skip
    END;
    
    split =
    PRE player_bet /= 0
    THEN skip
    END; 
    
    accept_insurance =
    PRE player_bet /= 0
    THEN skip
    END;
    
    reject_insurance = 
    PRE player_bet /= 0
    THEN skip
    END;
    
    surrender = 
    PRE player_bet /= 0
    THEN skip
    END;
    
    set_bet(bet) =
    PRE bet : NAT
    THEN player_bet := bet
    END
END