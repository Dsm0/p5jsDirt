{-# LANGUAGE FlexibleContexts, TemplateHaskell, ScopedTypeVariables #-}

module Modules.P5ModuleList where

import P5Expressions
import P5Render
import Control.Applicative



-- data Ay a
--            = Point (ArgEx a) (ArgEx a)
--            | Line (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Rect (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Ellipse (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Triangle (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Quad (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | NGon (ArgEx a) (ArgEx a) (ArgEx a) -- X X N mberOfSides
--            | Arc (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | CustomShape [((ArgEx a),(ArgEx a))]
--            | Plane (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Box (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Sphere (ArgEx a) (ArgEx a) (ArgEx a)
--            | Cylinder (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Cone (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Ellipsoid (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
--            | Torus (ArgEx a) (ArgEx a) (ArgEx a) -- X X N mberOfSides
--            deriving(Eq,Show)


-- instance (Renderer a , Show a) => Renderer (Ay a) where
--   render (Point x y) = "point(" ++ args ++ ");"
--     where args = betweenBrackets [x,y]
--   render (Line w x y z) = "line(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z]
--   render (Rect w x y z) = "rect(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z]
--   render (Quad w x y z a b c d) = "quad(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z]
--   render (Ellipse w x y z) = "ellipse(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z]
--   render (Triangle w x y z a b) = "triangle(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,a,b]
--   render (Arc w x y z start stop) = "arc(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,start,stop]
--   render (NGon x y r) = "ellipse(" ++ args ++ ");"
--     where args = betweenBrackets [x,y,r] -- ++ "," ++ (show r)
--   render (CustomShape xys) = foldr (\xy xys-> "vertex(" ++ (args xy) ++ "); \n" ++ xys) "" xys
--     where args (x,y) = (show x) ++ "," ++ (show y)
-- -- plane([width], [height], [detailX], [detailY])
--   render (Plane w x y z) = "plane(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z]
-- -- box([width], [Height], [depth], [detailX], [detailY])
--   render (Box w x y z a) = "box(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,a]
-- -- sphere([radius], [detailX], [detailY])
--   render (Sphere x y z) = "sphere(" ++ args ++ ");"
--     where args = betweenBrackets [x,y,z]
-- -- cylinder([radius], [height], [detailX], [detailY], [bottomCap], [topCap])
--   render (Cylinder w x y z a b) = "cylinder(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,a,b]
-- -- cone([radius], [height], [detailX], [detailY], [cap])
--   render (Cone w x y z a b) = "cone(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,a,b]
-- -- ellipsoid([radiusx], [radiusy], [radiusz], [detailX], [detailY])
--   render (Ellipsoid w x y z a b c d) = "ellipsoid(" ++ args ++ ");"
--     where args = betweenBrackets [w,x,y,z,a,b,c,d]
-- -- torus([radius], [tubeRadius], [detailX], [detailY])
--   render (Torus x y z) = "torus(" ++ args ++ ");"
--     where args = betweenBrackets [x,y,z]
