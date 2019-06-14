/* Dealer
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Dealer
SEES Cards, Game_ctx
VARIABLES dealer_cards, dealer_points, dealer_points_sum, dealer_has_start, dealer_has_stand
INVARIANT dealer_cards <: CARDS * SUITS & dealer_points : (CARDS * SUITS) <-> NAT & dealer_points_sum : NAT & dealer_has_start : BOOL & dealer_has_stand : BOOL
INITIALISATION dealer_cards := {} || dealer_points := {} || dealer_points_sum := 0 || dealer_has_start := FALSE || dealer_has_stand := FALSE
OPERATIONS
    dealer_hit(cc) = 
    PRE cc : CARDS * SUITS & cc /: dealer_cards & dealer_has_start = TRUE & dealer_has_stand = FALSE
    THEN dealer_cards := dealer_cards \/ {cc} 
	// SE AO ADICIONAR A CARTA NOVA DER MAIS QUE 21
	|| IF dealer_points_sum  + cards_points(prj1(CARDS, SUITS)(cc)) > 21
		// SE TIVER UM ACE NOS PONTOS DO JOGADOR
	THEN 	IF # ss . (ss : SUITS & (ACE |-> ss) |-> 11 : dealer_points)
		// MUDAR PONTUAÇÃO DO ACE PARA 1 E ADICIONAR PONTUAÇÃO DA CARTA
		THEN 	ANY xx
			// ACHA UM ACE QUE POSSUI 11 DE PONTUAÇÃO PARA MUDAR PARA 1
			WHERE xx : dom(dealer_points)  & prj1(CARDS, SUITS)(xx) = ACE & 11 = dealer_points(xx)
				// SE A CARTA A SER INSERIDA FOR UM ACE
			THEN 	IF prj1(CARDS, SUITS)(cc) = ACE
					// SE JUNTANDO COM ESSE NOVO ACE DER ACIMA DE 21
				THEN 	IF dealer_points_sum - 10 + 11 > 21
					// MUDA PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 1
					THEN dealer_points := (dealer_points <+ {(xx |-> 1)}) \/ {(cc |-> 1)} || dealer_points_sum := dealer_points_sum - 10 + 1
					// MUDA A PONTUAÇÃO DE UM ACE EXISTENTE E O NOVO ACE VALERÁ 11, CASO NÃO ULTRAPASSE 21
					ELSE dealer_points := (dealer_points <+ {(xx |-> 1)}) \/ {(cc |-> 11)} || dealer_points_sum := dealer_points_sum - 10 + 11
					END
				// SE A CARTA INSERIDA NÃO FOR UM ACE, MUDA A PONTUAÇÃO DE UM ACE E A ACRESCENTA
				ELSE	dealer_points := dealer_points <+ {(xx |-> 1)} \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || dealer_points_sum := dealer_points_sum - 10 + cards_points(prj1(CARDS, SUITS)(cc))
				END
			END
		// CASO NÃO TENHA ACE NOS PONTOS DO JOGADOR, SE A CARTA A SER INSERIDA FOR UM ACE
		ELSE 	IF prj1(CARDS, SUITS)(cc) = ACE
			THEN 	IF dealer_points_sum + 11 > 21
				THEN dealer_points := dealer_points \/ {(cc |-> 1)} || dealer_points_sum := dealer_points_sum + 1
				ELSE dealer_points := dealer_points \/ {(cc |-> 11)} || dealer_points_sum := dealer_points_sum + 11
				END
			// CASO NÃO SEJA UM ACE
			ELSE	dealer_points := dealer_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || dealer_points_sum := dealer_points_sum + cards_points(prj1(CARDS, SUITS)(cc))
			END
		END
	// SE NÃO FOR DAR MAIS QUE 21 E TIVER UM ACE PARA INSERIR APENAS INSERE
	ELSE dealer_points := dealer_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || dealer_points_sum := dealer_points_sum + cards_points(prj1(CARDS, SUITS)(cc))
	END
    END;

    dealer_stand =
    PRE dealer_has_start = TRUE & dealer_has_stand = FALSE
    THEN dealer_has_stand := TRUE
    END;

    dealer_init(cc) = 
    PRE cc : CARDS * SUITS & card(dealer_cards) = 0
    THEN dealer_cards := {cc} || dealer_points := dealer_points \/ {(cc |-> cards_points(prj1(CARDS, SUITS)(cc)))} || dealer_points_sum := cards_points(prj1(CARDS, SUITS)(cc)) || dealer_has_start := TRUE
    END
END