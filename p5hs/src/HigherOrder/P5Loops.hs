module HigherOrder.P5Loops where

-- import P5Enviornment
import P5Expressions
import P5Render
import ListWriter
import P5JSRenderFuncs
import Data.Fixed
import HigherOrder.P5Bool

data P5Loop a
  = DoWhile (P5BoolConstructor a) (ListM RenderAble)
  | ForIInRange (ArgEx a) (P5BoolConstructor a) (ArgEx a) (ListM RenderAble)
  deriving(Eq,Show)

instance (Renderer a) => Renderer (P5Loop a) where
  render (DoWhile bool listM) = "while (" ++ render bool ++ "){\n" ++ render listM ++ "}"
  render (ForIInRange i maxi stepi listM) =
        "for( i = " ++ render i ++ ";" ++ render maxi ++ " ; i = i + " ++ render stepi ++ ")\
        \{\n" ++ render listM ++ "}"
