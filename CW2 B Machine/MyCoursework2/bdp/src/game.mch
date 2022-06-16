/* game
 * Author: Acer
 * Creation date: 1/23/2022
 */

/* Assumptions:

    * The game starts from the square 1 (Player is already in the square 1 when the game starts.
    * The game initially stores a default value of 1 as the last thrown dice value in the beginning of the game.
    * The game can be started for any value obtained as a result of throwing the dice. (Not only for the values such as 1 or 6).
*/

MACHINE game

    SETS
        OUTCOME = { went_down_a_snake , went_up_a_ladder , dice_value_was_too_high_to_finish , finished_and_won , landed_on_a_normal_square } ;
        MESSAGE = { started_a_new_game }

    CONCRETE_CONSTANTS
        squares ,
        normalSquares ,
        snakeHeadSquares ,
        ladderBottomSquares ,
        startingSquare ,
        finishingSquare ,
        diceValues

    PROPERTIES
        // Defining the valid range of square numbers for the game
        squares = 1 .. 100 &

        // Defining the snake head square properties and numbers
        snakeHeadSquares <: squares &
        snakeHeadSquares = { 16 , 31 , 47 , 63 , 66 , 97 } &

        // Defining the ladder bottom square properties and numbers
        ladderBottomSquares <: squares &
        ladderBottomSquares = { 3 , 10 , 27 , 56 , 61 , 72 } &

        // Defining the normal squares for the game
        normalSquares <: squares &
        normalSquares /\ snakeHeadSquares = {} &
        normalSquares /\ ladderBottomSquares = {} &
        normalSquares \/ snakeHeadSquares \/ ladderBottomSquares = squares &

        // Defining the properties and positions of starting and ending squares 
        startingSquare : normalSquares & startingSquare = 1  &
        finishingSquare : normalSquares & finishingSquare = 100 &
        diceValues = { 1 , 2 , 3 , 4 , 5 , 6  }







    ABSTRACT_VARIABLES
        currentSquareValue ,
        lastThrownDiceValue ,
        numberOfMoves ,
        numberOfSnakesEncounters ,
        numberOfLaddersEncounters ,
        visitedSquares

    INVARIANT
        currentSquareValue : normalSquares &
        lastThrownDiceValue : diceValues &
        numberOfMoves : NAT &
        numberOfSnakesEncounters : NAT &
        numberOfLaddersEncounters : NAT &
        visitedSquares : seq ( squares )

    INITIALISATION
        currentSquareValue := startingSquare ||
        lastThrownDiceValue := 1 ||  // Just initializing a value from 1 to 6 for the first time as the last thrown dice value
        numberOfMoves := 0 ||
        numberOfSnakesEncounters := 0 ||
        numberOfLaddersEncounters := 0 ||
        visitedSquares := [ startingSquare ]

    OPERATIONS
        // 'Move' function which implements the functionality of throwing the dice and moving across the board
        outcome , currentPosition <-- Move ( diceValue ) =
            PRE
                outcome : OUTCOME & diceValue : diceValues & not ( ( currentSquareValue = finishingSquare ) )
            THEN
                lastThrownDiceValue := diceValue ||
                IF ( ( currentSquareValue + diceValue : squares )         )
                THEN
                    IF ( ( currentSquareValue + diceValue : snakeHeadSquares )   )
                    THEN
                        IF ( currentSquareValue + diceValue = 16 )
                        THEN
                            currentSquareValue := 13 ||
                            numberOfMoves := numberOfMoves + 1 ||
                            numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                            outcome := went_down_a_snake ||
                            currentPosition := 13 ||
                            visitedSquares := visitedSquares <- 16 <- 13
                        ELSE
                            IF ( currentSquareValue + diceValue = 31 )
                            THEN
                                currentSquareValue := 4  ||
                                numberOfMoves := numberOfMoves + 1 ||
                                numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                                outcome := went_down_a_snake ||
                                currentPosition := 4  ||
                                visitedSquares := visitedSquares <- 31 <- 4
                            ELSE
                                IF ( currentSquareValue + diceValue = 47 )
                                THEN
                                    currentSquareValue := 25 ||
                                    numberOfMoves := numberOfMoves + 1 ||
                                    numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                                    outcome := went_down_a_snake ||
                                    currentPosition := 25 ||
                                    visitedSquares := visitedSquares <- 47 <- 25
                                ELSE
                                    IF ( currentSquareValue + diceValue = 63 )
                                    THEN
                                        currentSquareValue := 60 ||
                                        numberOfMoves := numberOfMoves + 1 ||
                                        numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                                        outcome := went_down_a_snake ||
                                        currentPosition := 60 ||
                                        visitedSquares := visitedSquares <- 63 <- 60
                                    ELSE
                                        IF ( currentSquareValue + diceValue = 66 )
                                        THEN
                                            currentSquareValue := 52 ||
                                            numberOfMoves := numberOfMoves + 1 ||
                                            numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                                            outcome := went_down_a_snake ||
                                            currentPosition := 52 ||
                                            visitedSquares := visitedSquares <- 66 <- 52
                                        ELSE
                                            IF ( currentSquareValue + diceValue = 97 )
                                            THEN
                                                currentSquareValue := 75 ||
                                                numberOfMoves := numberOfMoves + 1 ||
                                                numberOfSnakesEncounters := numberOfSnakesEncounters + 1 ||
                                                outcome := went_down_a_snake ||
                                                currentPosition := 75 ||
                                                visitedSquares := visitedSquares <- 97 <- 75
                                            END
                                        END
                                    END
                                END
                            END
                        END
                    ELSE
                        IF ( ( currentSquareValue + diceValue : ladderBottomSquares )   )
                        THEN
                            IF ( currentSquareValue + diceValue = 3  )
                            THEN
                                currentSquareValue := 39 ||
                                numberOfMoves := numberOfMoves + 1 ||
                                numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                outcome := went_up_a_ladder ||
                                currentPosition := 39 ||
                                visitedSquares := visitedSquares <- 3  <- 39
                            ELSE
                                IF ( currentSquareValue + diceValue = 10 )
                                THEN
                                    currentSquareValue := 12 ||
                                    numberOfMoves := numberOfMoves + 1 ||
                                    numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                    outcome := went_up_a_ladder ||
                                    currentPosition := 12 ||
                                    visitedSquares := visitedSquares <- 10 <- 12
                                ELSE
                                    IF ( currentSquareValue + diceValue = 27 )
                                    THEN
                                        currentSquareValue := 53 ||
                                        numberOfMoves := numberOfMoves + 1 ||
                                        numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                        outcome := went_up_a_ladder ||
                                        currentPosition := 53 ||
                                        visitedSquares := visitedSquares <- 27 <- 53
                                    ELSE
                                        IF ( currentSquareValue + diceValue = 56 )
                                        THEN
                                            currentSquareValue := 84 ||
                                            numberOfMoves := numberOfMoves + 1 ||
                                            numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                            outcome := went_up_a_ladder ||
                                            currentPosition := 84 ||
                                            visitedSquares := visitedSquares <- 56 <- 84
                                        ELSE
                                            IF ( currentSquareValue + diceValue = 61 )
                                            THEN
                                                currentSquareValue := 99 ||
                                                numberOfMoves := numberOfMoves + 1 ||
                                                numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                                outcome := went_up_a_ladder ||
                                                currentPosition := 99 ||
                                                visitedSquares := visitedSquares <- 61 <- 99
                                            ELSE
                                                IF ( currentSquareValue + diceValue = 72 )
                                                THEN
                                                    currentSquareValue := 90 ||
                                                    numberOfMoves := numberOfMoves + 1 ||
                                                    numberOfLaddersEncounters := numberOfLaddersEncounters + 1 ||
                                                    outcome := went_up_a_ladder ||
                                                    currentPosition := 90 ||
                                                    visitedSquares := visitedSquares <- 72 <- 90
                                                END
                                            END
                                        END
                                    END
                                END
                            END
                        ELSE
                            IF ( currentSquareValue + diceValue = 100 )
                            THEN
                                currentSquareValue := 100 ||
                                numberOfMoves := numberOfMoves + 1 ||
                                outcome := finished_and_won ||
                                currentPosition := 100 ||
                                visitedSquares := visitedSquares <- ( 100 )
                            ELSE
                                currentSquareValue := currentSquareValue + diceValue ||
                                numberOfMoves := numberOfMoves + 1 ||
                                outcome := landed_on_a_normal_square ||
                                currentPosition := currentSquareValue + diceValue ||
                                visitedSquares := visitedSquares <- ( currentSquareValue + diceValue )
                            END
                        END
                    END
                ELSE
                    currentSquareValue := currentSquareValue ||
                    numberOfMoves := numberOfMoves + 1 ||
                    outcome := dice_value_was_too_high_to_finish ||
                    currentPosition := currentSquareValue ||
                    visitedSquares := visitedSquares
                END
            END ;

        // An inquiry operation which reports the current statistics of the game ('GameStatistics' function)
        currentPosition , snakeEncountersCount , ladderEncountersCount , movesCount <-- GameStatistics =
            BEGIN
                currentPosition := currentSquareValue ||
                snakeEncountersCount := numberOfSnakesEncounters ||
                ladderEncountersCount := numberOfLaddersEncounters ||
                movesCount := numberOfMoves
            END ;

        // An inquiry operation which reports the squares that the player landed in order ('VisitedSquares' function)
        squaresVisited <-- VisitedSquares =
            BEGIN
                squaresVisited := visitedSquares
            END ;

        // Starts a new game ('NewGame' function)
        message <-- NewGame =
            BEGIN
                currentSquareValue := startingSquare ||
                lastThrownDiceValue := 1 ||  // Just initializing a value from 1 to 6 for the first time as the last thrown dice value
                numberOfMoves := 0 ||
                numberOfSnakesEncounters := 0 ||
                numberOfLaddersEncounters := 0 ||
                visitedSquares := [ startingSquare ] ||
                message := started_a_new_game
            END

END
