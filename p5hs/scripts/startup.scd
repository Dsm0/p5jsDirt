(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html
s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
s.options.numInputBusChannels = 2; // set this to your hardware output channel size, if necessary
// boot the server and start SuperDirt
s.waitForBoot {
	~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
	~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
	// for example: ~dirt.loadSoundFiles("/Users/myUserName/Dirt/samples/*");
	// s.sync; // optionally: wait for samples to be read
    //
    //
	~dirt.start(57120, 0 ! 12);   // start listening on port 57120, create two busses each sending audio to channel 0
	// optional, needed for convenient access from sclang:
	(
		~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
		~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
		~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
		~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
	);
//
};
//
s.latency = 0.3; // increase this if you get "late" messages
);

(
~dirt.loadSoundFiles("/M/Documents/songSamp/*");
~dirt.loadSoundFiles("/M/Documents/customSamples/*");
s.volume = (0);

SynthDef(\sy1, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy2, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy3, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy4, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy5, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy6, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy7, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy8, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
SynthDef(\sy9, {|out=0, freq=440| Out.ar(out, DC.ar(0)) }).add;
~dirt.soundLibrary.addSynth(\sy1);
~dirt.soundLibrary.addSynth(\sy2);
~dirt.soundLibrary.addSynth(\sy3);
~dirt.soundLibrary.addSynth(\sy4);
~dirt.soundLibrary.addSynth(\sy5);
~dirt.soundLibrary.addSynth(\sy6);
~dirt.soundLibrary.addSynth(\sy7);
~dirt.soundLibrary.addSynth(\sy8);
~dirt.soundLibrary.addSynth(\sy9);
)


~dirt.loadSoundFiles("/run/media/will/4028-FD6C/M/classes/15322/*");


~dirt.loadSoundFiles("/run/media/will/4028-FD6C/M/classes/15322/*");

~dirt.loadSoundFiles("/M/tidalcycles/djSet/*");
~dirt.loadSoundFiles("/M/Documents/unsorted_wavs");
~dirt.loadSoundFiles("/M/Documents/nameProject");


FreqScopeWindow.new()

SuperDirt.stop
s.quit;


s.record;
s.stopRecording;


o = ServerOptions.new;

o.memSize

s.makeWindow

SynthTracker.new('track');

s.runningSynths;
//freq analyzer
FreqScopeWindow.new

Stethoscope.new

Quarks.gui

//Scope
s.volume = 17
s.volume


s.meter
//meter
// plus notes::
-always try to put stuff in stacks

{SinOsc.ar}.play
s.hush


/*



SCALE LIST:::
------------------
minPent majPent ritusen egyptian kumai hirajoshi iwato chinese indian pelog
prometheus scriabin gong shang jiao zhi yu whole augmented augmented2 hexMajor7
hexDorian hexPhrygian hexSus hexMajor6 hexAeolian major ionian dorian phrygian
lydian mixolydian aeolian minor locrian harmonicMinor harmonicMajor melodicMinor
melodicMinorDesc melodicMajor bartok hindu todi purvi marva bhairav ahirbhairav
superLocrian romanianMinor hungarianMinor neapolitanMinor enigmatic spanish
leadingWhole lydianMinor neapolitanMajor locrianMajor diminished diminished2
chromatic

there's also a new thing called `all`

so you can do
```
all (|+ note 4)

```
or
```
all (fast 2)

```
 ```
all (fast 2 . degrade . rev)

```

etc
I forgot to add that to atom though
I just published 0.16 of the atom tidalcycles package with it in
or you can just do `all = streamAll tidal` to make it
to be clear - this will apply the given function to all running patterns
to turn off `all` you can do `all id`
*/


/*

Stuff from https://ianring.com/musictheory/scales/
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
all scales are just binary #s,
1365	010101010101	whole tone scale
2741	101010110101	major scale

another popular technique is by intervals::::
ie:
major scale = [2,2,1,2,2,2,1]

another way: pitch class sets::::
major scale by intervals = {0,2,4,5,7,9,11}

%%%%
what defines a scale (scale axioms)


1 - needs a root note,
ie. if in binary, 1st digit has to be a 1, otherwise there's no root


2 - A scale does not have any leaps greater than n semitones.
in our case, like 4 semitones (a major 3rd), because you want a decent # of notes in your scale

# of tones
	how many scales have that # of tones
1	0
2	0
3	1
4	31
5	155
6	336
7	413
8	322
9	165
10	55
11	11
12	1

heptonic: 7 notes, usually good for western music




(notes taken w/ arpeggiated "rash")

major = [0,4,7]
    major, what do you expect
minor = [0,3,7]
    minor, what do you expect?
major7 = [0,4,7,11]
    major with a bright spot at the end, a dab of tension towards resolution
dom7 = [0,4,7,10]
    major left ambiguous, a little whacky/not serious
minor7 = [0,3,7,10]
    minor with a dab of tension at the end, like a little flair
aug = [0,4,8]
    like someone or someting is confused
dim = [0,3,6]
    a little sinister, not god awful, like 1 off of a minor chord (literally)
    one off of the big bad
dim7 = [0,3,6,9]
    a fuckton of tension, like, resolve quick or my heart will erupt
one = [0]
    um... ok
five = [0,7]
    arpegiaged: like a walk, familiar,
    chord: like something sturdy
plus = [0,4,8]
    a little ambiguous, like 1 off of familiar again
sharp5 = [0,4,8]
    same as plus
msharp5 = [0,3,8]
    would resolve just a little different I guess
sus2 = [0,2,7]
    feels like what a sharp5 would resolve to,
    like there's a tiny bit of tension, but it could
    also be seen as 0 resolving to 2, then going to a major 3,
    like someone's going out to explore
sus4 = [0,5,7]
    like someone's going out to explore
    higher than sus2 obviously, I guess that just means,
    well, do what you want
six = [0,4,7,9]
    like a major that can go places
m6 = [0,3,7,9]
    like a minor that can go places
sevenSus2 = [0,2,7,10]
    sus2 with a 7th tossed on for good measure
    like a bit of flair
sevenSus4 = [0,5,7,10]
    like a sus4 with flair also
sevenFlat5 = [0,4,6,10]
    confused sounding, needs resolution
m7flat5 = [0,3,6,10]
    a little less confused sounding, but still needs resolution
    maybe, it's like a bad apple's done something bad,
    you're already jarred, but you kinda expected it
sevenSharp5 = [0,4,8,10]
    like its a little off
m7sharp5 = [0,3,8,10]
    1st half is ok, 2nd half is disoant
nine = [0,4,7,10,14]
    curious. I want to know more
m9 = [0,3,7,10,14]
    curious in minor
m7sharp9 = [0,3,7,10,14]
    same as prev
maj9 = [0,4,7,11,14]
    curious
nineSus4 = [0,5,7,10,14]
    like it resolves in the middle for a moment,
    then keeps going, I like it a lot
sixby9 = [0,4,7,9,14]
    like there's some dissonance but it keeps going again,
    a brief pause, then it goes on
m6by9 = [0,3,9,7,14]
    OUT OF ORDER
    but the lack of order fits the tone of the chord,
    a confused wander
sevenFlat9 = [0,4,7,10,13]
    dissonance only on the last note, on the 13,
    it's meant to bug you
m7flat9 = [0,3,7,10,13]
    again, it bugs me, like the minor 3 and the [10,13]
    are on different wavelengths
sevenFlat10 = [0,4,7,10,15]
    like sevenFlat9 lite version
    kinda resolves with the 15 instead of 13
nineSharp5 = [0,1,13]
    great tension builder,
    0 -> 1, plenty of tension,
    then it rockets up an octave
m9sharp5 = [0,1,14]
    like the 14 is that extra dash of dissonance,
    to piss you off
sevenSharp5flat9 = [0,4,8,10,13]
    like it stops and realizes life is more complex
    0,4 (4th) ++ "-2,0,3" ( a mosey, but confused in this context)
m7sharp5flat9 = [0,3,8,10,13]
    same, but minor
eleven = [0,4,7,10,14,17]
    this has potential when you arp it "<up down>",
    like exploration w/ flair
m11 = [0,3,7,10,14,17]
    negative exploration with flair
maj11 = [0,4,7,11,14,17]
    the difference is a little 11, but it doesn't sound as conclusive
elevenSharp = [0,4,7,10,14,18]
    dissonant flair
m11sharp = [0,3,7,10,14,18]
    1st half ok, 2nd half dissonant
thirteen = [0,4,7,10,14,17,21]
    lovely, like so good it transitions into the next moment in extacy
m13 = [0,3,7,10,14,17,21]
    extacy for the bad guy



techniques::::
slice n "0 1 2 .. (n-1)"
    sample will start normally, then you can change each piece individually
