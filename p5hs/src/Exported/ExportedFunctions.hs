{-# LANGUAGE FlexibleContexts #-}
module Exported.ExportedFunctions where

import P5Expressions
import P5Funcs
import Modules.P5Transform
import Modules.P5Shapes
import Modules.P53D
import Modules.P5ModuleList
import Modules.DebugFuncs
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

consoleLog x = pack (ConsoleLog (makeJSVar x) :: Debug ArgExD)
