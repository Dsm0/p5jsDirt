:set -XOverloadedStrings
:set prompt ""
:set prompt-cont ""

import Sound.Tidal.Context

:{
p5jsTarget :: OSCTarget
p5jsTarget = superdirtTarget {
                                oName = "processing",
                                oAddress = "127.0.0.1",
                                oPort = 57130,
                                oLatency = 0.1,
                                oTimestamp = MessageStamp
                              }
:}

:{
tidal <- startMulti
      [p5jsTarget]
     (defaultConfig {cFrameTimespan = 1/20})
:}

:set prompt "test> "
