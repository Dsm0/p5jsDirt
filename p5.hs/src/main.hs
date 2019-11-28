{-# LANGUAGE FlexibleInstances, FlexibleContexts #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

module Main where

import Data.List
import Text.Printf
import Data.Typeable

import Modules.P5Shapes
import P5Enviornment
import P5Expressions
import P5Render
import P5JSRenderFuncs
import P5Funcs
import Modules.ExportedFunctions
import Modules.P5Transform
import Modules.P5ModuleList
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
