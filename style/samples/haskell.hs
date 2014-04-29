module Haskell
    ( SomeType(..)
    , someFunction
    , anotherFunction
    ) where

import Control.Monad.State (state, evalState)
import Data.List (foldl')
import Data.Text (Text)
import qualified Data.Map  as M
import qualified Data.Text as T

import Database.Persistent (runSql)
import Yesod
import Yesod.Auth (requireAuthId, maybeAuthId)

import Foundation
import Settings

data Colors = Red | Blue | Green

data HTTPException
    = NotFound
    | NotAuthorized
    | InternalServerError
    | Whatever
    | YouGetTheIdea

data SomeType = SomeType
    { accessorOne :: String
    , accessorTwo :: String
    , accessorThree :: String
    } deriving Show

someType :: SomeType
someType = SomeType
    { accessorOne = "foo"
    , accessorTwo = "bar"
    , accessorThree = theThird
    }
  where
    theThird :: String
    theThird = "bar"

myFunction :: Show a
           => a
           -> a
           -> (a -> b)
           -> (b, b)
myFunction = -- ...

aList :: [String]
aList =
    [ one
    , two
    , three
    ]

aShortFunction = let x = 7 in x + 2

aLongerFunction =
    let x = 42
        y = 57
        z = 57
    in sum $ [x, y, z]

aCasedFunction x =
    case x of
        Just y -> y
        Nothing -> 0

aShortIf x = if x then y else z

aLongIf xs =
    if take 10 xs == [1..10]
        then drop 2 $ reverse xs
        else []

lineBreaks = take 3                              -- prefix
           . reverse . drop 1 . reverse . drop 1 -- strip
           . map upcase                          -- scream

main :: IO ()
main = do
    let x = getX
        andY = getY

    a <- getA
    andB <- getB

    return $ x + andY + a + andB
