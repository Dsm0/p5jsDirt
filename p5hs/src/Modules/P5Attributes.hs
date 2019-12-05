module Modules.P5Attributes where

import P5Render
import P5Expressions

data Attribute a
  = EllipseMode (ArgEx a)
  | NoSmooth
  | RectMode (ArgEx a)
  | Smooth
  | StrokeCap (ArgEx a)
  | StrokeJoin (ArgEx a)
  | StrokeWeight (ArgEx a)
  deriving(Eq,Show)


instance (Renderer a) => Renderer (Attribute a) where
  render (EllipseMode x) = "ellipseMode(" ++ arg ++ ")"
    where arg = render x
  render (NoSmooth) = "noSmooth()"
  render (RectMode x) = "rectMode(" ++ arg ++ ")"
    where arg = render x
  render (Smooth) = "smooth()"
  render (StrokeCap x) = "strokeCap(" ++ arg ++ ")"
    where arg = render x
  render (StrokeJoin x) = "strokeJoin(" ++ arg ++ ")"
    where arg = render x
  render (StrokeWeight x) = "strokeWeight(" ++ arg ++ ")"
    where arg = render x
