# AAAGGHHH
i forgot to be doing this immediately when i started

you can't fault me i started adding to the patch at about midnight tonight

### What i've been up to

I've become very interested in designing my own synths in supercollider to use in tidalcycles and im experimenting with what I can do in it

What i've learned:
 - you can directly change scd "args" within tidalcycles just like you do with other synths, you just have to define them in the SynthDef
 - if an arg name is not a default one that Tidal already knows, then you have to define it as something to be readable with a line of code like this 
 `let fb1 = pF "fb1"` where fb1 is my variable name, and you can swap out the pF for pI or pS depending on what variable type it needs (float, int, and string respectively)
 - using the sustain variable helps get rid of an annoying click that plays at the end of each note end with custom synths, cuz they just hard cut off without it, im sure there's a way around this within supercollider itself, and im sure there's a better way to do it in tidal, cuz this clearly wasn't the intended use for this variable

Also i wanted to have chords be variables again so multiple different channels can use them and i only have change 1 line of code to make the change globally

tho in terms of live coding its annoying because i have to activate the new chords i want, then go to each channel that uses them and re-activate each of those that uses it (unless they're all together in a do function like i currently have them)

it is now far too late for me to still be doing this, whoops, it's not the most musical rn, but the highlights are thus:
- the melody has a lot of random variation that sounds nice in very specified ways
- being able to change the sound design of my synths on the fly is really nice
- the chord elements sound good together

the bad that i haven't thought about yet:
- making the melody and bass lin change in tandem with the chords in a way that fits how they should change relative to the harmonic shift, it's fundamentally different from how the chord instruments hsould change on a note to note basis, but it can definitely be done programatically and not individually specified for each note, right?
- the drums SUCK idk what to do with those lol

sorry i didn't do more i was busy and now i am tired
```
ZZ z   /\      __,,---,,_
  Z z /, `.-'``    -.  ;-`;,__
     |,4-  ) )-,__ ,\ (  `'--'
    '---''(_/--'  `-'\_)
```