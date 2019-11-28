-- Enviornment Variables ::::::
{-# LANGUAGE FlexibleContexts #-}

import P5Expressions

makeJSVar b = ArgEx (0 :: Double) (show b)

tidalParamString x = "message.get(" ++ (show x) ++ ")"
makeTidalParam a = ArgEx (0 :: Double) (tidalParamString a)

frameCount       = makeJSVar FrameCount
deltaTime        = makeJSVar DeltaTime
focused          = makeJSVar Focused
cursor           = makeJSVar Cursor
frameRate        = makeJSVar FrameRate
noCursor         = makeJSVar NoCursor
displayWidth     = makeJSVar DisplayWidth
displayHeight    = makeJSVar DisplayHeight
windowWidth      = makeJSVar WindowWidth
windowHeight     = makeJSVar WindowHeight
windowResized    = makeJSVar WindowResized
width            = makeJSVar Width
height           = makeJSVar Height
fullscreen       = makeJSVar Fullscreen
pixelDensity     = makeJSVar PixelDensity
displayDensity   = makeJSVar DisplayDensity
getURL           = makeJSVar GetURL
getURLPath       = makeJSVar GetURLPath
getURLParams     = makeJSVar GetURLParams

-- tidal Params
-- they all end with ' as to not overwrite the definitions used by tidalcycles
cps' = makeTidalParam "cps"
s' = makeTidalParam "s"
orbit' = makeTidalParam "orbit"
delta' = makeTidalParam "delta"
cycle' = makeTidalParam "cycle"

-- these are just some paramaters included in
-- nearly every tidal osc messag

-- you can defined your own with
-- tP param' = makeTidalParam "param"
