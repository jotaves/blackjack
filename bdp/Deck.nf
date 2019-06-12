Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Deck))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Deck))==(Machine(Deck));
  Level(Machine(Deck))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Deck)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Deck))==(Cards)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Deck))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Deck))==(?);
  List_Includes(Machine(Deck))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Deck))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Deck))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Deck))==(?);
  Context_List_Variables(Machine(Deck))==(?);
  Abstract_List_Variables(Machine(Deck))==(?);
  Local_List_Variables(Machine(Deck))==(deck);
  List_Variables(Machine(Deck))==(deck);
  External_List_Variables(Machine(Deck))==(deck)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Deck))==(?);
  Abstract_List_VisibleVariables(Machine(Deck))==(?);
  External_List_VisibleVariables(Machine(Deck))==(?);
  Expanded_List_VisibleVariables(Machine(Deck))==(?);
  List_VisibleVariables(Machine(Deck))==(?);
  Internal_List_VisibleVariables(Machine(Deck))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Deck))==(btrue);
  Gluing_List_Invariant(Machine(Deck))==(btrue);
  Expanded_List_Invariant(Machine(Deck))==(btrue);
  Abstract_List_Invariant(Machine(Deck))==(btrue);
  Context_List_Invariant(Machine(Deck))==(cards_points: CARDS <-> NAT);
  List_Invariant(Machine(Deck))==(deck <: CARDS*SUITS)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Deck))==(btrue);
  Abstract_List_Assertions(Machine(Deck))==(btrue);
  Context_List_Assertions(Machine(Deck))==(btrue);
  List_Assertions(Machine(Deck))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Deck))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Deck))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Deck))==(deck:=CARDS*SUITS);
  Context_List_Initialisation(Machine(Deck))==(skip);
  List_Initialisation(Machine(Deck))==(deck:=CARDS*SUITS)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Deck))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Deck),Machine(Cards))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Deck))==(btrue);
  List_Constraints(Machine(Deck))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Deck))==(?);
  List_Operations(Machine(Deck))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Deck))==(?);
  Inherited_List_Constants(Machine(Deck))==(?);
  List_Constants(Machine(Deck))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Deck),SUITS)==({HEART,DIAMOND,CLUB,SPADE});
  Context_List_Enumerated(Machine(Deck))==(CARDS,SUITS);
  Context_List_Defered(Machine(Deck))==(?);
  Context_List_Sets(Machine(Deck))==(CARDS,SUITS);
  List_Valuable_Sets(Machine(Deck))==(?);
  Inherited_List_Enumerated(Machine(Deck))==(?);
  Inherited_List_Defered(Machine(Deck))==(?);
  Inherited_List_Sets(Machine(Deck))==(?);
  List_Enumerated(Machine(Deck))==(?);
  List_Defered(Machine(Deck))==(?);
  List_Sets(Machine(Deck))==(?);
  Set_Definition(Machine(Deck),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Deck))==(?);
  Expanded_List_HiddenConstants(Machine(Deck))==(?);
  List_HiddenConstants(Machine(Deck))==(?);
  External_List_HiddenConstants(Machine(Deck))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Deck))==(btrue);
  Context_List_Properties(Machine(Deck))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}));
  Inherited_List_Properties(Machine(Deck))==(btrue);
  List_Properties(Machine(Deck))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Deck),Machine(Cards))==(?);
  Seen_Context_List_Enumerated(Machine(Deck))==(?);
  Seen_Context_List_Invariant(Machine(Deck))==(btrue);
  Seen_Context_List_Assertions(Machine(Deck))==(btrue);
  Seen_Context_List_Properties(Machine(Deck))==(btrue);
  Seen_List_Constraints(Machine(Deck))==(btrue);
  Seen_List_Operations(Machine(Deck),Machine(Cards))==(?);
  Seen_Expanded_List_Invariant(Machine(Deck),Machine(Cards))==(btrue)
END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Deck)) == (? | ? | deck | ? | ? | ? | seen(Machine(Cards)) | ? | Deck);
  List_Of_HiddenCst_Ids(Machine(Deck)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Deck)) == (?);
  List_Of_VisibleVar_Ids(Machine(Deck)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Deck)) == (?: ?);
  List_Of_Ids(Machine(Cards)) == (CARDS,SUITS,ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,HEART,DIAMOND,CLUB,SPADE | ? | cards_points | ? | ? | ? | ? | ? | Cards);
  List_Of_HiddenCst_Ids(Machine(Cards)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Cards)) == (?);
  List_Of_VisibleVar_Ids(Machine(Cards)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Cards)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Deck)) == (Type(deck) == Mvl(SetOf(etype(CARDS,?,?)*etype(SUITS,?,?))))
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
