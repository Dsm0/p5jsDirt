module Modules.P5Text where

import P5Expressions
import P5Render

data P5Text a
 = TextAlign (ArgEx a)
 | TextLeading (ArgEx a)
 | TextSize (ArgEx a)
 | TextStyle (ArgEx a)
 | TextWidth (ArgEx a) -- doesnt set the width of text, gets the width of a character
 | TextAscent
 -- ^^^
 -- Returns the ascent of the current font at its current size.
 -- The ascent represents the distance, in pixels, of the tallest character above the baseline.
 | TextDescent
 -- ^^^
 -- Similar, but gets the decent of characters
 | Text (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a) (ArgEx a)
 | TextFont (ArgEx a)
 -- | LoadFont (ArgEx a)
 -- loadfont isn't currently implemented because loadFont is called in the setup function,
 -- not the draw function
 deriving(Eq,Show)


instance (Renderer a) => Renderer (P5Text a) where
  render (TextAlign x) = "textAlign(" ++ render x ++ ");"
  render (TextLeading x) = "textLeading(" ++ render x ++ ");"
  render (TextSize x) = "textSize(" ++ render x ++ ");"
  render (TextStyle x) = "textStyle(" ++ render x ++ ");"
  render (TextWidth x) = "textWidth(" ++ render x ++ ");"
  render TextAscent = "textAscent();"
  render TextDescent = "textDescent();"
  render (Text w x y z a) = "text(" ++ textArgs ++ ");"
    where textArgs = betweenBrackets [w,x,y,z,a]
  render (TextFont x) = "textFont(" ++ render x ++ ");"
