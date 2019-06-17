/* Cards
 * Author: João Victor
 * Creation date: 27/05/2019
 */
MACHINE Cards
ABSTRACT_CONSTANTS cards_points
PROPERTIES cards_points : 0..12 --> 2..11 & dom(cards_points) = 0..12 & ran(cards_points) = 2..11
VARIABLES deck_cards, deck_suits
INVARIANT deck_cards <: 0..51
& deck_suits : 0..51 <-> 0..3 & dom(deck_suits) = 0..51 & ran(deck_suits) = 0..3
INITIALISATION deck_cards := (0..51) || deck_suits := (0..51) * (0..3)
OPERATIONS
    set_cards(cc) =
    PRE cc <: 0..51
    THEN deck_cards := cc
    END
END