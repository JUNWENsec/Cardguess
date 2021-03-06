-- File: Optimal1.hs
-- Author: Adam Juraszek
-- Purpose: Partly generated map of optimal second guesses for 1 card answers.
-- Source: https://github.com/juriad/Cardguess

module Optimal1 where

import Common

import Data.Map as Map


optimal1 :: Map.Map Feedback Selection
optimal1 = Map.fromList [
    ( ( 0 , 0 , 0 , 1 , 0 ) , [Card Spade R9] )
    , ( ( 0 , 0 , 0 , 1 , 1 ) , [Card Club Ace] )
    , ( ( 0 , 0 , 1 , 0 , 0 ) , [Card Spade R8] )
    , ( ( 0 , 1 , 0 , 0 , 0 ) , [Card Spade R2] )
    , ( ( 0 , 1 , 0 , 0 , 1 ) , [Card Club R7] )
    , ( ( 1 , 0 , 1 , 0 , 1 ) , [Card Club R8] )
    ]
