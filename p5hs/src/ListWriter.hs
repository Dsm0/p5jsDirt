{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

-- gracious thanks to
-- https://github.com/YLiLarry/ListWriter/blob/master/src/Syntax/ListWriter/Internal.hs

module ListWriter where

import Control.Monad.Writer (Writer(..), runWriter, tell, MonadWriter(..))

newtype ListM' a x = ListM {
      unListM :: Writer [a] x
   } deriving (Functor, Applicative, Monad, MonadWriter [a], Show,Ord, Eq)

type ListM a = ListM' a ()

join              :: (Monad m) => m (m a) -> m a
join x            =  x >>= id

toList :: ListM a -> [a]
toList m = snd $ runWriter $ unListM m

toList_ m = toList mx
  where mx = ListM m

fromList :: [a] -> ListM a
fromList = tell

element :: a -> ListM a
element a = fromList [a]
