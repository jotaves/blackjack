Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Game_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Game_ctx))==(Machine(Game_ctx));
  Level(Machine(Game_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Game_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Game_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Game_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Game_ctx))==(?);
  List_Includes(Machine(Game_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Game_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Game_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Game_ctx))==(?);
  Context_List_Variables(Machine(Game_ctx))==(?);
  Abstract_List_Variables(Machine(Game_ctx))==(?);
  Local_List_Variables(Machine(Game_ctx))==(?);
  List_Variables(Machine(Game_ctx))==(?);
  External_List_Variables(Machine(Game_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Game_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(Game_ctx))==(?);
  External_List_VisibleVariables(Machine(Game_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(Game_ctx))==(?);
  List_VisibleVariables(Machine(Game_ctx))==(?);
  Internal_List_VisibleVariables(Machine(Game_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Game_ctx))==(btrue);
  Gluing_List_Invariant(Machine(Game_ctx))==(btrue);
  Expanded_List_Invariant(Machine(Game_ctx))==(btrue);
  Abstract_List_Invariant(Machine(Game_ctx))==(btrue);
  Context_List_Invariant(Machine(Game_ctx))==(btrue);
  List_Invariant(Machine(Game_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Game_ctx))==(btrue);
  Abstract_List_Assertions(Machine(Game_ctx))==(btrue);
  Context_List_Assertions(Machine(Game_ctx))==(btrue);
  List_Assertions(Machine(Game_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Game_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Game_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Game_ctx))==(skip);
  Context_List_Initialisation(Machine(Game_ctx))==(skip);
  List_Initialisation(Machine(Game_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Game_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Game_ctx))==(btrue);
  List_Constraints(Machine(Game_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Game_ctx))==(?);
  List_Operations(Machine(Game_ctx))==(?)
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
  List_Valuable_Constants(Machine(Game_ctx))==(?);
  Inherited_List_Constants(Machine(Game_ctx))==(?);
  List_Constants(Machine(Game_ctx))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Game_ctx),PLAYER_TYPE)==({PLAYER,DEALER});
  Context_List_Enumerated(Machine(Game_ctx))==(?);
  Context_List_Defered(Machine(Game_ctx))==(?);
  Context_List_Sets(Machine(Game_ctx))==(?);
  List_Valuable_Sets(Machine(Game_ctx))==(?);
  Inherited_List_Enumerated(Machine(Game_ctx))==(?);
  Inherited_List_Defered(Machine(Game_ctx))==(?);
  Inherited_List_Sets(Machine(Game_ctx))==(?);
  List_Enumerated(Machine(Game_ctx))==(PLAYER_TYPE);
  List_Defered(Machine(Game_ctx))==(?);
  List_Sets(Machine(Game_ctx))==(PLAYER_TYPE)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Game_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(Game_ctx))==(?);
  List_HiddenConstants(Machine(Game_ctx))==(?);
  External_List_HiddenConstants(Machine(Game_ctx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Game_ctx))==(btrue);
  Context_List_Properties(Machine(Game_ctx))==(btrue);
  Inherited_List_Properties(Machine(Game_ctx))==(btrue);
  List_Properties(Machine(Game_ctx))==(PLAYER_TYPE: FIN(INTEGER) & not(PLAYER_TYPE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Game_ctx)) == (PLAYER_TYPE,PLAYER,DEALER | ? | ? | ? | ? | ? | ? | ? | Game_ctx);
  List_Of_HiddenCst_Ids(Machine(Game_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Game_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Game_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Game_ctx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Game_ctx)) == (Type(PLAYER_TYPE) == Cst(SetOf(etype(PLAYER_TYPE,0,1))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Game_ctx)) == (Type(PLAYER) == Cst(etype(PLAYER_TYPE,0,1));Type(DEALER) == Cst(etype(PLAYER_TYPE,0,1)))
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
