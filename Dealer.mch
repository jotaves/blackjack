/* Dealer
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Dealer
SEES Cards, Game_ctx
VARIABLES dealer_cards, dealer_points, dealer_points_sum, dealer_can_start, dealer_can_hit
INVARIANT dealer_cards <: CARDS * SUITS & dealer_points : (CARDS * SUITS) <-> NAT & dealer_points_sum : NAT & dealer_can_start : {TRUE, FALSE} & dealer_can_hit : {TRUE, FALSE}
INITIALISATION dealer_cards := {} || dealer_points := {} || dealer_points_sum := 0 || dealer_can_start := TRUE || dealer_can_hit := FALSE
OPERATIONS
    dealer_hit(cc) =
    PRE cc <: CARDS * SUITS & cc \/ dealer_cards <: CARDS * SUITS  & dealer_can_start = FALSE & dealer_can_hit = TRUE & (SIGMA zz . (zz : cc \/ dealer_cards | cards_points(prj1(CARDS, SUITS)(zz))) > 16)
    THEN dealer_cards := dealer_cards \/ cc || dealer_can_hit := FALSE || dealer_points_sum := SIGMA zz . (zz : cc \/ dealer_cards | cards_points(prj1(CARDS, SUITS)(zz)))
    END;

    dealer_init = 
    PRE card(dealer_cards) = 0 & dealer_can_start = TRUE
    THEN ANY cc WHERE cc : CARDS * SUITS THEN dealer_cards := {cc} END || dealer_can_start := FALSE || dealer_can_hit := TRUE
    END
END