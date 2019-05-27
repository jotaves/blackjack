/* Deck
 * Author: João Victor
 * Creation date: 27/05/2019
 */
MACHINE Deck
SEES Cards
VARIABLES deck
INVARIANT deck <: CARDS * SUITS
INITIALISATION deck := CARDS * SUITS
END