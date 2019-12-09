module UsefulFuncs where

import P5Expressions
import HigherOrder.P5Bool
import Exported.ExportedFunctions
import Exported.ExportedVariables

translateX x = translate x 0 0
translateY y = translate 0 y 0
translateZ z = translate 0 0 z
osc = sin frameCount
lfo' x = sin ((frameCount) * (makeValue (0.0001 * x)))
inrange i' maxi = foriInRange 0 (i' #<= maxi) 1
(//) :: Integral a => a -> a -> a
(//) = div
