Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Dealer))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Dealer))==(Machine(Dealer));
  Level(Machine(Dealer))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Dealer)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Dealer))==(Cards,Player)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Dealer))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Dealer))==(?);
  List_Includes(Machine(Dealer))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Dealer))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Dealer))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Dealer))==(?);
  Context_List_Variables(Machine(Dealer))==(?);
  Abstract_List_Variables(Machine(Dealer))==(?);
  Local_List_Variables(Machine(Dealer))==(dealer_points,dealer_cards);
  List_Variables(Machine(Dealer))==(dealer_points,dealer_cards);
  External_List_Variables(Machine(Dealer))==(dealer_points,dealer_cards)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Dealer))==(?);
  Abstract_List_VisibleVariables(Machine(Dealer))==(?);
  External_List_VisibleVariables(Machine(Dealer))==(?);
  Expanded_List_VisibleVariables(Machine(Dealer))==(?);
  List_VisibleVariables(Machine(Dealer))==(?);
  Internal_List_VisibleVariables(Machine(Dealer))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Dealer))==(btrue);
  Gluing_List_Invariant(Machine(Dealer))==(btrue);
  Expanded_List_Invariant(Machine(Dealer))==(btrue);
  Abstract_List_Invariant(Machine(Dealer))==(btrue);
  Context_List_Invariant(Machine(Dealer))==(cards_points: CARDS <-> 1..11 & player_cards <: CARDS*SUITS & player_bet: NAT & player_points: NAT);
  List_Invariant(Machine(Dealer))==(dealer_cards <: CARDS*SUITS & dealer_points: NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Dealer))==(btrue);
  Abstract_List_Assertions(Machine(Dealer))==(btrue);
  Context_List_Assertions(Machine(Dealer))==(btrue);
  List_Assertions(Machine(Dealer))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Dealer))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Dealer))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Dealer))==(dealer_cards,dealer_points:={},0);
  Context_List_Initialisation(Machine(Dealer))==(skip);
  List_Initialisation(Machine(Dealer))==(dealer_cards:={} || dealer_points:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Dealer))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Dealer),Machine(Cards))==(?);
  List_Instanciated_Parameters(Machine(Dealer),Machine(Player))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Dealer))==(btrue);
  List_Constraints(Machine(Dealer))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Dealer))==(dealer_hit);
  List_Operations(Machine(Dealer))==(dealer_hit)
END
&
THEORY ListInputX IS
  List_Input(Machine(Dealer),dealer_hit)==(cc)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Dealer),dealer_hit)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Dealer),dealer_hit)==(dealer_hit(cc))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Dealer),dealer_hit)==(cc: CARDS*SUITS & dealer_points<=18 & dealer_points>=0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Dealer),dealer_hit)==(cc: CARDS*SUITS & dealer_points<=18 & dealer_points>=0 | dealer_cards:=dealer_cards\/{cc});
  List_Substitution(Machine(Dealer),dealer_hit)==(dealer_cards:=dealer_cards\/{cc})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Dealer))==(?);
  Inherited_List_Constants(Machine(Dealer))==(?);
  List_Constants(Machine(Dealer))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Dealer),SUITS)==({HEART,DIAMOND,CLUB,SPADE});
  Context_List_Enumerated(Machine(Dealer))==(CARDS,SUITS);
  Context_List_Defered(Machine(Dealer))==(?);
  Context_List_Sets(Machine(Dealer))==(CARDS,SUITS);
  List_Valuable_Sets(Machine(Dealer))==(?);
  Inherited_List_Enumerated(Machine(Dealer))==(?);
  Inherited_List_Defered(Machine(Dealer))==(?);
  Inherited_List_Sets(Machine(Dealer))==(?);
  List_Enumerated(Machine(Dealer))==(?);
  List_Defered(Machine(Dealer))==(?);
  List_Sets(Machine(Dealer))==(?);
  Set_Definition(Machine(Dealer),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Dealer))==(?);
  Expanded_List_HiddenConstants(Machine(Dealer))==(?);
  List_HiddenConstants(Machine(Dealer))==(?);
  External_List_HiddenConstants(Machine(Dealer))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Dealer))==(btrue);
  Context_List_Properties(Machine(Dealer))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}));
  Inherited_List_Properties(Machine(Dealer))==(btrue);
  List_Properties(Machine(Dealer))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Dealer),Machine(Player))==(player_hit,player_stand,double_down,split,accept_insurance,reject_insurance,surrender,set_bet);
  Seen_Context_List_Enumerated(Machine(Dealer))==(CARDS,SUITS);
  Seen_Context_List_Invariant(Machine(Dealer))==(cards_points: CARDS <-> 1..11);
  Seen_Context_List_Assertions(Machine(Dealer))==(btrue);
  Seen_Context_List_Properties(Machine(Dealer))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}));
  Seen_List_Constraints(Machine(Dealer))==(btrue);
  Seen_List_Precondition(Machine(Dealer),set_bet)==(bet: NAT);
  Seen_Expanded_List_Substitution(Machine(Dealer),set_bet)==(player_bet:=bet);
  Seen_List_Precondition(Machine(Dealer),surrender)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),surrender)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),reject_insurance)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),reject_insurance)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),accept_insurance)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),accept_insurance)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),split)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),split)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),double_down)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),double_down)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),player_stand)==(btrue);
  Seen_Expanded_List_Substitution(Machine(Dealer),player_stand)==(player_cards:={});
  Seen_List_Precondition(Machine(Dealer),player_hit)==(cc: CARDS*SUITS);
  Seen_Expanded_List_Substitution(Machine(Dealer),player_hit)==(prj1(CARDS,SUITS)(cc) = ACE ==> player_points:=player_points+1 [] not(prj1(CARDS,SUITS)(cc) = ACE) ==> player_cards,player_points:=player_cards\/{cc},player_points+cards_points(prj1(CARDS,SUITS)(cc)));
  Seen_List_Operations(Machine(Dealer),Machine(Player))==(player_hit,player_stand,double_down,split,accept_insurance,reject_insurance,surrender,set_bet);
  Seen_Expanded_List_Invariant(Machine(Dealer),Machine(Player))==(btrue);
  Set_Definition(Machine(Dealer),SUITS)==({HEART,DIAMOND,CLUB,SPADE});
  Set_Definition(Machine(Dealer),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING});
  Seen_Internal_List_Operations(Machine(Dealer),Machine(Cards))==(?);
  Seen_List_Operations(Machine(Dealer),Machine(Cards))==(?);
  Seen_Expanded_List_Invariant(Machine(Dealer),Machine(Cards))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Dealer),dealer_hit)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Dealer)) == (? | ? | dealer_points,dealer_cards | ? | dealer_hit | ? | seen(Machine(Cards)),seen(Machine(Player)) | ? | Dealer);
  List_Of_HiddenCst_Ids(Machine(Dealer)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Dealer)) == (?);
  List_Of_VisibleVar_Ids(Machine(Dealer)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Dealer)) == (?: ?);
  List_Of_Ids(Machine(Player)) == (? | ? | player_points,player_bet,player_cards | ? | player_hit,player_stand,double_down,split,accept_insurance,reject_insurance,surrender,set_bet | ? | seen(Machine(Cards)) | ? | Player);
  List_Of_HiddenCst_Ids(Machine(Player)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Player)) == (?);
  List_Of_VisibleVar_Ids(Machine(Player)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Player)) == (?: ?);
  List_Of_Ids(Machine(Cards)) == (CARDS,SUITS,ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,HEART,DIAMOND,CLUB,SPADE | ? | cards_points | ? | ? | ? | ? | ? | Cards);
  List_Of_HiddenCst_Ids(Machine(Cards)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Cards)) == (?);
  List_Of_VisibleVar_Ids(Machine(Cards)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Cards)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Dealer)) == (Type(dealer_points) == Mvl(btype(INTEGER,?,?));Type(dealer_cards) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Dealer)) == (Type(dealer_hit) == Cst(No_type,etype(CARDS,?,?)*etype(SUITS,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
