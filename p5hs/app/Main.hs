{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import qualified System.Process as Process
import Turtle
import qualified Sound.Tidal.Context

main = do
    putStr "\n ---------- \n"
    putStr "\"stack exec ghci\" running from the path: "
    putStr "\n ---------- \n"
    pwd
    let cp = (Process.proc "stack" ["ghci"])
            { Process.std_in  = Process.Inherit
            , Process.std_out = Process.Inherit
            , Process.std_err = Process.Inherit
            , Process.delegate_ctlc = True
            }
    (_, _, _, ph) <- Process.createProcess cp
    Process.waitForProcess ph
