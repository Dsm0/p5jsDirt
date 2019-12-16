{-# LANGUAGE FlexibleContexts, AllowAmbiguousTypes #-}

module Exported.ExportedVariables where

import P5Expressions
import P5Render
import P5Enviornment
import P5Audio

-- Enviornment Variables ::::::

frameCount :: Num a => ArgEx a
-- frameCountD      = makeJSVar FrameCount :: ArgEx ArgExD
-- frameCountI      = makeJSVar FrameCount :: ArgEx ArgExI
frameCount      = makeJSVar FrameCount -- :: Num a => ArgEx a
-- frameCount       = frameCountD

deltaTime  :: Num a => ArgEx a
deltaTime        = makeJSVar DeltaTime
focused  :: Num a => ArgEx a
focused          = makeJSVar Focused
cursor  :: Num a => ArgEx a
cursor           = makeJSVar Cursor
frameRate  :: Num a => ArgEx a
frameRate        = makeJSVar FrameRate
noCursor  :: Num a => ArgEx a
noCursor         = makeJSVar NoCursor
displayWidth  :: Num a => ArgEx a
displayWidth     = makeJSVar DisplayWidth
displayHeight  :: Num a => ArgEx a
displayHeight    = makeJSVar DisplayHeight
windowWidth  :: Num a => ArgEx a
windowWidth      = makeJSVar WindowWidth
windowHeight  :: Num a => ArgEx a
windowHeight     = makeJSVar WindowHeight
windowResized  :: Num a => ArgEx a
windowResized    = makeJSVar WindowResized
width  :: Num a => ArgEx a
width            = makeJSVar Width
height  :: Num a => ArgEx a
height           = makeJSVar Height
fullscreen  :: Num a => ArgEx a
fullscreen       = makeJSVar Fullscreen
pixelDensity  :: Num a => ArgEx a
pixelDensity     = makeJSVar PixelDensity
displayDensity  :: Num a => ArgEx a
displayDensity   = makeJSVar DisplayDensity
getURL  :: Num a => ArgEx a
getURL           = makeJSVar GetURL
getURLPath  :: Num a => ArgEx a
getURLPath       = makeJSVar GetURLPath
getURLParams  :: Num a => ArgEx a
getURLParams     = makeJSVar GetURLParams
--
blank            = makeJSVar Blank :: Num a => ArgEx a
undefined'       = blank
--
radius :: Num a => ArgEx a
radius           =  makeJSVar Radius
center :: Num a => ArgEx a
center           =  makeJSVar Center
corner :: Num a => ArgEx a
corner           =  makeJSVar Corner
corners :: Num a => ArgEx a
corners          =  makeJSVar Corners
roundEdge :: Num a => ArgEx a
roundEdge        =  makeJSVar Round
square :: Num a => ArgEx a
square           =  makeJSVar Square
project :: Num a => ArgEx a
project          =  makeJSVar Project
milter :: Num a => ArgEx a
milter           =  makeJSVar Milter
bevel :: Num a => ArgEx a
bevel            =  makeJSVar Bevel
i :: Num a => ArgEx a
i                =  makeJSVar I


p5gain = makeJSVar' $ render (Gain :: AudioAttributes Integer)

-- initFFT:: ArgEx Integer
-- initFFT           = makeJSVar InitFFT

-- p5gain :: ArgEx Integer


-- tidal Params
-- they all end with ' as to not overwrite the definitions used by tidalcycles
cps' :: Num a => ArgEx a
cps' = makeTidalParam "cps" :: Num a => ArgEx a
s' :: Num a => ArgEx a
s' = makeTidalParam "s" :: Num a => ArgEx a
orbit' :: Num a => ArgEx a
orbit' = makeTidalParam "orbit" :: Num a => ArgEx a
delta' :: Num a => ArgEx a
delta' = makeTidalParam "delta" :: Num a => ArgEx a
cycle' :: Num a => ArgEx a
cycle' = makeTidalParam "cycle" :: Num a => ArgEx a
gain' ::  Num a => ArgEx a
gain' = makeTidalParam "gain" :: Num a => ArgEx a
pan' :: Num a => ArgEx a
pan' = makeTidalParam "pan" :: Num a => ArgEx a
begin' :: Num a => ArgEx a
begin' = makeTidalParam "begin" :: Num a => ArgEx a
-- these are just some paramaters included in
-- nearly every tidal osc messag

-- you can defined your own with
-- tP param' = makeTidalParam "param"
