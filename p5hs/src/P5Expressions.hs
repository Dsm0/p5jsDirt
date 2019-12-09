-- {-# LANGUAGE TypeSynonymInstances, FlexibleInstances, FlexibleContexts, InstanceSigs #-}

{-# LANGUAGE AllowAmbiguousTypes, InstanceSigs, UndecidableInstances #-}

module P5Expressions where

import Data.List (intercalate)
import P5Enviornment
import P5JSRenderFuncs
import Data.Fixed

data Object = Object
  deriving(Show)

class (Show a) => ArgEx_ a where
  toArgexNum :: a -> (ArgEx a)
  toArgexString :: a -> (ArgEx a)

data ArgEx a = ArgEx { value :: a ,
                       varFunc :: String}

-- data P5num x = forall b . Num b => P5num b

type ArgExD = ArgEx Double
-- type ArgExA = ArgEx (Num a)
type ArgExI = ArgEx Integer
type ArgExDList = ArgEx [Double]


instance (Eq a) => Eq (ArgEx a) where
  (==) argex0 argex1 = (w == z) && (xf == yf)
    where (w,z) = (value argex0, value argex1)
          (xf,yf) = (varFunc argex0, varFunc argex1)

rationalToFractional x = (map rtf) x
  where rtf '%' = '/'
        rtf c = c

instance (Show a) => Show (ArgEx a) where
  show argex = (rationalToFractional . varFunc) argex

makeValue :: (Num a,Show a) => a -> ArgEx a
makeValue a = ArgEx a (show a)
makeJSVar :: (Num a, Show b) => b -> ArgEx a
makeJSVar b = ArgEx (0) (show b)
makeJSVar' b = ArgEx (0) (b)
tidalParamString x = "message.get(" ++ (show x) ++ ")"
tidalParamStringFor fromParam paramToMatch paramToSet = "message.getFrom(" ++ args ++ ")"
  where args = (intercalate "," . map show) [fromParam,paramToMatch,paramToSet]
makeTidalParam :: (Num a1, Show a2) => a2 -> ArgEx a1
makeTidalParam x = makeJSVar' $ tidalParamString x

makeTidalParamFor :: (Num a1, Show a2) => a2 -> a2 -> a2 -> ArgEx a1
makeTidalParamFor fromParam paramToMatch paramToSet = makeJSVar' $ tidalParamStringFor fromParam paramToMatch paramToSet

instance (Show a, Num a) => Num (ArgEx a) where
  negate argex = ArgEx newX (jsMultiply "-1" (f0))
    where f0 = varFunc argex
          newX = negate $ value argex
  (+) argex0 argex1 = ArgEx (w + z) (jsAdd f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  (*) argex0 argex1 = ArgEx (w + z) (jsMultiply f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  fromInteger x = ArgEx (fromInteger x) (show x)
  abs argex = ArgEx newX (jsAbs f0)
    where f0 = varFunc argex
          newX = abs $ value argex
  signum argex = ArgEx newX (jsSign (f0))
    where f0 = varFunc argex
          newX = value argex

instance (Fractional a , Real a, Show a) => Fractional (ArgEx a)  where
  (/) argex0 argex1 = ArgEx (w / z) (jsDivide f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  recip argex = ArgEx (1 / w) (jsDivide "1" (bracket f0) )
    where w = value argex
          f0 = varFunc argex
  fromRational x = ArgEx (fromRational x) (show x)


instance (Show a, Enum a) => Enum (ArgEx a) where
  succ (ArgEx value str) = ArgEx (newVal) (show newVal)
    where newVal = succ value
  pred (ArgEx value str) = ArgEx (newVal) (show newVal)
    where newVal = pred value
  fromEnum (ArgEx x str) = fromEnum x
  toEnum x = ArgEx (toEnum x) (show x)

instance (Num a, Real a, Floating a, Fractional a, Show a) => Floating (ArgEx a) where
  exp argex = ArgEx (exp w) (jsExp f0)
    where w = value argex
          f0 = varFunc argex
  log argex = ArgEx (log w) (jsLog f0)
    where w = value argex
          f0 = varFunc argex
  (**) argex0 argex1 = ArgEx (w ** z) (jsPow f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  sqrt argex = ArgEx (w ** 0.5) (jsPow f0 "0.5")
    where w = value argex
          f0 = varFunc argex
  logBase argex0 argex1 = ArgEx ((log w) / log z) (jsDivide (jsLog f0) (jsLog f1))
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)

  sin argex = ArgEx (sin w) (jsSine f0)
    where w = value argex
          f0 = varFunc argex
  cos argex = ArgEx (cos w) (jsCosine f0)
    where w = value argex
          f0 = varFunc argex
  tan argex = ArgEx (tan w) (jsTan f0)
    where w = value argex
          f0 = varFunc argex
  asin argex = ArgEx (asin w) (jsASine f0)
    where w = value argex
          f0 = varFunc argex
  acos argex = ArgEx (acos w) (jsACosine f0)
    where w = value argex
          f0 = varFunc argex
  atan argex = ArgEx (atan w) (jsATan f0)
    where w = value argex
          f0 = varFunc argex
  sinh argex = ArgEx (sinh w) (jsSineh f0)
    where w = value argex
          f0 = varFunc argex
  cosh argex = ArgEx (cosh w) (jsCosineh f0)
    where w = value argex
          f0 = varFunc argex
  tanh argex = ArgEx (tanh w) (jsTanh f0)
    where w = value argex
          f0 = varFunc argex
  asinh argex = ArgEx (sinh w) (jsASineh f0)
    where w = value argex
          f0 = varFunc argex
  acosh argex = ArgEx (acosh w) (jsACosineh f0)
    where w = value argex
          f0 = varFunc argex
  atanh argex = ArgEx (atanh w) (jsATanh f0)
    where w = value argex
          f0 = varFunc argex


-- WARNING WARNING WARNING WARNING
-- DANGEROUS:::: will not consider JS Enviornment Variables
-- so if frameCount == 1billion, but an ArgEx have the value 2
-- haskell will check other ArgExs against 2
-- this implemenation may be removed because it's inherently broken
instance (Ord a) => Ord (ArgEx a) where
  (<) argex0 argex1 = w < z
  -- (\x -> jsLessThan (f0 w) (f1 z))
    where (w,z) = (value argex0, value argex1)
          -- (f0,f1) = ((varFunc argex0), (varFunc argex1))
  (>) argex0 argex1 = w > z
    where (w,z) = (value argex0, value argex1)
          -- (f0,f1) = ((varFunc argex0), (varFunc argex1))
  (>=) argex0 argex1 = w >= z
    where (w,z) = (value argex0, value argex1)
  (<=) argex0 argex1 = w <= z
    where (w,z) = (value argex0, value argex1)
  max argex0 argex1
         | w >= z    =  argex0
         | otherwise =  argex1
    where (w,z) = (value argex0, value argex1)
  min argex0 argex1
         | w <  z    =  argex0
         | otherwise =  argex1
    where (w,z) = (value argex0, value argex1)


instance (Ord a, Show a, Real a) => Real (ArgEx a) where
  toRational argex = toRational (value argex)

-- instance Foldable (ArgEx) where
--   foldr func argex0 argex1 = ArgEx (folded) (show folded)
--     where (w,z) = (value argex0, value argex1)
--           folded = foldr func w z
  -- foldMap

-- instance (Enum a) => Enum (ArgEx a) where
--   toEnum n = ArgEx (n) (show n)
--   fromEnum argex = fromEnum x
--     where x = value argex


instance (Show a, Enum a, Real a, Integral a) => Integral (ArgEx a) where
  quot argex0 argex1 = ArgEx (quot w z) (jsQuot f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  rem argex0 argex1 = ArgEx (mod w z) (jsQuot f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  div argex0 argex1 = ArgEx (div w z) (jsDiv f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  mod argex0 argex1 = ArgEx (mod w z) (jsMod f0 f1)
    where (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  quotRem argex0 argex1 = (quot',rem')
    where quot' = quot argex0 argex1
          rem' = rem argex0 argex1
          (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  divMod argex0 argex1 = (div', mod')
    where div' = div argex0 argex1
          mod'  = mod argex0 argex1
          (w,z) = (value argex0, value argex1)
          (f0,f1) = (varFunc argex0, varFunc argex1)
  toInteger argex = toInteger w
    where w = value argex




round' argex = ArgEx (round w) (jsRound f0)
  where w = value argex
        f0 = varFunc argex

floor' argex = ArgEx (floor w) (jsFloor f0)
  where w = value argex
        f0 = varFunc argex

ceiling' argex = ArgEx (ceiling w) (jsCeil f0)
  where w = value argex
        f0 = varFunc argex

instance (Integral a, RealFrac a, Show a) => RealFrac (ArgEx a) where
  properFraction argex = (pf1, a2)
    where a2 = ArgEx (pf2) (jsFrac f0)
          (pf1,pf2) = properFraction w
          w = value argex
          f0 = varFunc argex
  
  -- round :: (Num a, Integral b) => ArgEx a -> ArgEx b
  -- round argex = ArgEx (round w) ""
  --   where w = value argex
  --         f0 = varFunc argex
  --
  -- floor argex = floor w
  --   where w = value argex
  --         f0 = varFunc argex
  --
  -- ceiling argex = (ArgEx (ceiling w) (jsCeil f0))
  --   where w = value argex
  --         f0 = varFunc argex
