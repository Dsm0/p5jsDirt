module P5JSRenderFuncs where

bracket x = "(" ++ x ++ ")"


jsEq x y = bracket $ x ++ " == " ++ y
jsNEq x y = bracket $ x ++ " != " ++ y
jsGt x y = bracket $ x ++ " > " ++ y
jsLt x y = bracket $ x ++ " < " ++ y
jsGtEq x y = bracket $ x ++ " >= " ++ y
jsLtEq x y = bracket $ x ++ " <= " ++ y

jsAdd x y = bracket $ x ++ " + " ++ y
jsMultiply x y = bracket $ x ++ " * " ++ y
jsAbs x = bracket ("Math.abs(" ++ x ++ ")")
jsSign x = bracket ("Math.sign(" ++ x ++ ")")
--
jsDivide x y = bracket (x ++ " / " ++ y)

jsFloor x = bracket ("Math.floor" ++ (bracket x))
jsCeil x = bracket ("Math.ceil" ++ (bracket x))
jsRound x = bracket ("Math.round" ++ (bracket x))

jsQuot x y = jsFloor (bracket dived)
  where dived = jsDivide x y
jsDiv x y = jsFloor (jsDivide x y)

jsMod x y = bracket (x ++ " % " ++ y)

jsFrac x = bracket $ jsMod x (jsFloor x)

--
jsLessThan x y = bracket (x ++ " < " ++ y)
jsGreaterThan x y = bracket (x ++ " > " ++ y)
--
jsExp x = bracket ("Math.exp" ++ bracket x)
jsLog x = bracket ("Math.log" ++ bracket x)
jsPow x y = bracket ("Math.pow" ++ bracket (bx ++ "," ++ by))
  where bx = bracket x
        by = bracket y

jsSqrt x = jsPow x "0.5"

jsSine x = bracket ("Math.sin" ++ bracket x)
jsCosine x = bracket ("Math.cos" ++ bracket x)
jsTan x = bracket ("Math.tan" ++ bracket x)

jsASine x = bracket ("Math.asin" ++ bracket x)
jsACosine x = bracket ("Math.acos" ++ bracket x)
jsATan x = bracket ("Math.atan" ++ bracket x)

jsSineh x = bracket ("Math.sinh" ++ bracket x)
jsCosineh x = bracket ("Math.cosh" ++ bracket x)
jsTanh x = bracket ("Math.tanh" ++ bracket x)

jsASineh x = bracket ("Math.asinh" ++ bracket x)
jsACosineh x = bracket ("Math.acosh" ++ bracket x)
jsATanh x = bracket ("Math.atanh" ++ bracket x)
