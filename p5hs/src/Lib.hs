{-# LANGUAGE FlexibleInstances, FlexibleContexts #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE Trustworthy #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE DeriveFunctor #-}

module Lib where

import Data.List
import Text.Printf
import Data.Typeable
import Data.List.Split

import Modules.P5Transform
import Modules.P5Shapes
import Modules.P53D
import Modules.P5Color
import Modules.DebugFuncs
import Modules.P5Structure
import Modules.P5Setting
import Modules.P5Text
import Modules.P5Image
import Modules.P5Attributes

import P5Enviornment
import P5FunctionSend
import P5Expressions
import P5Render
import P5JSRenderFuncs
import P5Funcs
import P5Audio
import qualified Data.Map as Map_
import Exported.ExportedFunctions
import Exported.ExportedVariables
import ListWriter
import Turtle

import HigherOrder.P5Bool
import HigherOrder.P5Loops

import UsefulFuncs

import Sound.Tidal.Context

import Control.Monad.Writer (Writer(..), runWriter, tell, MonadWriter(..))

prettyRender :: (Renderer a) => a -> IO ()
prettyRender = putStrLn . render
