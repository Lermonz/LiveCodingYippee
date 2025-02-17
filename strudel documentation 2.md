lol forgot to be documenting as i go this time

i didn't really look at any references this time, i just scrolled through the references tab on the strudel page to come up with ways to change my sounds

i will go through each thing that's generating sound and explain my goal with it + what effects i used to make that happen

## The Sparkler:

```
n("<[0 1 2 3] [5 7 9 12] ~>*2".add("[8|6|5]")).scale("D:minor").sound("sine")
  .delay("1:0.47:0.69")
  .crush(5)
  .gain(0.15)
  //.lpf("5500:5.8")
  .palindrome()
```

this was originally the melody, but i kinda liked it as some arpeggio ear candy bit, especially once the plaindrome effect was mentioned in class, it added a lot of variety

i wanted to mess with the sound of it, which is where the crush and delays came from, (it was also originally a sawtooth, but after adding the crush effect it was a bit too grating so i made it a sine)

the add effect is randomly transposing the notes each cycle which made it way less predictable, and i messed with how the notes are set up and somehow got the 2 []s to be disconnected so sometimes in one cycle one of them is going down and the other goes up or whatever combination, it's cool

## The Melody:

```
n("<~ [0 -2 0 [2|3]] [[5|6] 7 9 [10|12]] ~>".add(8)).scale("D:minor").sound("sawtooth")
  .bpf(sine.range(350,580).segment(4.2))
  .vib("2:0.25")
  .delay(".8:0.28:0.8")
  ._scope()
```

some random decisions in the notes section of a few of the notes to add variety

it's transposed up an octave via the add function

learned how to change the range of a sine function and how to align it with the cycles (the .range and .segment functions), so i put that inside the filter to make it sound like techno automation

learned there's a vibrato functino and got happy :D

._scope() is awesome btw

## The "Piano"

```
note("g3,a4,d4".add("<0 0 0 [-1|1|1 3]>")).sound("square")
  .delay(0.3)
  .gain(0.6)
  .lpf(sine.range(650,2150).segment(0.8))
  .struct("x ~ x ~ ~ x ~ x")
  ._scope()
```

the note changes happen in the add function instead of the note function, cuz the notes are just staying as the same block chord, which is transposed by the add stuff, it sounds awesome

struct to make it funky rhythm

more oscillating of the filter to add automation variety

## The Bass

```
note("<d2 ~ f2 [~ | [~ g2]|[~ c#2]]>").sound("sawtooth")
  .gain(1.1)
  .decay(".9")
  .vib("1:.25")
  ._scope()
```

simple cuz i wanted it to be, added the vibrato just so it's not ocmpeltely boring

the ending part of the bass's cycle is randomized so it isn't boring

## What? What the hell?

```
note("eb3,b2").sound("sine")
  .gain(0.45)
  .decay(0.07)
  .delay("0.25:0.35:0.7")
  .vib("3:250")
  .hpf(3000)
  .struct("<[x ~ ~ x ~ ~ x ~]!3 [~ x ~ ~ x ~ x [~|x!3]]> ")
  ._scope()
```

i was messing with the vibrato function, putting absurdly high numbers, and made a fucked up cartoon sound, messed with it some more and it sounded like a bouncy percussion hit

tried my best to turn it into somethign that actually sounds like a hihat, with the high pass filter and super short decay, and little delay to make it a bit less of an immediate cutoff

```
  s("bd")
  .euclidRot(3,8,"<0 4>/3"),
  s("~ sd")
```

euclid rhythms are awesome :thumbsup:

snare is left simple to ground this shit in something lol