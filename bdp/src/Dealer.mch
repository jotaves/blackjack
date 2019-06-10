/* Dealer
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Dealer
SEES Cards , Player
ABSTRACT_VARIABLES dealer_cards , dealer_points
INVARIANT dealer_cards <: CARDS * SUITS & dealer_points : NAT
INITIALISATION dealer_cards := {} || dealer_points := 0
OPERATIONS
    dealer_hit ( cc ) =
    PRE cc : CARDS * SUITS & dealer_points <= 18 & dealer_points >= 0
    THEN
        dealer_cards := dealer_cards \/ { cc }
    END
END
