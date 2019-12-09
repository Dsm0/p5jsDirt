module Modules.P5Transform where

import P5Expressions
import P5Render

import Data.Matrix

data Transform a = ApplyMatrix ([[ArgEx a]])
                 | ResetMatrix
                 | RotateX (ArgEx a)
                 | RotateY (ArgEx a)
                 | RotateZ (ArgEx a)
                 | Scale (ArgEx a) (ArgEx a) (ArgEx a)
                 | ShearX (ArgEx a)
                 | ShearY (ArgEx a)
                 | Translate (ArgEx a) (ArgEx a) (ArgEx a)
                 deriving(Show,Eq)

-- Implement matrix transformations
-- add integration for lists

instance (Show a, Renderer a) => Renderer (Transform a) where
-- render([[Matrix]])
  render (ApplyMatrix x) = "applyMatrix(" ++ args ++ ");"
    where args = listBetweenBrackets x
  render ResetMatrix = "resetMatrix();"
-- rotateX(degrees)
  render (RotateX x) = "rotateX(" ++ args ++ ");"
    where args = betweenBrackets [x]
-- rotateY(degrees)
  render (RotateY x) = "rotateY(" ++ args ++ ");"
    where args = betweenBrackets [x]
-- rotateZ(degrees)
  render (RotateZ x) = "rotateZ(" ++ args ++ ");"
    where args = betweenBrackets [x]
-- scale(s, [y], [z])
  render (Scale x y z) = "scale(" ++ args ++ ");"
    where args = betweenBrackets $ [x,y,z]
-- shearX(shearDegree)
  render (ShearX x) = "shearX(" ++ args ++ ");"
    where args = betweenBrackets [x]
-- shearX(shearDegree)
  render (ShearY x) = "shearY(" ++ args ++ ");"
    where args = betweenBrackets [x]
  render (Translate x y z) = "translate(" ++ args ++ ");"
    where args = betweenBrackets [x,y,z]
