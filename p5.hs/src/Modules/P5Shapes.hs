{-# LANGUAGE FlexibleContexts, FlexibleInstances, TemplateHaskell, ScopedTypeVariables #-}

module Modules.P5Shapes where

import P5Expressions
import P5Render
import Control.Applicative

data Shape a
           = Point (ArgEx a) (ArgEx a)
           | Line (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Rect (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Ellipse (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Triangle (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Quad (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | NGon (ArgEx a) (ArgEx a) (ArgEx a) -- X X N mberOfSides
           | Arc (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | CustomShape [((ArgEx a),(ArgEx a))]
           deriving(Eq,Show)

newtype Drawing a = Drawing [Shape a]
  deriving(Eq,Show)

drawing a = Drawing a

instance (Show a, Renderer a) => Renderer (Shape a) where
  render (Point x y) = "point(" ++ args ++ ");"
    where args = betweenBrackets [x,y]
  render (Line w x y z) = "line(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z]
  render (Rect w x y z) = "rect(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z]
  render (Quad w x y z a b c d) = "quad(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z]
  render (Ellipse w x y z) = "ellipse(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z]
  render (Triangle w x y z a b) = "triangle(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,a,b]
  render (Arc w x y z start stop) = "arc(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,start,stop]
  render (NGon x y r) = "ellipse(" ++ args ++ ");"
    where args = betweenBrackets [x,y,r] -- ++ "," ++ (show r)
  render (CustomShape xys) = foldr (\xy xys-> "vertex(" ++ (args xy) ++ "); \n" ++ xys) "" xys
    where args (x,y) = (show x) ++ "," ++ (show y)


{-
-- formerly :
-- instance (Renderer a , Show a) => Renderer (Shape a) where

-- but to render multiple different datatypes in the same p5Func expression,
-- I couldn't use a type constructor

-- I had to choose a type of number
-}
instance Renderer (Drawing Double) where
  render (Drawing shapes) = unlines $ map renderIndividual shapes
    where renderIndividual shape = "beginShape();\n" ++ (render shape) ++ "\nendShape();\n"
