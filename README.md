# p5jsDirt
originally a 112 project

##NOTE:
I might touch this project again in the future, but `dependabot` was bugging me about library vulnerabilities.
I half hazardously updated some libs without testing just to get the notifications off my back.
I'm not sure what issues may rise, but I doubt they'd be catastrophic.

### Disclaimer ###
This code is janky as hell. I wrote it in late 2019 for a school project where the goal was to make things work asap. I've updated it here and there to stay up-to-date with p5.js and tidalcycles features, but I've done this with only my own use in mind. I'd be happy to answer any questions people have about it, but I'm not currently in a rush to overhaul and/or doccument it.

[![p5jsDirt Showcase](https://i.imgur.com/5Rxl45h.png)](https://youtu.be/3pytF2Q7dDA)
video-demo: https://youtu.be/3pytF2Q7dDA

This is an iteration of yaxu's (Alex Mclean's) https://github.com/yaxu/p5dirt done in p5.js, combined with a rudimentary port of p5.js to haskell, specifically to interface with tidalcycles.
So it's actually 2 projects in 1: p5jsDirt + p5hs

The functionality at this point is very basic. Anything programmed in p5hs is only meant to be executed inside the draw function. 

I have plans to add:  
  - implemetations for the rest p5.js' basic library
  - the ability to load images from urls on-the-fly
  - implementation of `for` and `while` loops to execute on the javascript-side
  - audio reactivity for visuals (instead of just reacting to tidal parameters)


Long-Term:
  - an atom plugin where images are displayed inside the ide (similar to https://atom.io/packages/atom-hydra)

Right now, if you want to get it up and running, feel free to email me at oj8856899@gmail.com. I'd be happy to help.
If there's enough interest in this project, ie. enough people want to get it running, I'll add more extensive doccumentation and installation instructions.

But keep in mind: from a usability standpoint, this is an early, early alpha.

Here's what you'll need to get this running:

###Dependencies::

- Tidalcycles - http://pages.tidalcycles.org/getting_started.html <- (follow this installation tutorial)  
tidalcycles includes:
    - haskell's stack tool - https://docs.haskellstack.org/en/stable/install_and_upgrade/
    - supercollider with superdirt - https://supercollider.github.io/download
    - Atom + atom-tidalcycles plugin (emacs works too, you just need something to interface with tidalcycles) - https://atom.io/

Node.js - https://nodejs.org/en/

to get running:
1 - install stack + node project dependencies
  - to install the necessary haskell files:  
    - open up a terminal  
    - go to the p5hs directory  
    - type `stack install`
  - to install the necessary javascript files:  
    - open up a terminal  
    - go to the p5jsDirt directory  
    - type `npm install`

2 - open up supercollider  
  - type `SuperDirt.start`  
  - and hit `Shift + Enter`        
  - this will boot the superDirt server
    
3 - open up a terminal window  
  - go to the p5jsDirt directory  
  - type `node .`
  - this will startup the p5jsDirt server that connects tidalcycles with your browser

4 - open up Atom  
  - find the settings for the `atom-tidalcycles` package
  - change the "Boot Tidal Path" to point to `p5jsDirt/p5hs/scripts/BootTidal.hs`
  - change the "Ghci Path" to point to `p5jsDirt/p5hs/scripts/ghci`

5 - open up a browser  
  - go to `localhost:8081`
  - you should see a white box in the center of the screen


If everything has gone smoothly, if you execute 
```
draw $ do
  text "hi" 0 0 blank blank
```
in tidalcycles, the word "hi" should appear in your browser


Inspiration/credits/stuff to check out:

https://github.com/tidalcycles/Tidal - I've spent many hours just reading Tidal source code
https://github.com/ojack/hydra - fantastic visuals
https://github.com/colinbdclark/osc.js-examples/tree/master/browser for helping me hack together a chrome app with no experience
https://slab.org/ojack-in-the-lab/

