module Modules.P5Color where

import P5Expressions
import P5Render

data Color a
  = Alpha (ArgEx a)
  | Blue (ArgEx a)
  | Brightness (ArgEx a)
  | Color (ArgEx a) (ArgEx a) (ArgEx a)
  | Green (ArgEx a)
  | Hue (ArgEx a)
  | LerpColor (Color a) (Color a) (ArgEx a)
  | Lightness (ArgEx a)
  | Red (ArgEx a)
  | Saturation (ArgEx a)
  deriving(Eq,Show)

instance (Show a, Renderer a) => Renderer (Color a) where
  render (Alpha x) = "alpha(" ++ render x ++ ");"
  render (Blue x) = "blue(" ++ render x ++ ");"
  render (Brightness x) = "brightness(" ++ render x ++ ");"
  render (Color x y z) = "color(" ++ rgb ++ ");"
    where rgb = betweenBrackets [x,y,z]
  render (Green x) = "green(" ++ render x ++ ");"
  render (Hue x) = "hue(" ++ render x ++ ");"
  render (LerpColor color1 color2 x) = "lerpColor(" ++ lcargs ++ ");"
    where lcargs = "(" ++ (render color1) ++ " ," ++ render color2 ++ " ," ++ render x ++ ")"
  render (Lightness x) = "lightness(" ++ render x ++ ");"
  render (Red x) = "red(" ++ render x ++ ");"
  render (Saturation x) = "saturation(" ++ render x ++ ");"
