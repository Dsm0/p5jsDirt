{-# LANGUAGE FlexibleInstances #-}
module Modules.P53D where

import P5Expressions
import P5Render
-- import Control.Applicative


data DDDObject a
           = Plane (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Box (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Sphere (ArgEx a) (ArgEx a) (ArgEx a)
           | Cylinder (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Cone (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Ellipsoid (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
           | Torus (ArgEx a) (ArgEx a) (ArgEx a) -- X X N mberOfSides
           deriving(Eq,Show)



instance (Show a, Renderer a) => Renderer (DDDObject a) where
-- plane([width], [height], [detailX], [detailY])
  render (Plane w x y z) = "plane(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z]
-- box([width], [Height], [depth], [detailX], [detailY])
  render (Box w x y z a) = "box(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,a]
-- sphere([radius], [detailX], [detailY])
  render (Sphere x y z) = "sphere(" ++ args ++ ");"
    where args = betweenBrackets [x,y,z]
-- cylinder([radius], [height], [detailX], [detailY], [bottomCap], [topCap])
  render (Cylinder w x y z a b) = "cylinder(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,a,b]
-- cone([radius], [height], [detailX], [detailY], [cap])
  render (Cone w x y z a b) = "cone(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,a,b]
-- ellipsoid([radiusx], [radiusy], [radiusz], [detailX], [detailY])
  render (Ellipsoid w x y z a b c d) = "ellipsoid(" ++ args ++ ");"
    where args = betweenBrackets [w,x,y,z,a,b,c,d]
-- torus([radius], [tubeRadius], [detailX], [detailY])
  render (Torus x y z) = "torus(" ++ args ++ ");"
    where args = betweenBrackets [x,y,z]
  -- render (Triangle w x y z a b) = "triangle(" ++ args ++ ");"
  --   where args = betweenBrackets [w,x,y,z,a,b]
  -- render (Arc w x y z start stop) = "arc(" ++ args ++ ");"
  --   where args = betweenBrackets [w,x,y,z,start,stop]
  -- render (NGon x y r) = "ellipse(" ++ args ++ ");"
  --   where args = betweenBrackets [x,y,r] -- ++ "," ++ (show r)
  -- render (CustomShape xys) = foldr (\xy xys-> "vertex(" ++ (args xy) ++ "); \n" ++ xys) "" xys
  --   where args (x,y) = (show x) ++ "," ++ (show y)
