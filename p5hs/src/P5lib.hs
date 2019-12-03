{-# LANGUAGE FlexibleInstances, FlexibleContexts #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

module P5lib where

import Data.List
import Text.Printf
import Data.Typeable
import Data.List.Split

import Modules.P5Shapes
import Modules.P5Structure
import Modules.P53D
import Modules.P5Color
import Modules.P5Transform
import Modules.P5Image
import Modules.P5Setting
import Modules.DebugFuncs

import P5Enviornment
import P5FunctionSend
import P5Expressions
import P5Render
import P5JSRenderFuncs
import P5Funcs
import qualified Data.Map as Map_
-- import Modules.ExportedFunctions
import Exported.ExportedFunctions
import Exported.ExportedVariables
-- import Modules.P5ModuleList
import ListWriter

import Sound.Tidal.Context

import Control.Monad.Writer (Writer(..), runWriter, tell, MonadWriter(..))

prettyRender :: (Renderer a) => a -> IO ()
prettyRender = putStrLn . render

func = do
  line 2 2 40 500
  func2 2 3 4
  listEnumToFunc k
  translate 2 3 4
  plane 3 4 5 4

func2 x y z = do
  translate x y z
  translate 20 33 478

-- main = putStrLn "hy"

k = [line y (y*2) (y*y) (y*y*y) | y <- map makeValue [0..20]]

-- k = applymatrix
