{-# LANGUAGE TypeSynonymInstances, FlexibleInstances, FlexibleContexts, InstanceSigs #-}
{-# LANGUAGE ExistentialQuantification, UndecidableInstances #-}
module P5Render where

import P5Expressions
import P5Funcs
import Data.List
import Data.Ratio
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


-- instance (Num a, Fractional a) => Renderer a where
--   render a = (rationalToFractional . show) a

-- instance (Ratio a) => Renderer (Ratio a) where
--   render a = (rationalToFractional . show) a

betweenBrackets :: (Renderer a) => [a] ->JavaScript
betweenBrackets = (intercalate "," . map render)

listBetweenBrackets :: (Renderer a) => [[a]] ->JavaScript
listBetweenBrackets = betweenBrackets . concat


makeValue :: (Num a,Show a) => a -> ArgEx a
makeValue a = ArgEx a (show a)
makeJSVar :: (Num a, Show b, Renderer b) => b -> ArgEx a
makeJSVar b = ArgEx (0) (show b)
makeJSVar' b = ArgEx (0) (b)
tidalParamString x = "message.get(" ++ (show x) ++ ")"
tidalParamStringFor fromParam paramToMatch paramToSet = "message.getFrom(" ++ args ++ ")"
  where args = (intercalate "," . map show) [fromParam,paramToMatch,paramToSet]

makeTidalParam :: (Num a1, Show a2) => a2 -> ArgEx a1
makeTidalParam x = makeJSVar' $ tidalParamString x

makeTidalParamFor :: (Num a1, Show a2) => a2 -> a2 -> a2 -> ArgEx a1
makeTidalParamFor fromParam paramToMatch paramToSet = makeJSVar' $ tidalParamStringFor fromParam paramToMatch paramToSet



-- taken from https://stackoverflow.com/questions/30242668
-- removePunc xs = [ x | x <- xs, not (x `elem` "?!:;\\\"\'") ]

-- instance Renderer String where
--   render x = render $ makeJSVar' x
instance Renderer (RenderAble) where
  render (RenderAble a) = render a

instance Renderer (ArgEx a) where
  render argex = f0
    where f0 = varFunc argex

instance {-# OVERLAPPING #-} Renderer String where
  render = (render . makeJSVar')

instance (Renderer a) => Renderer [a] where
  render xs = concatMap ( (++ "\n") . render) xs

removePunc xs = [ x | x <- xs, not (x `elem` ",.?!-:;\"\'/=") ]

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

prettyRender :: (Renderer a) => a -> IO ()
prettyRender = putStrLn . render
