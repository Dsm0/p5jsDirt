module P5Enviornment where

data JSVar =
                            FrameCount
                          | DeltaTime
                          | Focused
                          | Cursor
                          | FrameRate
                          | NoCursor
                          | DisplayWidth
                          | DisplayHeight
                          | WindowWidth
                          | WindowHeight
                          | WindowResized
                          | Width
                          | Height
                          | Fullscreen
                          | PixelDensity
                          | DisplayDensity
                          | GetURL
                          | GetURLPath
                          | GetURLParams
                          | Radius
                          | Center
                          | Corner
                          | Corners
                          | Round
                          | Square
                          | Project
                          | Milter
                          | Bevel
                          | Blank
                          | I

instance Show JSVar where
  show FrameCount       =    "frameCount"
  show DeltaTime        =    "deltaTime"
  show Focused          =    "focused "
  show Cursor           =    "cursor()"
  show FrameRate        =    "frameRate()"
  show NoCursor         =    "noCursor()"
  show DisplayWidth     =    "displayWidth"
  show DisplayHeight    =    "displayHeight"
  show WindowWidth      =    "windowWidth"
  show WindowHeight     =    "windowHeight"
  show WindowResized    =    "windowResized()"
  show Width            =    "width"
  show Height           =    "height"
  show Fullscreen       =    "fullscreen()"
  show PixelDensity     =    "pixelDensity()"
  show DisplayDensity   =    "displayDensity()"
  show GetURL           =    "getURL()"
  show GetURLPath       =    "getURLPath()"
  show GetURLParams     =    "getURLParams()"
  show Blank            =    "undefined"
  show Radius           =    "RADIUS"
  show Center           =    "CENTER"
  show Corner           =    "CORNER"
  show Corners          =    "CORNERS"
  show Round            =    "ROUND"
  show Square           =    "SQUARE"
  show Project          =    "PROJECT"
  show Milter           =    "MILTER"
  show Bevel            =    "BEVEL"
  show I                =    "i"
