module Modules.P5Structure where

import P5Expressions
import P5Render

data Structure
  = Push
  | Pop
  deriving(Eq,Show)

instance Renderer Structure where
  render Push             =    "push()"
  render Pop              =    "pop()"
