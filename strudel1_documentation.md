I looked at some of the strudel documentation for examples of what a patch looks like, so i can at least structure it similarly

[this one](https://www.youtube.com/watch?v=oqyAJ4WeKoU) caught my eye and i looked at their code at around 15:30.

saw they did this with the bd `s("bd(<2,3>,8)")` and i wondered what that did so i tested it and it made a cool polyrhythm so now i'm playing with that

after a bit of messing around i came up with this 

```stack(
  s("bd(<6,7>,16)").lpf(2200),
  s("[~ sd(<1,1,1,1,2,3>,3)]").velocity(0.2),
  s("[[hh hh? hh? ~] [hh ~ hh hh?]]*4").hpf(9200)
)
```

where the bd is doing some polyrhythm, the snare uses that polyrhythm thing to do a fake delay effect, and the hh is just goin fast at some variable amounts of time playing cuz i want it to

also the lpf and hpf were things i saw in that same vid, actually i should prob look at more filters to use

and i can prob just use real delay too

next progress point:

```stack(
  s("bd(<5,7>,16)").lpf("<2200:2 1750:5>"),
  s("[~ sd(<1,1,1,1,2,3>,3)]").velocity(0.2),
  s("[[<oh hh!3> ~ hh hh?] [hh hh? hh hh]]*2").bpf("<7500:5!2 5000:7!2>")
)
```

looked at the strudel reference tab for filters and learned i can do 2 cool things, set the Q, and have multiple numbers inside one effect to make it change between cycles,

so now the bass changes between two lpfs, and the hihat changes between two hpfs, that each repeat once before going to the next

it's also set up to have the open hihat be played only once every 4 cycles of the hats (which is really two cycles cuz the entirety of the hihats is *2'd)

```
stack(
  s("bd(<5,7>,16)")
  .lpf("<2200:2 1750:5>"),
  
  s("~ sd")
  .delay("<.25:.225:.4 .15:.215:.35>"),
  
  s("[[<oh hh!3> ~ hh hh?] [hh hh? hh hh]]*2")
  .bpf("<7500:5!2 5800:4!2>")
)
```

structure looks nicer!!!

also using real delay now, also alternating between 2 to add variance

...

i perused the references tab for more effects, thought to myself "i dont like how much louder the bass drum gets when the polyrhythms sync up" then saw there's a compressor, so i get messing around with that, added a gain to turn it down, sounds kinda cool

(also learned that if you go super super extreme with the compressor it can sound like a triangle wave tom)

then i thought "hey what if i added a delay to the hihat!" and i did, but then i started to notice that the snare sound was changing???? idgi, it kinda sounds nice so i'll leave it, but i dont think the delay on this other sound should be affecting a previous delay

```
stack(
  s("bd(<5,7>,16)")
  .gain("<.68 .5 .6 .55>*5")
  .compressor("-16:2:2:.0015:.01")
  .lpf("<2250:2 1650:5>"),
  
  s("~ sd")
  .delay("<.25:.228:.4 .1:.207:.32>"),
  
  s("[[<oh hh!3> ~ hh hh?] [hh hh? hh hh]]*2")
  .bpf("<7500:5!2 5800:4!2>")
  .delay(".09:.12:.38")
).cpm(110/4)
```
i think that's the final version of it i'll send in, i think it sounds pretty cool and interesting