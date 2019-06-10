Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Game))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Game))==(Machine(Game));
  Level(Machine(Game))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Game)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Game))==(Cards,Game_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Game))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Game))==(Dealer,Player);
  List_Includes(Machine(Game))==(Player,Dealer)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Game))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Game))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Game))==(?);
  Context_List_Variables(Machine(Game))==(?);
  Abstract_List_Variables(Machine(Game))==(?);
  Local_List_Variables(Machine(Game))==(current_player,game_cards);
  List_Variables(Machine(Game))==(current_player,game_cards,player_points,player_bet,player_cards,dealer_points,dealer_cards);
  External_List_Variables(Machine(Game))==(current_player,game_cards,player_points,player_bet,player_cards,dealer_points,dealer_cards)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Game))==(?);
  Abstract_List_VisibleVariables(Machine(Game))==(?);
  External_List_VisibleVariables(Machine(Game))==(?);
  Expanded_List_VisibleVariables(Machine(Game))==(?);
  List_VisibleVariables(Machine(Game))==(?);
  Internal_List_VisibleVariables(Machine(Game))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Game))==(btrue);
  Gluing_List_Invariant(Machine(Game))==(btrue);
  Abstract_List_Invariant(Machine(Game))==(btrue);
  Expanded_List_Invariant(Machine(Game))==(player_cards <: CARDS*SUITS & player_bet: NAT & player_points: NAT & dealer_cards <: CARDS*SUITS & dealer_points: NAT);
  Context_List_Invariant(Machine(Game))==(cards_points: CARDS <-> 1..11);
  List_Invariant(Machine(Game))==(game_cards <: CARDS*SUITS & current_player: PLAYER_TYPE)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Game))==(btrue);
  Expanded_List_Assertions(Machine(Game))==(btrue);
  Context_List_Assertions(Machine(Game))==(btrue);
  List_Assertions(Machine(Game))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Game))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Game))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Game))==(player_cards,player_bet,player_points:={},0,0;dealer_cards,dealer_points:={},0;game_cards,current_player:=CARDS*SUITS,PLAYER);
  Context_List_Initialisation(Machine(Game))==(skip);
  List_Initialisation(Machine(Game))==(game_cards:=CARDS*SUITS || current_player:=PLAYER)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Game))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Game),Machine(Player))==(?);
  List_Instanciated_Parameters(Machine(Game),Machine(Dealer))==(?);
  List_Instanciated_Parameters(Machine(Game),Machine(Cards))==(?);
  List_Instanciated_Parameters(Machine(Game),Machine(Game_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Game),Machine(Dealer))==(btrue);
  List_Context_Constraints(Machine(Game))==(btrue);
  List_Constraints(Machine(Game))==(btrue);
  List_Constraints(Machine(Game),Machine(Player))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Game))==(hit_action,stand_action);
  List_Operations(Machine(Game))==(hit_action,stand_action)
END
&
THEORY ListInputX IS
  List_Input(Machine(Game),hit_action)==(?);
  List_Input(Machine(Game),stand_action)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Game),hit_action)==(?);
  List_Output(Machine(Game),stand_action)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Game),hit_action)==(hit_action);
  List_Header(Machine(Game),stand_action)==(stand_action)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Game),hit_action)==(btrue);
  List_Precondition(Machine(Game),stand_action)==(player_points<=21 & player_points>=0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Game),stand_action)==(player_points<=21 & player_points>=0 | current_player:=DEALER || @cc.(cc: CARDS*SUITS ==> (cc: CARDS*SUITS & dealer_points<=18 & dealer_points>=0 | game_cards:=game_cards-{cc} || dealer_cards:=dealer_cards\/{cc})));
  Expanded_List_Substitution(Machine(Game),hit_action)==(btrue | @cc.(cc: CARDS*SUITS ==> (cc: CARDS*SUITS | game_cards:=game_cards-{cc} || (prj1(CARDS,SUITS)(cc) = ACE ==> player_points:=player_points+1 [] not(prj1(CARDS,SUITS)(cc) = ACE) ==> player_cards,player_points:=player_cards\/{cc},player_points+cards_points(prj1(CARDS,SUITS)(cc))))));
  List_Substitution(Machine(Game),hit_action)==(ANY cc WHERE cc: CARDS*SUITS THEN game_cards:=game_cards-{cc} || player_hit(cc) END);
  List_Substitution(Machine(Game),stand_action)==(current_player:=DEALER || ANY cc WHERE cc: CARDS*SUITS THEN game_cards:=game_cards-{cc} || dealer_hit(cc) END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Game))==(?);
  Inherited_List_Constants(Machine(Game))==(?);
  List_Constants(Machine(Game))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Game),PLAYER_TYPE)==({PLAYER,DEALER});
  Context_List_Enumerated(Machine(Game))==(CARDS,SUITS,PLAYER_TYPE);
  Context_List_Defered(Machine(Game))==(?);
  Context_List_Sets(Machine(Game))==(CARDS,SUITS,PLAYER_TYPE);
  List_Valuable_Sets(Machine(Game))==(?);
  Inherited_List_Enumerated(Machine(Game))==(?);
  Inherited_List_Defered(Machine(Game))==(?);
  Inherited_List_Sets(Machine(Game))==(?);
  List_Enumerated(Machine(Game))==(?);
  List_Defered(Machine(Game))==(?);
  List_Sets(Machine(Game))==(?);
  Set_Definition(Machine(Game),SUITS)==({HEART,DIAMOND,CLUB,SPADE});
  Set_Definition(Machine(Game),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Game))==(?);
  Expanded_List_HiddenConstants(Machine(Game))==(?);
  List_HiddenConstants(Machine(Game))==(?);
  External_List_HiddenConstants(Machine(Game))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Game))==(btrue);
  Context_List_Properties(Machine(Game))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}) & PLAYER_TYPE: FIN(INTEGER) & not(PLAYER_TYPE = {}));
  Inherited_List_Properties(Machine(Game))==(btrue);
  List_Properties(Machine(Game))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Game),Machine(Game_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Game))==(?);
  Seen_Context_List_Invariant(Machine(Game))==(btrue);
  Seen_Context_List_Assertions(Machine(Game))==(btrue);
  Seen_Context_List_Properties(Machine(Game))==(btrue);
  Seen_List_Constraints(Machine(Game))==(btrue);
  Seen_List_Operations(Machine(Game),Machine(Game_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Game),Machine(Game_ctx))==(btrue);
  Seen_Internal_List_Operations(Machine(Game),Machine(Cards))==(?);
  Seen_List_Operations(Machine(Game),Machine(Cards))==(?);
  Seen_Expanded_List_Invariant(Machine(Game),Machine(Cards))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Game),hit_action)==(Var(cc) == etype(CARDS,?,?)*etype(SUITS,?,?));
  List_ANY_Var(Machine(Game),stand_action)==(Var(cc) == etype(CARDS,?,?)*etype(SUITS,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Game)) == (? | ? | current_player,game_cards | dealer_points,dealer_cards,player_points,player_bet,player_cards | hit_action,stand_action | ? | seen(Machine(Cards)),seen(Machine(Game_ctx)),included(Machine(Player)),included(Machine(Dealer)) | ? | Game);
  List_Of_HiddenCst_Ids(Machine(Game)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Game)) == (?);
  List_Of_VisibleVar_Ids(Machine(Game)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Game)) == (seen(Machine(Cards)): (CARDS,SUITS,ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,HEART,DIAMOND,CLUB,SPADE | ? | cards_points | ? | ? | ? | ? | ? | ?) | seen(Machine(Player)): (? | ? | player_points,player_bet,player_cards | ? | ? | ? | ? | ? | ?));
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
  List_Of_Ids_SeenBNU(Machine(Cards)) == (?: ?);
  List_Of_Ids(Machine(Game_ctx)) == (PLAYER_TYPE,PLAYER,DEALER | ? | ? | ? | ? | ? | ? | ? | Game_ctx);
  List_Of_HiddenCst_Ids(Machine(Game_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Game_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Game_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Game_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Game)) == (Type(player_cards) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?)));Type(player_bet) == Mvl(btype(INTEGER,?,?));Type(player_points) == Mvl(btype(INTEGER,?,?));Type(dealer_cards) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?)));Type(dealer_points) == Mvl(btype(INTEGER,?,?));Type(current_player) == Mvl(etype(PLAYER_TYPE,?,?));Type(game_cards) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Game)) == (Type(stand_action) == Cst(No_type,No_type);Type(hit_action) == Cst(No_type,No_type))
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
