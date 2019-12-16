{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Exported.ExportedFunctions where

import P5Expressions
import P5Funcs
import P5Audio

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

import HigherOrder.P5Bool
import HigherOrder.P5Loops

import P5Enviornment
import P5Render
import ListWriter

pack x = element . RenderAble $ Func x

-- point :: Num a => x y = pack (Point x y :: Shape ArgExD)
-- line :: Num a => w x y z = pack (Line w x y z :: Shape ArgExD)
-- rect :: Num a => w x y z = pack (Rect w x y z :: Shape ArgExD)
-- ellipse :: Num a => w x y z = pack (Ellipse  w x y z :: Shape ArgExD)
-- circle :: Num a =>  x y r = pack (Ellipse (x - r) (y - r) (x + r) (y + r) :: Shape ArgExD)
-- triangle :: Num a => w x y z a b = pack (Triangle w x y z a b :: Shape ArgExD)
-- quad :: Num a => w x y z a b c d  = pack (Quad w x y z a b c d :: Shape ArgExD)
-- ngon :: Num a => x y n   = pack (NGon x y n :: Shape ArgExD)
-- arc :: Num a => w x y z start stop = pack (Arc w x y z start stop :: Shape ArgExD)
-- customShape :: Num a => xys = pack (CustomShape xys :: Shape ArgExD)

rect :: (Num a, Show a, Renderer a) =>  (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
rect w x y z = pack (Rect w x y z ) -- :: Shape (ArgEx a))
point x y = pack (Point x y :: Shape ArgExD)

line :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
line w x y z = pack (Line w x y z)
ellipse :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
ellipse w x y z = pack (Ellipse  w x y z)
circle :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
circle  x y r = pack (Ellipse (x - r) (y - r) (x + r) (y + r))
triangle :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
triangle w x y z a b = pack (Triangle w x y z a b)
quad' :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
quad' w x y z a b c d  = pack (Quad w x y z a b c d)
ngon :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
ngon x y n   = pack (NGon x y n)
arc :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
arc w x y z start stop = pack (Arc w x y z start stop)
customShape :: (Show a, Num a, Renderer a) => [(ArgEx a, ArgEx a)] -> ListM RenderAble
customShape xys = pack (CustomShape xys)

plane :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
plane w x y z = pack (Plane w x y z)
sphere :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
sphere x y z  = pack (Sphere x y z)
box :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
box w x y z a = pack (Box  w x y z a)
cylinder :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
cylinder w x y z a b = pack (Cylinder  w x y z a b)
cone :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
cone w x y z a b = pack (Cone w x y z a b)
ellipsoid :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
ellipsoid w x y z a b c d = pack (Ellipsoid  w x y z a b c d)
torus :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
torus x y z = pack (Torus x y z)

-- applymatrix :: (Show a, Num a, Renderer a) => (ArgEx [[a]]) -> ListM RenderAble
applymatrix x = pack (ApplyMatrix x)
resetmatrix :: ListM RenderAble
resetmatrix = pack (ResetMatrix :: (Num a, Show a) => Transform (ArgEx a))
rotateX :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
rotateX x = pack (RotateX x)
rotateY :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
rotateY x = pack (RotateY x)
rotateZ :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
rotateZ x = pack (RotateZ x)
rotate x = rotateX x
objScale :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
objScale x y z = pack (Scale x y z)
shearX :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
shearX x = pack (ShearX x)
shearY :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
shearY x = pack (ShearY x)
translate :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
translate x y z = pack (Translate x y z)

alpha :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
alpha x = pack ( Alpha x )
blue :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
blue x = pack ( Blue x )
brightness :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
brightness x = pack ( Brightness x )
color :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
color x y z = pack ( Color x y z)
green :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
green x = pack ( Green x )
hue :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
hue x = pack ( Hue x )
lightness :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
lightness x = pack ( Lightness x )
red :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
red x = pack ( Red x )
-- saturation :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
saturation x = pack ( Saturation x )

background :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
background x y z = pack (Background x y z)
clear :: (Show a, Num a, Renderer a) => ListM RenderAble
clear = pack (Clear :: Setting ArgExD)
colorMode :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> ListM RenderAble
colorMode x y = pack (ColorMode x y)
fill :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
fill x y z = pack (Fill x y z)
noFill :: (Show a, Num a, Renderer a) => ListM RenderAble
noFill = pack (NoFill :: Setting ArgExD)
stroke :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
stroke x y z = pack (Stroke x y z)
noStroke :: (Show a, Num a, Renderer a) => ListM RenderAble
noStroke = pack (NoStroke :: Setting ArgExD)
erase :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> ListM RenderAble
erase x y = pack (Erase x y)
noErase :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
noErase x = pack (NoErase :: Setting ArgExD)


textAlign :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textAlign x = pack (TextAlign x)
textLeading :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textLeading x = pack (TextLeading x)
textSize :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textSize x = pack (TextSize x)
textStyle :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textStyle x = pack (TextStyle x)
textWidth :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textWidth x = pack (TextWidth x)
textAscent :: (Show a, Num a, Renderer a) => ListM RenderAble
textAscent = pack (TextAscent :: (Num a) => P5Text (ArgEx a))
textDescent :: (Show a, Num a, Renderer a) => ListM RenderAble
textDescent = pack (TextDescent :: (Num a) => P5Text (ArgEx a))
text :: (Show a, Num a, Renderer a) => (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> (ArgEx a) -> ListM RenderAble
text w x y z a = pack (Text (makeJSVar w) x y z a)
textFont :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
textFont x = pack (TextFont x)


ellipseMode :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
ellipseMode x = pack (EllipseMode x)
noSmooth :: (Show a, Num a, Renderer a) => ListM RenderAble
noSmooth = pack (NoSmooth :: (Num a) => Attribute (ArgEx a))
rectMode :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
rectMode x = pack (RectMode x)
smooth :: (Show a, Num a, Renderer a) => ListM RenderAble
smooth = pack (Smooth :: (Num a) => Attribute (ArgEx a))
strokeCap :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
strokeCap x = pack (StrokeCap x)
strokeJoin :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
strokeJoin x = pack (StrokeJoin x)
strokeWeight :: (Show a, Num a, Renderer a) => (ArgEx a) -> ListM RenderAble
strokeWeight x = pack (StrokeWeight x)


initFFT = pack (InitFFT :: AudioAttributes Integer)
-- this definition for freqBin is a bit janky because I wanted audio related functions
-- to be in their own type, instead of just a function that composes something of type (ArgEx a)
freqBin x = makeJSVar' (render $ FreqBin x)

while' :: (Show a, Num a, Renderer a) => (P5BoolConstructor a) -> (ListM RenderAble) -> ListM RenderAble
-- (DoWhile x y :: P5Loop (P5BoolConstructor ArgExD))
while' x listm = pack (DoWhile x listm)
foriInRange x bool step listm = pack (ForIInRange x bool step listm)

-- createImage x = CreateImg (makeJSVar x) :: Image ArgExD
image x y z a b = pack (Image (makeJSVar x) y z a b :: Image ArgExD)

consoleLog x = pack (ConsoleLog (makeJSVar x) :: Debug ArgExD)

push             = pack (Push :: Structure)
pop              = pack (Pop :: Structure)
