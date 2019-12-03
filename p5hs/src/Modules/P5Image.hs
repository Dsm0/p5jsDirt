module Modules.P5Image where

import P5Render
import P5Expressions

data Image a
  = CreateImg (ArgEx a)
  | Image (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
  deriving(Eq,Show)


instance (Renderer a) => Renderer (Image a) where
  -- render (CreateImg imageURL) = "createImg(" ++ imageURLString ++ ");\n"
  --  -- ++ imageName ++".hide"
  --   where imageURLString = varFunc imageURL
  --         imageName = removePunc imageURLString
    -- basically removes punctuation from the url so that when you paste in
    -- an image url and assign it to a variable,
    -- you can also pass it to the image function
  render (Image imageURL y z a b) = "image(" ++ img ++ " , "++ args ++ ")"
    where args = betweenBrackets [y,z,a,b]
          img = "assets[\"images\"][\"" ++ removePunc (varFunc imageURL) ++ "\"]"


-- instance (Renderer a) => Renderer (Image a) where
--   render (CreateImage x) = "createImg(" ++ render x ++ ")"
