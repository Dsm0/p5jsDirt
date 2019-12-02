module Modules.P5Setting where

import P5Expressions
import P5Render

data Setting a
  = Background (ArgEx a) (ArgEx a) (ArgEx a)
  | Clear
  | ColorMode (ArgEx a) (ArgEx a)
  | Fill (ArgEx a) (ArgEx a) (ArgEx a) -- currently cannot take type (Color a) as an argument
  | NoFill
  | Stroke (ArgEx a) (ArgEx a) (ArgEx a)
  | NoStroke
  | Erase (ArgEx a) (ArgEx a)
  | NoErase
  deriving(Eq,Show)


instance (Show a, Renderer a) => Renderer (Setting a) where
  render (Background x y z) = "background(" ++ rgb ++ ");"
    where rgb = betweenBrackets [x,y,z]
  render (Clear) = "clear();"
  render (ColorMode x y) = "colorMode(" ++ mode ++ ");"
    where mode = betweenBrackets [x,y]
  render (Fill x y z) = "fill(" ++ rgb ++ ");"
    where rgb = betweenBrackets [x,y,z]
  render (NoFill) = "noFill();"
  render (Stroke x y z) = "stroke(" ++ rgb ++ ");"
    where rgb = betweenBrackets [x,y,z]
  render (NoStroke) = "noStroke();"
  render (Erase x y) = "erase(" ++ xy ++ ");"
    where xy = betweenBrackets [x,y]
  render (NoErase) = "noErase();"
