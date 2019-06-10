Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Cards))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Cards))==(Machine(Cards));
  Level(Machine(Cards))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Cards)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Cards))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Cards))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Cards))==(?);
  List_Includes(Machine(Cards))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Cards))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Cards))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Cards))==(?);
  Context_List_Variables(Machine(Cards))==(?);
  Abstract_List_Variables(Machine(Cards))==(?);
  Local_List_Variables(Machine(Cards))==(cards_points);
  List_Variables(Machine(Cards))==(cards_points);
  External_List_Variables(Machine(Cards))==(cards_points)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Cards))==(?);
  Abstract_List_VisibleVariables(Machine(Cards))==(?);
  External_List_VisibleVariables(Machine(Cards))==(?);
  Expanded_List_VisibleVariables(Machine(Cards))==(?);
  List_VisibleVariables(Machine(Cards))==(?);
  Internal_List_VisibleVariables(Machine(Cards))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Cards))==(btrue);
  Gluing_List_Invariant(Machine(Cards))==(btrue);
  Expanded_List_Invariant(Machine(Cards))==(btrue);
  Abstract_List_Invariant(Machine(Cards))==(btrue);
  Context_List_Invariant(Machine(Cards))==(btrue);
  List_Invariant(Machine(Cards))==(cards_points: CARDS <-> 1..11)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Cards))==(btrue);
  Abstract_List_Assertions(Machine(Cards))==(btrue);
  Context_List_Assertions(Machine(Cards))==(btrue);
  List_Assertions(Machine(Cards))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Cards))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Cards))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Cards))==(cards_points:={ACE}*{1,11}\/{TWO|->2,THREE|->3,FOUR|->4,FIVE|->5,SIX|->6,SEVEN|->7,EIGHT|->8,NINE|->9}\/{TEN,JACK,QUEEN,KING}*{10});
  Context_List_Initialisation(Machine(Cards))==(skip);
  List_Initialisation(Machine(Cards))==(cards_points:={ACE}*{1,11}\/{TWO|->2,THREE|->3,FOUR|->4,FIVE|->5,SIX|->6,SEVEN|->7,EIGHT|->8,NINE|->9}\/{TEN,JACK,QUEEN,KING}*{10})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Cards))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Cards))==(btrue);
  List_Constraints(Machine(Cards))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Cards))==(?);
  List_Operations(Machine(Cards))==(?)
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
  List_Valuable_Constants(Machine(Cards))==(?);
  Inherited_List_Constants(Machine(Cards))==(?);
  List_Constants(Machine(Cards))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Cards),CARDS)==({ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING});
  Context_List_Enumerated(Machine(Cards))==(?);
  Context_List_Defered(Machine(Cards))==(?);
  Context_List_Sets(Machine(Cards))==(?);
  List_Valuable_Sets(Machine(Cards))==(?);
  Inherited_List_Enumerated(Machine(Cards))==(?);
  Inherited_List_Defered(Machine(Cards))==(?);
  Inherited_List_Sets(Machine(Cards))==(?);
  List_Enumerated(Machine(Cards))==(CARDS,SUITS);
  List_Defered(Machine(Cards))==(?);
  List_Sets(Machine(Cards))==(CARDS,SUITS);
  Set_Definition(Machine(Cards),SUITS)==({HEART,DIAMOND,CLUB,SPADE})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Cards))==(?);
  Expanded_List_HiddenConstants(Machine(Cards))==(?);
  List_HiddenConstants(Machine(Cards))==(?);
  External_List_HiddenConstants(Machine(Cards))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Cards))==(btrue);
  Context_List_Properties(Machine(Cards))==(btrue);
  Inherited_List_Properties(Machine(Cards))==(btrue);
  List_Properties(Machine(Cards))==(CARDS: FIN(INTEGER) & not(CARDS = {}) & SUITS: FIN(INTEGER) & not(SUITS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Cards)) == (CARDS,SUITS,ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING,HEART,DIAMOND,CLUB,SPADE | ? | cards_points | ? | ? | ? | ? | ? | Cards);
  List_Of_HiddenCst_Ids(Machine(Cards)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Cards)) == (?);
  List_Of_VisibleVar_Ids(Machine(Cards)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Cards)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Cards)) == (Type(CARDS) == Cst(SetOf(etype(CARDS,0,12)));Type(SUITS) == Cst(SetOf(etype(SUITS,0,3))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Cards)) == (Type(ACE) == Cst(etype(CARDS,0,12));Type(TWO) == Cst(etype(CARDS,0,12));Type(THREE) == Cst(etype(CARDS,0,12));Type(FOUR) == Cst(etype(CARDS,0,12));Type(FIVE) == Cst(etype(CARDS,0,12));Type(SIX) == Cst(etype(CARDS,0,12));Type(SEVEN) == Cst(etype(CARDS,0,12));Type(EIGHT) == Cst(etype(CARDS,0,12));Type(NINE) == Cst(etype(CARDS,0,12));Type(TEN) == Cst(etype(CARDS,0,12));Type(JACK) == Cst(etype(CARDS,0,12));Type(QUEEN) == Cst(etype(CARDS,0,12));Type(KING) == Cst(etype(CARDS,0,12));Type(HEART) == Cst(etype(SUITS,0,3));Type(DIAMOND) == Cst(etype(SUITS,0,3));Type(CLUB) == Cst(etype(SUITS,0,3));Type(SPADE) == Cst(etype(SUITS,0,3)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Cards)) == (Type(cards_points) == Mvl(SetOf(etype(CARDS,?,?)*btype(INTEGER,?,?))))
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
