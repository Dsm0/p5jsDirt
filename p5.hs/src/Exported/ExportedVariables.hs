{-# LANGUAGE FlexibleContexts #-}

module Exported.ExportedVariables where

import P5Expressions
import P5Enviornment

-- Enviornment Variables ::::::


frameCount       = makeJSVar FrameCount :: ArgEx ArgExD
deltaTime        = makeJSVar DeltaTime  :: ArgEx ArgExD
focused          = makeJSVar Focused  :: ArgEx ArgExD
cursor           = makeJSVar Cursor  :: ArgEx ArgExD
frameRate        = makeJSVar FrameRate  :: ArgEx ArgExD
noCursor         = makeJSVar NoCursor  :: ArgEx ArgExD
displayWidth     = makeJSVar DisplayWidth  :: ArgEx ArgExD
displayHeight    = makeJSVar DisplayHeight  :: ArgEx ArgExD
windowWidth      = makeJSVar WindowWidth  :: ArgEx ArgExD
windowHeight     = makeJSVar WindowHeight  :: ArgEx ArgExD
windowResized    = makeJSVar WindowResized  :: ArgEx ArgExD
width            = makeJSVar Width  :: ArgEx ArgExD
height           = makeJSVar Height  :: ArgEx ArgExD
fullscreen       = makeJSVar Fullscreen  :: ArgEx ArgExD
pixelDensity     = makeJSVar PixelDensity  :: ArgEx ArgExD
displayDensity   = makeJSVar DisplayDensity  :: ArgEx ArgExD
getURL           = makeJSVar GetURL  :: ArgEx ArgExD
getURLPath       = makeJSVar GetURLPath  :: ArgEx ArgExD
getURLParams     = makeJSVar GetURLParams  :: ArgEx ArgExD

-- tidal Params
-- they all end with ' as to not overwrite the definitions used by tidalcycles
cps' = makeTidalParam "cps" :: ArgEx ArgExD
s' = makeTidalParam "s" :: ArgEx ArgExD
orbit' = makeTidalParam "orbit" :: ArgEx ArgExD
delta' = makeTidalParam "delta" :: ArgEx ArgExD
cycle' = makeTidalParam "cycle" :: ArgEx ArgExD

-- these are just some paramaters included in
-- nearly every tidal osc messag

-- you can defined your own with
-- tP param' = makeTidalParam "param"
