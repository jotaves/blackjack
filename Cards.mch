/* Cards
 * Author: João Victor
 * Creation date: 27/05/2019
 */
MACHINE Cards
ABSTRACT_CONSTANTS cards_points
PROPERTIES cards_points : 0..12 --> 2..11 & dom(cards_points) = 0..12 & ran(cards_points) = 2..11
END