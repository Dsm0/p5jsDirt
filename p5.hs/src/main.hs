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

import Control.Monad.Writer (Writer(..), runWriter, tell, MonadWriter(..))

main = putStrLn "hello"

p5Func = toList

func = p5Func $ do
  line 2 2 40 500
  translate 2 3 4
  plane 2 3 4 5

k =[line y (y*2) (y*y) (y*y*y) | y <- map makeValue [0..20]]


-- liftM f m = m >>= (\x -> return (f x))

l = ArgEx 2.0 (show 2)
m = ArgEx 0.0 (show FrameCount)
