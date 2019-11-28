module P5Expressions where

import P5Enviornment
import P5JSRenderFuncs

data Object = Object
  deriving(Show)

class (Show a) => ArgEx_ a where
  toArgexNum :: a -> (ArgEx a)
  toArgexString :: a -> (ArgEx a)

data ArgEx a = ArgEx { value :: a ,
                       varFunc :: String}

instance (Eq a) => Eq (ArgEx a) where
  (==) argex0 argex1 = (w == z) && (xf == yf)
    where (w,z) = (value argex0, value argex1)
          (xf,yf) = (varFunc argex0, varFunc argex1)


rationalToFractional x = (map rtf) x
  where rtf '%' = '/'
        rtf c = c

instance (Show a) => Show (ArgEx a) where
  show argex = (rationalToFractional . varFunc) argex

makeValue a = ArgEx a (show a)

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
    -- where w = value argex
    --       f0 = varFunc argex

instance (RealFrac a, Show a, Enum a) => Enum (ArgEx a) where
  succ (ArgEx value str) = ArgEx (newVal) (show newVal)
    where newVal = succ value
  pred (ArgEx value str) = ArgEx (newVal) (show newVal)
    where newVal = pred value
  fromEnum (ArgEx x str) = round x
  toEnum x = ArgEx (toNum x) (show x)
    where toNum = fromInteger . toInteger


instance (Real a, Floating a, Show a) => Floating (ArgEx a) where
  exp argex = ArgEx (exp w) (jsExp f0)
    where w = value argex
          f0 = varFunc argex

  -- log
  -- sqrt      :: a -> a
  -- (**),
  -- logBase
  -- sin,
  -- cos,
  -- tan       :: a -> a
  -- asin,
  -- acos,
  -- atan    :: a -> a
  -- sinh,
  -- cosh,
  -- tanh    :: a -> a
  -- asinh,
  -- acosh,
  -- atanh
  -- logBase x y      =  log y / log x
  -- sqrt x           =  x ** 0.5
  -- tan  x           =  sin  x / cos  x
  -- tanh x           =  sinh x / cosh x

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


-- instance (Ord a, Show a, Real a) => Real (ArgEx a) where
--   toRational argex = toRational (value argex)
--
-- instance (Real a, Enum a) => Integral (ArgEx a) where
--     div argex0 argex1 = ArgEx (div w z) (\x -> jsIntegralDiv (f0 1) (f1 x))
--       where (w,z) = ((value argex0), (value argex1))
--             (f0,f1) = ((varFunc argex0), (varFunc argex1))
--     mod x y
--       where (w,z) = ((value x), (value y))
--             (f0,f1) = ((varFunc x), (varFunc y))
--     quotRem, divMod  :: a -> a -> (a,a)
--     toInteger        :: a -> Integer

  -- (/) x y = ArgEx (w / z) (\x -> bracket $ xf 1 ++ " / "++ yf x)
  --   where (w,z) = ((value x), (value y))
  --         (xf,yf) = ((varFunc x), (varFunc y))
