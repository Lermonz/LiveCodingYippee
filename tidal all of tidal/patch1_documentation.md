it's 9pm on sunday and i haven't thought about live coding in basically 3 weeks, and am about to bang out the worst shit ever conceived just to remember how to do this

annoying trying to figure out which sounds in the default library of tidalcycles is actually just gonna work as a tone to use to test out music before trying to do any sound design

took a bit to realize that im not looking for samples im looking for synths, so i go to the synthesizers pages on tidal documentation

struggling to figure out how to get the whole entirity of a pattern into a different range, i wanna do it be subtracting from the whole but the notation seemse to do nothing

^as i was typing that i realized it was cuz i didn't prepend the amount i want to adjust it by with an n

i was doing this `d1 $ n "0 5 7 2" |-| "24"` instead of this `d1 $ n "0 5 7 2" |-| n "24"`

the organization of where certain effects of functions or whatever should go compared to how they did in strudel is throwing me off big time, it took a minute to figure out where i was supposed to put *struct* to make it work cuz i just wanted some rhythmic stuff going on

i kept trying to put it as an effect like this 
```
d1 $ n "<[g4,bf4,d5,f5] [g4,b4,c5,e5]>/2"
  # s "superpiano"
  # struct ("f t [f t] f")
```

but that didn't work it all, it has to be done like this for some reaason instead
```
d1 $ struct ("f t [f t] f") $ n "<[g4,bf4,d5,f5] [g4,b4,c5,e5]>/2"
  # s "superpiano"
```

im trying to get the *every* function to change up the rhythm but i dont know how to do that via other functions just yet

im testing it with just *ply* so i can hear the change happening but i really want to change the rhythm of what's happening every 4 cycles more granularly and individually, not sure how to yet tho
`d2 $ every' 4 3 (ply 2) $ s "[bd*4, <~ sd>*4]"`

in my attempt to figure this out the tutorials page showed a nice title saying "shifting time/beat rotation", but it just told me about some weird notation about doing this (0.25 <~) to shift the beat around within its cycle, which is *interesting* but not really the most musical, i need more control over how the thing is changing each time the *every* condition is met

for now i can do what im trying in a simple and constrained way by using *cat* like this

`d2 $ cat [sound "[bd:3 sd]*2", sound "bd:3 sd [bd:3 [~ bd:3]] sd"]`

what i really want is to just use the *arrange* function strudel had cuz that lets you have so many options in terms of weighting and repeating and control within how each change happens, i miss strudel

after a few hours of scouring the reference pages i found the *fix* function, which kinda does what im looking for but not really, but it does allow for more granular variation to the pattern then just using *every*

at first i ran into some issues with it but it was just cuz i forgot the $ at the beginning of the function

