{-# LANGUAGE TypeSynonymInstances, FlexibleInstances, FlexibleContexts, InstanceSigs #-}
{-# LANGUAGE ExistentialQuantification #-}
module P5Render where

import P5Expressions
import P5Funcs
import Data.List
import ListWriter

type JavaScript = String

class Renderer a where
  render :: a -> JavaScript

data RenderAble = forall t. (Renderer t, Show t) => RenderAble t

instance Show (RenderAble) where
  show (RenderAble a) = show a

instance Eq (RenderAble) where
  (==) a b = show a == show b
    -- where strip = (map removePunc . lines . render)

instance Renderer Int where
  render a = show a
instance Renderer Float where
  render a = show a
instance Renderer Integer where
  render a = show a
instance Renderer Double where
  render a = show a
instance Renderer Rational where
  render a = (rationalToFractional . show) a

betweenBrackets :: (Renderer a) => [a] ->JavaScript
betweenBrackets = (intercalate "," . map render)

-- taken from https://stackoverflow.com/questions/30242668
-- removePunc xs = [ x | x <- xs, not (x `elem` "?!:;\\\"\'") ]
removePunc = id

instance Renderer (RenderAble) where
  render (RenderAble a) = render a

instance (Renderer a) => Renderer [a] where
  render xs = concatMap ( (++ "\n") . render) xs

instance Renderer (ArgEx a) where
  render argex = f0
    where f0 = (rationalToFractional . varFunc) argex


-- instance (Renderer a) => Renderer (ArgEx a) where
--   render argex = removePunc f0
--     where f0 = varFunc argex

instance (Renderer a) => Renderer (P5Func a) where
  render (Func a) = render a
  render (FuncList as) = concatMap ((++ "\n") . render) as

instance (Renderer a, Renderer [a]) => Renderer (ListM a) where
  render :: Renderer a => ListM a -> JavaScript
  render = (render . toList)

listEnumToFunc :: Monad m => [m a] -> m ()
listEnumToFunc' [] _ = return ()
listEnumToFunc' (x:xs) arg = x >>= (\y -> listEnumToFunc' xs arg)
listEnumToFunc listEnum = listEnumToFunc' listEnum Nothing
