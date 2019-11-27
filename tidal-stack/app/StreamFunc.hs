{-# LANGUAGE ConstraintKinds, GeneralizedNewtypeDeriving, FlexibleContexts, ScopedTypeVariables, BlockArguments, BangPatterns #-}

import Sound.OSC.FD as O hiding (Time)
import qualified Control.Exception as E
import Sound.Tidal.Stream
import Control.Concurrent.MVar (readMVar, takeMVar, putMVar)
import qualified Sound.Tidal.Tempo as T
import qualified Data.Map.Strict as Map
import           Data.Maybe (fromJust, fromMaybe, isJust, catMaybes)

import Sound.Tidal.Pattern

-- type Time = Sound.Tidal.Pattern.Time
-- type Time = Rational
-- really helpful post:
-- https://stackoverflow.com/questions/14617815/different-types-in-case-expression-result-in-haskell

streamFirst' st p -- (p :: ControlPattern)
  = do sMap <- readMVar (sInput st)
       tempo <- readMVar (sTempoMV st)
       now <- O.time
       let fakeTempo = T.Tempo {T.cps = T.cps tempo,
                                T.atCycle = 0,
                                T.atTime = now,
                                T.paused = False,
                                T.nudged = 0
                               }
           sMap' =  Map.insert "_cps" (pure $ VF $ T.cps tempo) sMap
           -- fakeEvent a = [(t
           es = query p (State {arc = (Arc 0 1), controls = sMap'} )
           -- ^^ es = events
           at e = sched fakeTempo $ start $ wholeOrPart e
           -- there should always be a whole (due to the eventHasOnset filter)
           on e = sched tempo $ start $ wholeOrPart e
           cpsChanges = map (\e -> (on e - now, Map.lookup "cps" $ value e)) es
           config = sConfig st
           messages target =
             catMaybes $ map (\e -> do m <- toMessage config (at e + (oLatency target)) target fakeTempo e
                                       return $ (at e, m)
                             ) es
       -- putStrLn $ show sMap'
       -- putStrLn $ show $ ( . query)p
       -- putStrLn $ show es
       mapM_ (\(Cx target udp) ->
                 E.catch (mapM_ (send target (oLatency target) udp) (messages target))
                 (\(e ::E.SomeException)
                   -> putStrLn $ "Failed to send. Is the '" ++ oName target ++ "' target running? " ++ show e
                 )
             ) (sCxs st)
       mapM_ (doCps $ sTempoMV st) cpsChanges
       return ()

streamFirst'' st p -- (p :: ControlPattern)
  = do sMap <- readMVar (sInput st)
       tempo <- readMVar (sTempoMV st)
       now <- O.time
       let fakeTempo = T.Tempo {T.cps = T.cps tempo,
                                T.atCycle = 0,
                                T.atTime = now,
                                T.paused = False,
                                T.nudged = 0
                               }
           sMap' =  Map.insert "_cps" (pure $ VF $ T.cps tempo) sMap
           -- sMap' =  sMap
           es = query p (State {arc = (Arc 0 1), controls = sMap'} )
           at e = sched fakeTempo $ start $ wholeOrPart e
           -- there should always be a whole (due to the eventHasOnset filter)
           on e = sched tempo $ start $ wholeOrPart e
           cpsChanges = map (\e -> (on e - now, Map.lookup "cps" $ value e)) es
           config = sConfig st
           messages target =
             catMaybes $ map (\e -> do m <- toMessage config (at e + (oLatency target)) target fakeTempo e
                                       return $ (at e, m)
                             ) es
       -- putStrLn $ show sMap'
       -- putStrLn $ show $ ( . query)p
       putStrLn $ show es
       mapM_ (\(Cx target udp) ->
                 E.catch (mapM_ (send target (oLatency target) udp) (messages target))
                 (\(e ::E.SomeException)
                   -> putStrLn $ "Failed to send. Is the '" ++ oName target ++ "' target running? " ++ show e
                 )
             ) (sCxs st)
       mapM_ (doCps $ sTempoMV st) cpsChanges
       return ()
