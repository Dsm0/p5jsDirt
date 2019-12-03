:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""
import P5FunctionSend
import Sound.Tidal.Context


:{
let p5jsTarget :: OSCTarget
    p5jsTarget = superdirtTarget {oName = "processing",
                                oAddress = "127.0.0.1", oPort = 57130,
                                oLatency = 0.1,
                                oTimestamp = MessageStamp
                               }
:}

import Data.List

:{
tidal <- startMulti
          [
          superdirtTarget {oLatency = 0.1, oAddress = "127.0.0.1", oPort = 57120}
            ,
            p5jsTarget
              ]
         (defaultConfig {cFrameTimespan = 1/20})
:}

import qualified Data.Map.Strict as Map

:{
let p = streamReplace tidal
    hush = streamHush tidal
    list = streamList tidal
    mute = streamMute tidal
    unmute = streamUnmute tidal
    solo = streamSolo tidal
    unsolo = streamUnsolo tidal
    once = streamOnce tidal
    asap = once
    nudgeAll = streamNudgeAll tidal
    all = streamAll tidal
    resetCycles = streamResetCycles tidal
    setcps = asap . cps
    xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
    wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
    jump i = transition tidal True (Sound.Tidal.Transition.jump) i
    jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
    mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
    interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
    clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
    d1 = p 1 . (|< orbit 0)
    d2 = p 2 . (|< orbit 1)
    d3 = p 3 . (|< orbit 2)
    d4 = p 4 . (|< orbit 3)
    d5 = p 5 . (|< orbit 4)
    d6 = p 6 . (|< orbit 5)
    d7 = p 7 . (|< orbit 6)
    d8 = p 8 . (|< orbit 7)
    d9 = p 9 . (|< orbit 8)
    d10 = p 10 . (|< orbit 9)
    d11 = p 11 . (|< orbit 10)
    d12 = p 12 . (|< orbit 11)
    d13 = p 13
    d14 = p 14
    d15 = p 15
    d16 = p 16
:}


:{
let setI = streamSetI tidal
    setF = streamSetF tidal
    setS = streamSetS tidal
    setR = streamSetI tidal
    setB = streamSetB tidal
:}

:{
    -- FUNCTIONS TO INTERFACE WITH P5DIRT

-- let sendFunc' = (streamFirst tidal) . makeFunc
--     sendFunc = sendFunc' . render
--     resetFunc = sendFunc' ""
--     makeFakeMap x = Map.fromList [("func",VS x)]
--     toEvent' ws we ps pe v = Event (Just $ Sound.Tidal.Context.Arc ws we) (Sound.Tidal.Context.Arc ps pe) v
--       where [ws',we',ps',pe'] = map toRational [ws,we,ps,pe]
--     makeFunc x = Pattern $ fakeEvent (makeFakeMap x :: ControlMap)
--       where fakeEvent a y = [(toEvent' 0 1 0 1) a]
--     draw = sendFunc
--     var = makeJSVar
--     tP = makeTidalParam

-- let toEvent' ws we ps pe v = Event (Just $ Sound.Tidal.Context.Arc ws we) (Sound.Tidal.Context.Arc ps pe) v
--       where [ws',we',ps',pe'] = map toRational [ws,we,ps,pe]
--     makeFakeMap x y = Map_.fromList [("funcSliceNumber", VI x),("func",VS y)]
--     makeFuncHelp :: Int -> JavaScript -> ControlPattern
--     makeFuncHelp x y = Pattern $ fakeEvent (makeFakeMap x y:: ControlMap)
--       where fakeEvent a notARealArgument = [(toEvent' 0 1 0 1) a]
--     makeFunc :: JavaScript -> [ControlPattern]
--     makeFunc x = [makeFuncHelp 1 x]
--     -- makeFunc x
--     --   | (length x) > 1000 = funcSectionizer $ splitEvery 10000 x
--     --   | otherwise         = [makeFuncHelp x]
--       -- where funcSectionizer longFunc = map (\(x,y) -> makeFuncHelp x y) $ zip [0..] longFunc
--     sendFunc' = mapM_ (streamFirst tidal) . makeFunc
--     sendFunc = sendFunc' . render
--     resetFunc = sendFunc' ""
--     draw = sendFunc
let draw = makeDraw tidal
    load = makeLoad tidal
    createImg = makeImage tidal

:}

:set prompt "tidal> "
