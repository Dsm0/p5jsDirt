{-# LANGUAGE FlexibleContexts #-}
module Exported.ExportedFunctions where

import P5Expressions
import P5Funcs

import Modules.P5Transform
import Modules.P5Shapes
import Modules.P53D
import Modules.P5Color
import Modules.DebugFuncs
import Modules.P5Structure
import Modules.P5Setting

import P5Enviornment
import P5Render
import ListWriter

pack x = element . RenderAble $ Func x

point x y = pack (Point x y :: Shape ArgExD)
line w x y z = pack (Line w x y z :: Shape ArgExD)
rect w x y z = pack (Rect w x y z :: Shape ArgExD)
ellipse w x y z = pack (Ellipse  w x y z :: Shape ArgExD)
circle  x y r = pack (Ellipse (x - r) (y - r) (x + r) (y + r) :: Shape ArgExD)
triangle w x y z a b = pack (Triangle w x y z a b :: Shape ArgExD)
quad w x y z a b c d  = pack (Quad w x y z a b c d :: Shape ArgExD)
ngon x y n   = pack (NGon x y n :: Shape ArgExD)
arc w x y z start stop = pack (Arc w x y z start stop :: Shape ArgExD)
customShape xys = pack (CustomShape xys :: Shape ArgExD)

plane w x y z = pack (Plane w x y z :: DDDObject ArgExD)
sphere x y z  = pack (Sphere x y z :: DDDObject ArgExD)
box w x y z a = pack (Box  w x y z a :: DDDObject ArgExD)
cylinder w x y z a b = pack (Cylinder  w x y z a b :: DDDObject ArgExD)
cone w x y z a b = pack (Cone  w x y z a b :: DDDObject ArgExD)
ellipsoid w x y z a b c d = pack (Ellipsoid  w x y z a b c d :: DDDObject ArgExD)
torus x y z = pack (Torus x y z :: DDDObject ArgExD)

applymatrix x = pack (ApplyMatrix x :: Transform ArgExDList)
resetmatrix = pack (ResetMatrix :: Transform ArgExD)
rotateX x = pack (RotateX x :: Transform ArgExD)
rotate = rotateX
rotateY x = pack (RotateY x :: Transform ArgExD)
rotateZ x = pack (RotateZ x :: Transform ArgExD)
scale x y z = pack (Scale x y z :: Transform ArgExD)
shearX x = pack (ShearX x :: Transform ArgExD)
shearY x = pack (ShearY x :: Transform ArgExD)
translate x y z = pack (Translate x y z :: Transform ArgExD)

alpha x = pack ( Alpha x :: Color ArgExD)
blue x = pack ( Blue x :: Color ArgExD)
brightness x = pack ( Brightness x :: Color ArgExD)
color x y z = pack ( Color x y z:: Color ArgExD)
green x = pack ( Green x :: Color ArgExD)
hue x = pack ( Hue x :: Color ArgExD)
-- lerpColor x = pack ( LerpColor x :: Color ArgExD)
lightness x = pack ( Lightness x :: Color ArgExD)
red x = pack ( Red x :: Color ArgExD)
saturation x = pack ( Saturation x :: Color ArgExD)

background x y z = pack (Background x y z :: Setting ArgExD)
clear = pack (Clear :: Setting ArgExD)
colorMode x y = pack (ColorMode x y :: Setting ArgExD)
fill x y z = pack (Fill x y z :: Setting ArgExD)
noFill = pack (NoFill :: Setting ArgExD)
stroke x y z = pack (Stroke x y z :: Setting ArgExD)
noStroke = pack (NoStroke :: Setting ArgExD)
erase x y = pack (Erase x y :: Setting ArgExD)
noErase x = pack (NoErase :: Setting ArgExD)

consoleLog x = pack (ConsoleLog (makeJSVar x) :: Debug ArgExD)


push             = pack (Push :: Structure)
pop              = pack (Pop :: Structure)
