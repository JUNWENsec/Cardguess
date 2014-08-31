-- File: Cardguess.hs
-- Author: Adam Juraszek
-- Purpose: Prescribed interface of the solution exposed to the world.

{- | Module Cardguess contains prescribed functions to solve the problem of
    finding selected cards (0-4) with minimal number of guesses.
    The initial guess is precomputed by C program and is optimal
    in terms of distribution of feedbacks.
    The program keeps list of all possible options in its GameState object.
    The list is filtered according to response to the latest guess. -}
module Cardguess (initialGuess, nextGuess, GameState) where

import Common
import Optimalguess

{- | Returns the first response based on number of cards in answer.
    The results are proven to be optimal in terms of distribution
    of possible answers into small groups. -}
initialGuess :: Int -> Response
initialGuess n
    | n == 0 = ([], state) -- empty
    | n == 1 = ([ -- 8C
        Card Club R8], state)
    | n == 2 = ([ -- 6C TD
        Card Club R6,
        Card Diamond R10], state)
    | n == 3 = ([ -- 5C 9D TD
        Card Club R5,
        Card Diamond R9,
        Card Diamond R10], state)
    | n == 4 = ([ -- 5C 9C 9D TD
        Card Club R5,
        Card Club R9,
        Card Diamond R9,
        Card Diamond R10], state)
    | n < 0 = error "You think that you are funny?"
    | otherwise = error "Oops, that's too much for me!"
    where
        state = GameState $ subsets deck n -- all possible answers

{- | Returns next response based on previous response and its rating.
    The next response is chosen carefully trying to optimize
    distribution of possible answers. -}
nextGuess :: Response -> Feedback -> Response
nextGuess (prevGuess, GameState prevOptions) feedback =
    let
        options = filterOptions prevGuess feedback prevOptions
        (_, guess) = findBestGuess options
    in (guess, GameState options)
