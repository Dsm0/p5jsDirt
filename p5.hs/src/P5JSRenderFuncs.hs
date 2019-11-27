module P5JSRenderFuncs where


bracket x = "(" ++ x ++ ")"

jsAdd x y = bracket $ x ++ " + " ++ y
jsMultiply x y = bracket $ x ++ " * " ++ y
jsAbs x = bracket ("Math.abs(" ++ x ++ ")")
jsSign x = bracket ("Math.sign(" ++ x ++ ")")
--
jsDivide x y = bracket (x ++ " / " ++ y)
--
jsIntegralDiv x y = bracket ("Math.floor(" ++ (jsDivide x y) ++ ")")
jsLessThan x y = bracket (x ++ " < " ++ y)
jsGreaterThan x y = bracket (x ++ " > " ++ y)
--
jsExp x = bracket ("Math.exp" ++ bracket x)
jsLog x = bracket ("Math.log" ++ bracket x)
jsPow x y = bracket ("Math.pow" ++ bracket (bx ++ "," ++ by))
  where bx = bracket x
        by = bracket y
jsSqrt x = jsPow x "0.5"        

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
