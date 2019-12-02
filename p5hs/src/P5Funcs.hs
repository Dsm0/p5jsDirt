{-# LANGUAGE DeriveFoldable #-}

module P5Funcs where

import Data.Foldable as Foldable

import P5Expressions

data P5Func a = Func a | FuncList [P5Func a]
  deriving (Show, Foldable)
  -- taken from
  -- https://stackoverflow.com/questions/43450063/
  -- so I could have my own instance of Monad for lists of functions

instance Functor P5Func where
  fmap f (Func x) = Func (f x)
  -- fmap f (FuncList xs) = FuncList $ foldr (\y ys -> ((fmap f y)):ys) [] xs
  -- foldr function partially taken from
  -- https://stackoverflow.com/questions/33831602/

instance Applicative P5Func where
    pure x = Func x
    (<*>) (Func f) y = fmap f y

instance Monad P5Func where
    return x = pure x
    (>>=) (Func a) f = f a
    -- (>>=) (FuncList a) f = FuncList (map (\x -> x >>= f) a)
