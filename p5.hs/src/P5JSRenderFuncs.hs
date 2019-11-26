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
