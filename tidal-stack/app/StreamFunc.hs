{-# LANGUAGE ConstraintKinds, GeneralizedNewtypeDeriving, FlexibleContexts, ScopedTypeVariables, BangPatterns #-}

import Sound.OSC.FD as O
import qualified Control.Exception as E
import Sound.Tidal.Stream
import Control.Concurrent.MVar (readMVar, takeMVar, putMVar)
import qualified Sound.Tidal.Tempo as T
import qualified Data.Map.Strict as Map
import           Data.Maybe (fromJust, fromMaybe, isJust, catMaybes)

import Sound.Tidal.Pattern

-- really helpful post:
-- https://stackoverflow.com/questions/14617815/different-types-in-case-expression-result-in-haskell

-- need to set:
-- :set -package hosc
-- :set -package containers


-- work on datatype that lets you send either a string or a control Pattern
data MaybeControlPattern a where
  DefinatelyControlPattern :: DefinatelyControlPattern ControlPattern
  P5Function :: String

streamFirst' :: Stream -> MaybeControlPattern -> IO ()
streamFirst' st (P5Function p)
  = do sMap <- readMVar (sInput st)
       tempo <- readMVar (sTempoMV st)
       now <- O.time
       mapM_ (\(Cx target udp) ->
                 E.catch (mapM_ (send target (oLatency target) udp) ((toMessage p) target))
                 (\(e ::E.SomeException)
                   -> putStrLn $ "Failed to send. Is the '" ++ oName target ++ "' target running? " ++ show e
                 )
             ) (sCxs st)
       -- mapM_ (doCps $ sTempoMV st) cpsChanges
       return ()

-- TODO!!!
-- figure out how to send plain strings over tidalcycles udp connections
-- ones that encapsulate javascript functions

-- original implementation of streamFirst
-- streamFirst' :: Stream -> MaybeControlPattern -> IO ()
streamFirst' st (p :: ControlPattern)
  = do sMap <- readMVar (sInput st)
       tempo <- readMVar (sTempoMV st)
       now <- O.time
       let fakeTempo = T.Tempo {T.cps = T.cps tempo,
                                T.atCycle = 0,
                                T.atTime = now,
                                T.paused = False,
                                T.nudged = 0
                               }
           sMap' = Map.insert "_cps" (pure $ VF $ T.cps tempo) sMap
           es = filter eventHasOnset $ query p (State {arc = (Arc 0 1),
                                                       controls = sMap'
                                                      }
                                               )
           -- there should always be a whole (due to the eventHasOnset filter)
           at e = sched fakeTempo $ start $ wholeOrPart e
           -- there should always be a whole (due to the eventHasOnset filter)
           on e = sched tempo $ start $ wholeOrPart e
           cpsChanges = map (\e -> (on e - now, Map.lookup "cps" $ value e)) es
           config = sConfig st
           messages target =
             catMaybes $ map (\e -> do m <- toMessage config (at e + (oLatency target)) target fakeTempo e
                                       return $ (at e, m)
                             ) es
       mapM_ (\(Cx target udp) ->
                 E.catch (mapM_ (send target (oLatency target) udp) (messages target))
                 (\(e ::E.SomeException)
                   -> putStrLn $ "Failed to send. Is the '" ++ oName target ++ "' target running? " ++ show e
                 )
             ) (sCxs st)
       mapM_ (doCps $ sTempoMV st) cpsChanges
       return ()
