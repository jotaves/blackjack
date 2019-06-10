/* Cards
 * Author: João Victor
 * Creation date: 27/05/2019
 */
MACHINE Cards
ABSTRACT_VARIABLES cards_points
SETS CARDS = { ACE , TWO , THREE , FOUR , FIVE , SIX , SEVEN , EIGHT , NINE , TEN , JACK , QUEEN , KING } ; SUITS = { HEART , DIAMOND , CLUB , SPADE }
INVARIANT cards_points : CARDS <-> 1 .. 11
INITIALISATION cards_points := { ACE } * { 1 , 11 } \/ { ( TWO |-> 2 ) , ( THREE |-> 3 ) , ( FOUR |-> 4 ) , ( FIVE |-> 5 ) , ( SIX |-> 6 ) , ( SEVEN |-> 7 ) , ( EIGHT |-> 8 ) , ( NINE |-> 9 ) } \/ { TEN , JACK , QUEEN , KING } * { 10 }
END
