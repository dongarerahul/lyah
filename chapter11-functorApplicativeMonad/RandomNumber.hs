{-# LANGUAGE GeneralizedNewtypeDeriving #-}

runSupply :: Supply s a -> [s] -> (a, [s])
next :: Supply s (Maybe s)
-- Random number generator need to hide state from external world

-- export only
-- type constructor i.e. Supply,
-- execution function i.e. runSupply and
-- next action i.e. next
module Supply (
  Supply,
  next,
  runSupply
              ) where

import Control.Monad.State
-- we are not exporting S data constructor
newtype Supply s a = S (State [s] a)

deriving (Monad)

--State and Accumulator / result i.e. current random number


unwrapS :: Supply s a -> State [s] a
unwrapS (S s) = s

instance Monad (Supply s) where
  s >>= m = S (unwrapS s >>= unwrapS . m)
  return = S . return



