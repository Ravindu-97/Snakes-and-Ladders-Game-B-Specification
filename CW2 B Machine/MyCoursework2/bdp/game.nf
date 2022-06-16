Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(game))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(game))==(Machine(game));
  Level(Machine(game))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(game)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(game))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(game))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(game))==(?);
  List_Includes(Machine(game))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(game))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(game))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(game))==(?);
  Context_List_Variables(Machine(game))==(?);
  Abstract_List_Variables(Machine(game))==(?);
  Local_List_Variables(Machine(game))==(visitedSquares,numberOfLaddersEncounters,numberOfSnakesEncounters,numberOfMoves,lastThrownDiceValue,currentSquareValue);
  List_Variables(Machine(game))==(visitedSquares,numberOfLaddersEncounters,numberOfSnakesEncounters,numberOfMoves,lastThrownDiceValue,currentSquareValue);
  External_List_Variables(Machine(game))==(visitedSquares,numberOfLaddersEncounters,numberOfSnakesEncounters,numberOfMoves,lastThrownDiceValue,currentSquareValue)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(game))==(?);
  Abstract_List_VisibleVariables(Machine(game))==(?);
  External_List_VisibleVariables(Machine(game))==(?);
  Expanded_List_VisibleVariables(Machine(game))==(?);
  List_VisibleVariables(Machine(game))==(?);
  Internal_List_VisibleVariables(Machine(game))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(game))==(btrue);
  Gluing_List_Invariant(Machine(game))==(btrue);
  Expanded_List_Invariant(Machine(game))==(btrue);
  Abstract_List_Invariant(Machine(game))==(btrue);
  Context_List_Invariant(Machine(game))==(btrue);
  List_Invariant(Machine(game))==(currentSquareValue: normalSquares & lastThrownDiceValue: diceValues & numberOfMoves: NAT & numberOfSnakesEncounters: NAT & numberOfLaddersEncounters: NAT & visitedSquares: seq(squares))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(game))==(btrue);
  Abstract_List_Assertions(Machine(game))==(btrue);
  Context_List_Assertions(Machine(game))==(btrue);
  List_Assertions(Machine(game))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(game))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(game))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(game))==(currentSquareValue,lastThrownDiceValue,numberOfMoves,numberOfSnakesEncounters,numberOfLaddersEncounters,visitedSquares:=startingSquare,1,0,0,0,[startingSquare]);
  Context_List_Initialisation(Machine(game))==(skip);
  List_Initialisation(Machine(game))==(currentSquareValue:=startingSquare || lastThrownDiceValue:=1 || numberOfMoves:=0 || numberOfSnakesEncounters:=0 || numberOfLaddersEncounters:=0 || visitedSquares:=[startingSquare])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(game))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(game))==(btrue);
  List_Constraints(Machine(game))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(game))==(Move,GameStatistics,VisitedSquares,NewGame);
  List_Operations(Machine(game))==(Move,GameStatistics,VisitedSquares,NewGame)
END
&
THEORY ListInputX IS
  List_Input(Machine(game),Move)==(diceValue);
  List_Input(Machine(game),GameStatistics)==(?);
  List_Input(Machine(game),VisitedSquares)==(?);
  List_Input(Machine(game),NewGame)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(game),Move)==(outcome,currentPosition);
  List_Output(Machine(game),GameStatistics)==(currentPosition,snakeEncountersCount,ladderEncountersCount,movesCount);
  List_Output(Machine(game),VisitedSquares)==(squaresVisited);
  List_Output(Machine(game),NewGame)==(message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(game),Move)==(outcome,currentPosition <-- Move(diceValue));
  List_Header(Machine(game),GameStatistics)==(currentPosition,snakeEncountersCount,ladderEncountersCount,movesCount <-- GameStatistics);
  List_Header(Machine(game),VisitedSquares)==(squaresVisited <-- VisitedSquares);
  List_Header(Machine(game),NewGame)==(message <-- NewGame)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(game),Move)==(outcome: OUTCOME & diceValue: diceValues & not(currentSquareValue = finishingSquare));
  List_Precondition(Machine(game),GameStatistics)==(btrue);
  List_Precondition(Machine(game),VisitedSquares)==(btrue);
  List_Precondition(Machine(game),NewGame)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(game),NewGame)==(btrue | currentSquareValue,lastThrownDiceValue,numberOfMoves,numberOfSnakesEncounters,numberOfLaddersEncounters,visitedSquares,message:=startingSquare,1,0,0,0,[startingSquare],started_a_new_game);
  Expanded_List_Substitution(Machine(game),VisitedSquares)==(btrue | squaresVisited:=visitedSquares);
  Expanded_List_Substitution(Machine(game),GameStatistics)==(btrue | currentPosition,snakeEncountersCount,ladderEncountersCount,movesCount:=currentSquareValue,numberOfSnakesEncounters,numberOfLaddersEncounters,numberOfMoves);
  Expanded_List_Substitution(Machine(game),Move)==(outcome: OUTCOME & diceValue: diceValues & not(currentSquareValue = finishingSquare) | lastThrownDiceValue:=diceValue || (currentSquareValue+diceValue: squares ==> (currentSquareValue+diceValue: snakeHeadSquares ==> (currentSquareValue+diceValue = 16 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=13,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,13,visitedSquares<-16<-13 [] not(currentSquareValue+diceValue = 16) ==> (currentSquareValue+diceValue = 31 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=4,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,4,visitedSquares<-31<-4 [] not(currentSquareValue+diceValue = 31) ==> (currentSquareValue+diceValue = 47 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=25,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,25,visitedSquares<-47<-25 [] not(currentSquareValue+diceValue = 47) ==> (currentSquareValue+diceValue = 63 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=60,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,60,visitedSquares<-63<-60 [] not(currentSquareValue+diceValue = 63) ==> (currentSquareValue+diceValue = 66 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=52,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,52,visitedSquares<-66<-52 [] not(currentSquareValue+diceValue = 66) ==> (currentSquareValue+diceValue = 97 ==> currentSquareValue,numberOfMoves,numberOfSnakesEncounters,outcome,currentPosition,visitedSquares:=75,numberOfMoves+1,numberOfSnakesEncounters+1,went_down_a_snake,75,visitedSquares<-97<-75 [] not(currentSquareValue+diceValue = 97) ==> skip)))))) [] not(currentSquareValue+diceValue: snakeHeadSquares) ==> (currentSquareValue+diceValue: ladderBottomSquares ==> (currentSquareValue+diceValue = 3 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=39,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,39,visitedSquares<-3<-39 [] not(currentSquareValue+diceValue = 3) ==> (currentSquareValue+diceValue = 10 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=12,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,12,visitedSquares<-10<-12 [] not(currentSquareValue+diceValue = 10) ==> (currentSquareValue+diceValue = 27 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=53,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,53,visitedSquares<-27<-53 [] not(currentSquareValue+diceValue = 27) ==> (currentSquareValue+diceValue = 56 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=84,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,84,visitedSquares<-56<-84 [] not(currentSquareValue+diceValue = 56) ==> (currentSquareValue+diceValue = 61 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=99,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,99,visitedSquares<-61<-99 [] not(currentSquareValue+diceValue = 61) ==> (currentSquareValue+diceValue = 72 ==> currentSquareValue,numberOfMoves,numberOfLaddersEncounters,outcome,currentPosition,visitedSquares:=90,numberOfMoves+1,numberOfLaddersEncounters+1,went_up_a_ladder,90,visitedSquares<-72<-90 [] not(currentSquareValue+diceValue = 72) ==> skip)))))) [] not(currentSquareValue+diceValue: ladderBottomSquares) ==> (currentSquareValue+diceValue = 100 ==> currentSquareValue,numberOfMoves,outcome,currentPosition,visitedSquares:=100,numberOfMoves+1,finished_and_won,100,visitedSquares<-100 [] not(currentSquareValue+diceValue = 100) ==> currentSquareValue,numberOfMoves,outcome,currentPosition,visitedSquares:=currentSquareValue+diceValue,numberOfMoves+1,landed_on_a_normal_square,currentSquareValue+diceValue,visitedSquares<-currentSquareValue+diceValue))) [] not(currentSquareValue+diceValue: squares) ==> currentSquareValue,numberOfMoves,outcome,currentPosition,visitedSquares:=currentSquareValue,numberOfMoves+1,dice_value_was_too_high_to_finish,currentSquareValue,visitedSquares));
  List_Substitution(Machine(game),Move)==(lastThrownDiceValue:=diceValue || IF currentSquareValue+diceValue: squares THEN IF currentSquareValue+diceValue: snakeHeadSquares THEN IF currentSquareValue+diceValue = 16 THEN currentSquareValue:=13 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=13 || visitedSquares:=visitedSquares<-16<-13 ELSE IF currentSquareValue+diceValue = 31 THEN currentSquareValue:=4 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=4 || visitedSquares:=visitedSquares<-31<-4 ELSE IF currentSquareValue+diceValue = 47 THEN currentSquareValue:=25 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=25 || visitedSquares:=visitedSquares<-47<-25 ELSE IF currentSquareValue+diceValue = 63 THEN currentSquareValue:=60 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=60 || visitedSquares:=visitedSquares<-63<-60 ELSE IF currentSquareValue+diceValue = 66 THEN currentSquareValue:=52 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=52 || visitedSquares:=visitedSquares<-66<-52 ELSE IF currentSquareValue+diceValue = 97 THEN currentSquareValue:=75 || numberOfMoves:=numberOfMoves+1 || numberOfSnakesEncounters:=numberOfSnakesEncounters+1 || outcome:=went_down_a_snake || currentPosition:=75 || visitedSquares:=visitedSquares<-97<-75 END END END END END END ELSE IF currentSquareValue+diceValue: ladderBottomSquares THEN IF currentSquareValue+diceValue = 3 THEN currentSquareValue:=39 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=39 || visitedSquares:=visitedSquares<-3<-39 ELSE IF currentSquareValue+diceValue = 10 THEN currentSquareValue:=12 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=12 || visitedSquares:=visitedSquares<-10<-12 ELSE IF currentSquareValue+diceValue = 27 THEN currentSquareValue:=53 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=53 || visitedSquares:=visitedSquares<-27<-53 ELSE IF currentSquareValue+diceValue = 56 THEN currentSquareValue:=84 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=84 || visitedSquares:=visitedSquares<-56<-84 ELSE IF currentSquareValue+diceValue = 61 THEN currentSquareValue:=99 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=99 || visitedSquares:=visitedSquares<-61<-99 ELSE IF currentSquareValue+diceValue = 72 THEN currentSquareValue:=90 || numberOfMoves:=numberOfMoves+1 || numberOfLaddersEncounters:=numberOfLaddersEncounters+1 || outcome:=went_up_a_ladder || currentPosition:=90 || visitedSquares:=visitedSquares<-72<-90 END END END END END END ELSE IF currentSquareValue+diceValue = 100 THEN currentSquareValue:=100 || numberOfMoves:=numberOfMoves+1 || outcome:=finished_and_won || currentPosition:=100 || visitedSquares:=visitedSquares<-100 ELSE currentSquareValue:=currentSquareValue+diceValue || numberOfMoves:=numberOfMoves+1 || outcome:=landed_on_a_normal_square || currentPosition:=currentSquareValue+diceValue || visitedSquares:=visitedSquares<-currentSquareValue+diceValue END END END ELSE currentSquareValue:=currentSquareValue || numberOfMoves:=numberOfMoves+1 || outcome:=dice_value_was_too_high_to_finish || currentPosition:=currentSquareValue || visitedSquares:=visitedSquares END);
  List_Substitution(Machine(game),GameStatistics)==(currentPosition:=currentSquareValue || snakeEncountersCount:=numberOfSnakesEncounters || ladderEncountersCount:=numberOfLaddersEncounters || movesCount:=numberOfMoves);
  List_Substitution(Machine(game),VisitedSquares)==(squaresVisited:=visitedSquares);
  List_Substitution(Machine(game),NewGame)==(currentSquareValue:=startingSquare || lastThrownDiceValue:=1 || numberOfMoves:=0 || numberOfSnakesEncounters:=0 || numberOfLaddersEncounters:=0 || visitedSquares:=[startingSquare] || message:=started_a_new_game)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(game))==(squares,normalSquares,snakeHeadSquares,ladderBottomSquares,startingSquare,finishingSquare,diceValues);
  Inherited_List_Constants(Machine(game))==(?);
  List_Constants(Machine(game))==(squares,normalSquares,snakeHeadSquares,ladderBottomSquares,startingSquare,finishingSquare,diceValues)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(game),OUTCOME)==({went_down_a_snake,went_up_a_ladder,dice_value_was_too_high_to_finish,finished_and_won,landed_on_a_normal_square});
  Context_List_Enumerated(Machine(game))==(?);
  Context_List_Defered(Machine(game))==(?);
  Context_List_Sets(Machine(game))==(?);
  List_Valuable_Sets(Machine(game))==(?);
  Inherited_List_Enumerated(Machine(game))==(?);
  Inherited_List_Defered(Machine(game))==(?);
  Inherited_List_Sets(Machine(game))==(?);
  List_Enumerated(Machine(game))==(OUTCOME,MESSAGE);
  List_Defered(Machine(game))==(?);
  List_Sets(Machine(game))==(OUTCOME,MESSAGE);
  Set_Definition(Machine(game),MESSAGE)==({started_a_new_game})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(game))==(?);
  Expanded_List_HiddenConstants(Machine(game))==(?);
  List_HiddenConstants(Machine(game))==(?);
  External_List_HiddenConstants(Machine(game))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(game))==(btrue);
  Context_List_Properties(Machine(game))==(btrue);
  Inherited_List_Properties(Machine(game))==(btrue);
  List_Properties(Machine(game))==(squares = 1..100 & snakeHeadSquares <: squares & snakeHeadSquares = {16,31,47,63,66,97} & ladderBottomSquares <: squares & ladderBottomSquares = {3,10,27,56,61,72} & normalSquares <: squares & normalSquares/\snakeHeadSquares = {} & normalSquares/\ladderBottomSquares = {} & normalSquares\/snakeHeadSquares\/ladderBottomSquares = squares & startingSquare: normalSquares & startingSquare = 1 & finishingSquare: normalSquares & finishingSquare = 100 & diceValues = {1,2,3,4,5,6} & OUTCOME: FIN(INTEGER) & not(OUTCOME = {}) & MESSAGE: FIN(INTEGER) & not(MESSAGE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(game),Move)==(?);
  List_ANY_Var(Machine(game),GameStatistics)==(?);
  List_ANY_Var(Machine(game),VisitedSquares)==(?);
  List_ANY_Var(Machine(game),NewGame)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(game)) == (squares,normalSquares,snakeHeadSquares,ladderBottomSquares,startingSquare,finishingSquare,diceValues,OUTCOME,MESSAGE,went_down_a_snake,went_up_a_ladder,dice_value_was_too_high_to_finish,finished_and_won,landed_on_a_normal_square,started_a_new_game | ? | visitedSquares,numberOfLaddersEncounters,numberOfSnakesEncounters,numberOfMoves,lastThrownDiceValue,currentSquareValue | ? | Move,GameStatistics,VisitedSquares,NewGame | ? | ? | ? | game);
  List_Of_HiddenCst_Ids(Machine(game)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(game)) == (squares,normalSquares,snakeHeadSquares,ladderBottomSquares,startingSquare,finishingSquare,diceValues);
  List_Of_VisibleVar_Ids(Machine(game)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(game)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(game)) == (Type(OUTCOME) == Cst(SetOf(etype(OUTCOME,0,4)));Type(MESSAGE) == Cst(SetOf(etype(MESSAGE,0,0))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(game)) == (Type(went_down_a_snake) == Cst(etype(OUTCOME,0,4));Type(went_up_a_ladder) == Cst(etype(OUTCOME,0,4));Type(dice_value_was_too_high_to_finish) == Cst(etype(OUTCOME,0,4));Type(finished_and_won) == Cst(etype(OUTCOME,0,4));Type(landed_on_a_normal_square) == Cst(etype(OUTCOME,0,4));Type(started_a_new_game) == Cst(etype(MESSAGE,0,0));Type(squares) == Cst(SetOf(btype(INTEGER,"[squares","]squares")));Type(normalSquares) == Cst(SetOf(btype(INTEGER,"[normalSquares","]normalSquares")));Type(snakeHeadSquares) == Cst(SetOf(btype(INTEGER,"[snakeHeadSquares","]snakeHeadSquares")));Type(ladderBottomSquares) == Cst(SetOf(btype(INTEGER,"[ladderBottomSquares","]ladderBottomSquares")));Type(startingSquare) == Cst(btype(INTEGER,?,?));Type(finishingSquare) == Cst(btype(INTEGER,?,?));Type(diceValues) == Cst(SetOf(btype(INTEGER,"[diceValues","]diceValues"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(game)) == (Type(visitedSquares) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(numberOfLaddersEncounters) == Mvl(btype(INTEGER,?,?));Type(numberOfSnakesEncounters) == Mvl(btype(INTEGER,?,?));Type(numberOfMoves) == Mvl(btype(INTEGER,?,?));Type(lastThrownDiceValue) == Mvl(btype(INTEGER,?,?));Type(currentSquareValue) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(game)) == (Type(NewGame) == Cst(etype(MESSAGE,?,?),No_type);Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStatistics) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(Move) == Cst(etype(OUTCOME,?,?)*btype(INTEGER,?,?),btype(INTEGER,?,?)));
  Observers(Machine(game)) == (Type(VisitedSquares) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(GameStatistics) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
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
