Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Player))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Player))==(Machine(Player));
  Level(Machine(Player))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Player)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Player))==(Cards)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Player))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Player))==(?);
  List_Includes(Machine(Player))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Player))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Player))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Player))==(?);
  Context_List_Variables(Machine(Player))==(?);
  Abstract_List_Variables(Machine(Player))==(?);
  Local_List_Variables(Machine(Player))==(player_points,player_bet,player_cards);
  List_Variables(Machine(Player))==(player_points,player_bet,player_cards);
  External_List_Variables(Machine(Player))==(player_points,player_bet,player_cards)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Player))==(?);
  Abstract_List_VisibleVariables(Machine(Player))==(?);
  External_List_VisibleVariables(Machine(Player))==(?);
  Expanded_List_VisibleVariables(Machine(Player))==(?);
  List_VisibleVariables(Machine(Player))==(?);
  Internal_List_VisibleVariables(Machine(Player))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Player))==(btrue);
  Gluing_List_Invariant(Machine(Player))==(btrue);
  Expanded_List_Invariant(Machine(Player))==(btrue);
  Abstract_List_Invariant(Machine(Player))==(btrue);
  Context_List_Invariant(Machine(Player))==(cards_points: CARDS <-> 1..11);
  List_Invariant(Machine(Player))==(player_cards <: CARDS*SUITS & player_bet: NAT & player_points: NAT)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Player))==(btrue);
  Abstract_List_Assertions(Machine(Player))==(btrue);
  Context_List_Assertions(Machine(Player))==(btrue);
  List_Assertions(Machine(Player))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Player))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Player))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Player))==(player_cards,player_bet,player_points:={},0,0);
  Context_List_Initialisation(Machine(Player))==(skip);
  List_Initialisation(Machine(Player))==(player_cards:={} || player_bet:=0 || player_points:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Player))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Player),Machine(Cards))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Player))==(btrue);
  List_Constraints(Machine(Player))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Player))==(player_hit,player_stand,double_down,split,accept_insurance,reject_insurance,surrender,set_bet);
  List_Operations(Machine(Player))==(player_hit,player_stand,double_down,split,accept_insurance,reject_insurance,surrender,set_bet)
END
&
THEORY ListInputX IS
  List_Input(Machine(Player),player_hit)==(cc);
  List_Input(Machine(Player),player_stand)==(?);
  List_Input(Machine(Player),double_down)==(?);
  List_Input(Machine(Player),split)==(?);
  List_Input(Machine(Player),accept_insurance)==(?);
  List_Input(Machine(Player),reject_insurance)==(?);
  List_Input(Machine(Player),surrender)==(?);
  List_Input(Machine(Player),set_bet)==(bet)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Player),player_hit)==(?);
  List_Output(Machine(Player),player_stand)==(?);
  List_Output(Machine(Player),double_down)==(?);
  List_Output(Machine(Player),split)==(?);
  List_Output(Machine(Player),accept_insurance)==(?);
  List_Output(Machine(Player),reject_insurance)==(?);
  List_Output(Machine(Player),surrender)==(?);
  List_Output(Machine(Player),set_bet)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Player),player_hit)==(player_hit(cc));
  List_Header(Machine(Player),player_stand)==(player_stand);
  List_Header(Machine(Player),double_down)==(double_down);
  List_Header(Machine(Player),split)==(split);
  List_Header(Machine(Player),accept_insurance)==(accept_insurance);
  List_Header(Machine(Player),reject_insurance)==(reject_insurance);
  List_Header(Machine(Player),surrender)==(surrender);
  List_Header(Machine(Player),set_bet)==(set_bet(bet))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Player),player_hit)==(cc: CARDS*SUITS);
  List_Precondition(Machine(Player),player_stand)==(btrue);
  List_Precondition(Machine(Player),double_down)==(btrue);
  List_Precondition(Machine(Player),split)==(btrue);
  List_Precondition(Machine(Player),accept_insurance)==(btrue);
  List_Precondition(Machine(Player),reject_insurance)==(btrue);
  List_Precondition(Machine(Player),surrender)==(btrue);
  List_Precondition(Machine(Player),set_bet)==(bet: NAT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Player),set_bet)==(bet: NAT | player_bet:=bet);
  Expanded_List_Substitution(Machine(Player),surrender)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),reject_insurance)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),accept_insurance)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),split)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),double_down)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),player_stand)==(btrue | player_cards:={});
  Expanded_List_Substitution(Machine(Player),player_hit)==(cc: CARDS*SUITS | prj1(CARDS,SUITS)(cc) = ACE ==> (player_points+11>21 ==> player_points:=player_points+1 [] not(player_points+11>21) ==> player_points:=player_points+11) [] not(prj1(CARDS,SUITS)(cc) = ACE) ==> player_cards,player_points:=player_cards\/{cc},player_points+cards_points(prj1(CARDS,SUITS)(cc)));
  List_Substitution(Machine(Player),player_hit)==(IF prj1(CARDS,SUITS)(cc) = ACE THEN IF player_points+11>21 THEN player_points:=player_points+1 ELSE player_points:=player_points+11 END ELSE player_cards:=player_cards\/{cc} || player_points:=player_points+cards_points(prj1(CARDS,SUITS)(cc)) END);
  List_Substitution(Machine(Player),player_stand)==(player_cards:={});
  List_Substitution(Machine(Player),double_down)==(player_cards:={});
  List_Substitution(Machine(Player),split)==(player_cards:={});
  List_Substitution(Machine(Player),accept_insurance)==(player_cards:={});
  List_Substitution(Machine(Player),reject_insurance)==(player_cards:={});
  List_Substitution(Machine(Player),surrender)==(player_cards:={});
  List_Substitution(Machine(Player),set_bet)==(player_bet:=bet)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Player))==(?);
  Inherited_List_Constants(Machine(Player))==(?);
  List_Constants(Machine(Player))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Player),SUITS)==({HEART,DIAMOND,CLUB,SPADE});
  Context_List_Enumerated(Machine(Player))==(CARDS,SUITS);
  Context_List_Defered(Machine(Player))==(?);
  Context_List_Sets(Machine(Player))==(CARDS,SUITS);
  List_Valuable_Sets(Machine(Player))==(?);
  Inherited_List_Enumerated(Machine(Player))==(?);
  Inherited_List_Defered(Machine(Player))==(?);
  Inherited_List_Sets(Machine(Player))==(?);
  List_Enumerated(Machine(Player))==(?);
  List_Defered(Machine(Player))==(?);
  List_Sets(Machine(Player))==(?);
  Set_Definition(Machine(Player),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Player))==(?);
  Expanded_List_HiddenConstants(Machine(Player))==(?);
  List_HiddenConstants(Machine(Player))==(?);
  External_List_HiddenConstants(Machine(Player))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Player))==(btrue);
  Context_List_Properties(Machine(Player))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}));
  Inherited_List_Properties(Machine(Player))==(btrue);
  List_Properties(Machine(Player))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Player),Machine(Cards))==(?);
  Seen_Context_List_Enumerated(Machine(Player))==(?);
  Seen_Context_List_Invariant(Machine(Player))==(btrue);
  Seen_Context_List_Assertions(Machine(Player))==(btrue);
  Seen_Context_List_Properties(Machine(Player))==(btrue);
  Seen_List_Constraints(Machine(Player))==(btrue);
  Seen_List_Operations(Machine(Player),Machine(Cards))==(?);
  Seen_Expanded_List_Invariant(Machine(Player),Machine(Cards))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Player),player_hit)==(?);
  List_ANY_Var(Machine(Player),player_stand)==(?);
  List_ANY_Var(Machine(Player),double_down)==(?);
  List_ANY_Var(Machine(Player),split)==(?);
  List_ANY_Var(Machine(Player),accept_insurance)==(?);
  List_ANY_Var(Machine(Player),reject_insurance)==(?);
  List_ANY_Var(Machine(Player),surrender)==(?);
  List_ANY_Var(Machine(Player),set_bet)==(?)
END
&
THEORY ListOfIdsX IS
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
  Variables(Machine(Player)) == (Type(player_points) == Mvl(btype(INTEGER,?,?));Type(player_bet) == Mvl(btype(INTEGER,?,?));Type(player_cards) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Player)) == (Type(set_bet) == Cst(No_type,btype(INTEGER,?,?));Type(surrender) == Cst(No_type,No_type);Type(reject_insurance) == Cst(No_type,No_type);Type(accept_insurance) == Cst(No_type,No_type);Type(split) == Cst(No_type,No_type);Type(double_down) == Cst(No_type,No_type);Type(player_stand) == Cst(No_type,No_type);Type(player_hit) == Cst(No_type,etype(CARDS,?,?)*etype(SUITS,?,?)))
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
