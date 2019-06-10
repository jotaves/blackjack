/* Player
 * Author: João Victor
 * Creation date: 29/05/2019
 */
MACHINE
    Player
SEES Cards
ABSTRACT_VARIABLES player_cards , player_bet , player_points
INVARIANT player_cards <: CARDS * SUITS & player_bet : NAT & player_points : NAT
INITIALISATION player_cards := {} || player_bet := 0 || player_points := 0
OPERATIONS
    player_hit ( cc ) =
    PRE cc : CARDS * SUITS
    THEN
        IF prj1 ( CARDS , SUITS ) ( cc ) = ACE
        THEN IF player_points + 11 > 21
             THEN player_points := player_points + 1
             ELSE player_points := player_points + 11
             END
        ELSE player_cards := player_cards \/ { cc } || player_points := player_points + cards_points ( prj1 ( CARDS , SUITS ) ( cc ) )
        END
    END ;

    player_stand =
    BEGIN player_cards := {}
    END ;

    double_down =
    BEGIN player_cards := {}
    END ;

    split =
    BEGIN player_cards := {}
    END ;

    accept_insurance =
    BEGIN player_cards := {}
    END ;

    reject_insurance =
    BEGIN player_cards := {}
    END ;

    surrender =
    BEGIN player_cards := {}
    END ;

    set_bet ( bet ) =
    PRE bet : NAT
    THEN player_bet := bet
    END
END
