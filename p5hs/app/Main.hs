{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified System.Process as Process
import Turtle
import qualified Sound.Tidal.Context
import System.Environment
import System.Exit

startTidal = do
    putStr "\n ---------- \n"
    putStr "\"stack exec ghci\" running from the path: "
    pwd
    putStr "\n ---------- \n"
    let supercollider = (Process.proc "sclang" ["app/initScripts/startup.scd"])
            { Process.std_in  = Process.Inherit
            , Process.std_out = Process.Inherit
            , Process.std_err = Process.Inherit
            , Process.create_new_console = True
            , Process.delegate_ctlc = True
            }
    let tidal = (Process.proc "ghci" [])
            { Process.std_in  = Process.Inherit
            , Process.std_out = Process.Inherit
            , Process.std_err = Process.Inherit
            , Process.delegate_ctlc = True
            }
    s@(scIn, scOut,scErr,scDel) <- Process.createProcess supercollider
    t@(_, _, _, tDel) <- Process.createProcess tidal
    Process.waitForProcess tDel
    Process.cleanupProcess s
    Process.cleanupProcess t

startSupercollider = do
    let startup = "TODO"
    putStr "\n ---------- \n"
    putStr "\"sclang\" running from the path: "
    pwd
    putStr "\n with startup file:"
    putStr startup
    putStr "\n ---------- \n"

main = startTidal

main_ = do
  args <- getArgs
  parse args

main__ = getArgs >>= parse >>= putStr . tac

tac  = unlines . reverse . lines

parse ["-h"] = usage   >> exit_
parse ["-v"] = version >> exit_
parse []     = getContents
parse fs     = concat `fmap` mapM readFile fs

usage   = putStrLn "Usage: p5jsDirt [-options]"
version = putStrLn "p5jsDirt version 0.0.1"
exit_    = exitWith ExitSuccess
die     = exitWith (ExitFailure 1)
