/* Cards
 * Author: João Victor
 * Creation date: 27/05/2019
 */
MACHINE Cards
VARIABLES cards_points
INVARIANT cards_points : 0..51 --> 2..11
INITIALISATION cards_points := (0..3) * {11} \/ (4..7) * {2} \/ (8..11) * {3} \/ (12..15) * {4} \/ (16..19) * {5} \/ (20..23) * {6} \/ (24..27) * {7} \/ (28..31) * {8} \/ (32..35) * {9} \/ (36..39) * {10} \/ (40..43) * {10} \/ (44..47) * {10} \/ (48..51) * {10}
END