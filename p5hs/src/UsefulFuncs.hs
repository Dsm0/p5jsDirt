module UsefulFuncs where

import P5Expressions
import Exported.ExportedFunctions
import Exported.ExportedVariables

translateX x = translate x 0 0
translateY y = translate 0 y 0
translateZ z = translate 0 0 z
osc = sin frameCount
lfo' x = sin ((frameCount) * (0.01 * x))
