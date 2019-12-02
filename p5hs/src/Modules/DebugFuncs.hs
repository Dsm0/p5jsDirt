{-# LANGUAGE FlexibleContexts #-}
module Modules.DebugFuncs where

import P5Expressions
import P5Funcs
import Modules.P5Transform
import Modules.P5Shapes
import Modules.P53D
import P5Enviornment
import P5Render
import ListWriter

data Debug a = ConsoleLog (ArgEx a)
                deriving(Show,Eq)

instance (Show a, Renderer a) => Renderer (Debug a) where
  render (ConsoleLog a) = "console.log(eval(" ++ logStr ++ "));"
    where logStr = varFunc a
