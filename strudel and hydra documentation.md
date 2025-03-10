full honesty: i waas not documenting as i went along, but i will
# Bugs/Issues I ran into!!!
## the memory leaks oh my god my computer is running so slow
hydra is so bad to work with cuz i legit have to restart every like 20 minutes just to get it functional again

trial and error becomes way harder when each trial gets slower and slwoer and more unresponsive
## audio cutting out
goes hand in hand most of the time with the memory leaks, but sometimes it would just happen consistantly
#### EXAMPLE:
one of my patterns that i named "chordsArp" would cause all audio to cut out if it was playing for more than 28 cycles in a row

NO CLUE AT ALL HOW THAT HAPPENED, so i also had no idea how to fix it so instead i just wrote around that "restriction"
# How Progress happened????
after the week where we met Jade and she showed us that structure she had with making all your patterns into constants and putting them in a stack to make sections i actually like, got inspired to make that work

but at the point in time my project **SUCKED AND WAS BORING**

things that were lame about it:
- chord "progression" (there was none)
- beat
- visuals
- the melodies
- cohesion between parts
- just not enough ear candy

### How i fixed em!!!
### Chords
the chords are played by a pad, at first they just did this: `("[0,4,9,13] ~")`, which got old pretty quick, there had to be more chords

i took a while deciding between using the chords functionality in strudel so i could type stuff like Cm7b9 or whatever the hell, but i ended up liking just index numbers more

chord progression was inspired by the piano part in "(4S,4aS,8aR)-4,8a-Dimethyloctahydronaphthalen-4a(2H)-ol dub" by superlocrianlizardbuzzard, which i saw in the featured tab of strudel

i ended up with this 
```
<<[0,4,8,13] [2,6,10,14]!3>
<[1,4,9,12] [3,5,10b,13]>
[0,<4 5>,9,13]
<<[<0!2 1>,5,10,12] [1,4,10,12]>!7 [1,5b,9,13b]>>
```
(think of each row as a 4 bars of time, it chooses between the bracketed selections of 4 notes each cycle, weight dependent)

i put this into ts own const because its used by 2 patterns that aren't always playing at the same time

### Beat
at first i was just using a euclid rhythm and 2 + 4 snare hits, with some random mish mash from different banks that i kinda liked, BUT IT COULD BE BETTER

i basically just recreated the beat in Redial from Bomberman Hero, and i cared way less about making the code look as pretty and pristine and clean as possible, instead focusing on making good variety first, *then* making the code look nice if i cared enough to

ended up with these as the main beats 
```
"<bd [bd bd:1:0.7]>@4 <[sd@3 bd]!3 [sd@2 bd@2]>@4 <[~ bd bd@2]>@4 <sd@4!2 [sd@3 bd] [sd@4]>@4",
"<[bd bd:1:0.6] bd>@2 sd bd@2 bd:1:0.7 sd ~ bd bd sd@2 bd@2 sd@2",
"bd@2 sd@3 bd:1:0.5 bd@2 sd@3 bd:1:0.5 bd@2 sd@2"
```
put into an array, and called to with the arrange function to swap between them at consistent intervals to have a change in beat every 8 measures
`arrange([7, beats[0]],[1, beats[2]])`

another small thing i did for all the drums to add more variety was randomize the speed *sliiiiiightly* away from 1 `.speed(rand.range(0.97,1.03))`

### Visuals
I took a while to get around to this again, cuz again, the memory leak shit made it slow to work while hydra was active

i got inspired by a bunch of the performances i saw at Boston Bitdown on saturday to make some visuals

i didnt wanna use someone elses, the only stuff i looked at for inspiration was the examples shown on the hydra functions website to showcase what each function does

but importantly, i did want them to change through the piece, i probably could use another pick instance for visuals to line them up, but for now i'm not

(there was one instance in making the visuals for one sections that i got inspired to add another pattern to match it, and i think it works really well)

### Melodies
More Jade inspiration, originally the melody was a handpicked series of notes that just sounded random, but after Jade taught about controlled randomness i actually implemented that! but only for one of the melody patterns, the one i called hypnotic, and i left it pretty open and flowy
`n(irand(9).add(2).segment(4).ribbon(seed,2).degradeBy(0.45))`

another melody i had was kinda just a run up the mode i set via a const, but later i gave it some variety from 4 ways

- euclid rhythm with multiple rotations `n("<[0 2 4 6 8 10 12 14](3,8,<0,1,2>)>")`
- transposing it diatonically every 4 cycles `.add("<[0,2] [2,4]>/4")`
- changing the sound used for it constantly `.sound("[triangle square sawtooth]*6")`
- constantly changing filtering that repeats every 24 cycles `.lpf("<1333 1555 1777 1999 2111>".add("<0@5 1000@5 2000@5 3000@5 4000@3 0>"))`

### Cohesion
honestly... i didn't really fix this one, it just kinda worked itself out more as the song got structure to it, instead of just all of them playing at once all the time

it also helps that i only used basic wave shapes for the tonal sounds

### Adding more ear candy
this also just came with time, as i thought about a structure for the piece, i had to add in more patterns that would fit into it, then i would mess with those patterns for a while, then the way i messed with them would make me wanna change the structure to accomodate the new sound i made, normal music stuff

I actually wanna just show each pattern i have and explain its purpose, functionality, and what makes it unique

## Patterns Explored
### pad
```
n(chords)
  .scale("F3:major")
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .room(0.5)
  //.phaser(sine.range(0,8).slow(2))
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.adsr("2.6:4.4:0.4:0.81")
.postgain(0.67)
```
the backbone of the whole damn piece, plays for most of the song, the commented out phaser gets brought in about halfway through

this was the first pattern i made for this midterm, i really wanted long pads after getting inspired by one of my friend's recent songs that also had a constant pad fading in and out with cool chords (outlined in my section about chords)
### chordsArp
```
n(chords.add(7).slow(4))
  .scale(mode)
  .release("0.06")
  .arp("[0 1 2 3]*12")
  .gain("<1 0.6 0.5 0.4 0.35 0.3 0.25 0.2 0.15@8>*8")
  .postgain(0.6)
.s("square")
```
specifically inspired by the common chiptune practice of having very fast arpeggios to play a chord, since there's so few channels to work with it's your only option

uses the same chords pattern as **pad**

for some reason if it plays for too long consecutively the song loses all audio until it stops playing again?? idgi, so it doesn't play much in the song even tho i really like it
### arpeggio
```
n("<[0 2 4 6 8 10 12 14](3,8,<0,1,2>)>".add("<[0,2] [2,4]>/4"))
  .sound("[triangle square sawtooth]*6")
  .scale(mode)
  .hpf("<1200@23 0>")
  .lpf("<1333 1555 1777 1999 2111>".add("<0@5 1000@5 2000@5 3000@5 4000@3 0>"))
  .delay("0.4:0.32:0.75")
.attack(0.09)
```
already went over most of this one a bit, this is kinda the main theme of the song, cuz it plays at the very beginning and the very end and is given the most space to breathe on its own compared to any other melodic pattern
### arpGood
```
n("<[8 6 5 3]*4 ~!3>*2")
  .velocity("[0.8 0.53 0.32 0.21]")
  .lpf("850")
  .scale("f3:dorian")
  .penv(-1.2).panchor(0.2)
  .room(0.2)
.s("sawtooth")
```
originally made to be a better arpeggio pattern than the pattern called "arpeggio", but has evolved into being the worst arpeggio pattern i have! only used for mild texture at some evil sections

the velocity doing that is basically a fake delay effect, i did it like that cuz i was that's how you do delay in trackers and it works
### arpTri
```
n(tri.segment(16).range(6,25))
  .scale(mode)
  .bpf(sine.range(500,1200).segment(48).slow(16))
  .postgain(0.88)
.room(0.68)
```
just a very simple run up and down the mode :) yay

hey what's tha-
### arpTriFUCKEDUP
```
n(tri.segment(16).range(6,irand(7).add(18)))
  .scale(mode)
  .vib("325:4.1")
  .phaser(2).phaserdepth("<0.5 0.75 <[0.9 0.75] [0.5 0.35]>>")
  .penv("<<-10 12 5> <-2 2>>").panchor(0).pdecay("0.04")
  .bpf(sine.range(500,1500).segment(48).slow(16))
  .distort("5:0.32")
  .postgain(0.48)
.room(0.62)
```
same girl but she's MUTATED and TWISTED and EVIL or whatever, i just wanted to apply as many audio effects to a pattern and make it sound very warbly and fucked up, hence the name

it's a big moment sort of pattern so it only appears after we've been evil for a while
### bouncy
```
n(run("<6 <8 10>>"))
.chord("<FM7!2 Dm7 Em7>/2")
  .voicing().add("<0 -1>/16")
  .segment("8")
  .decay(0.4)
  .penv("[0.5 0.7 <0.9!3 2>]*2")
  .postgain(0.52)
.s("square")
```

the most melodic melody boy i have, the structure of this is pretty much just stolen from an example of how to use the penv function on the [strudel.cc/learn page](https://strudel.cc/learn/effects/#pitch-envelope) but applied to *generally* a simple harmonic structure that works for when the pattern is played in my piece

it's biggest point of variation comes from the next carats i think, turning it into a call and response with itself just by adding one more number
### hypno
```
n(irand(9).add(2).segment(4).ribbon(seed,2).degradeBy(0.45))
  .scale("F4:major:pentatonic")
  .attack(0.5).room(2).crush(8)
  //.vib("80:5")
  .lpf(itri.range(200,1500).slow(3))
  .postgain(0.9)
.sound("sine")
```
my friend the random, altho i dont actually want to mess with the seed anymore cuz i really like how just the one i've stuck with for the past few days sounds, enough to the point im considering just replacing seed with the number 10 instead lol

this melody plays a few times, it's a nice floaty texture (as long as that vibrato stays commented out), the degradeBy does a lot of heavy lifting to force this pattern to leave space like it should
### bass
```
n("<0!3 [0 3]>")
  .sound("triangle")
  .scale("f1:major")
  .fm("<8!6 9 10 12!999>")
  .room(0.1)
  .postgain(1.45)
.struct("x@2 <~!3 [~ x]> <~!3 [~ x]>")
```
incredibly simple pattern, just a triangle being fm'd to shit and given a decently interesting rhythm to follow

it plays a lot but surpringly not as much as i thought given how this is my only designated ""bass"" pattern, tho the next one may or may not count
### evil
```
n(`<[0,6b,12]  ~ 
<[0,6,12b] [1,6b,13b]> ~>/2`)
  .scale("F0:major")
  .vib(5,500)
  .lpf(3000).lpa(2.5).lpr(1)
  .gain(0.92)
.sound("<triangle, supersaw>")
```
made as heavy and muddy and dense as i could possibly muster without actually adding too many effects

it sounds very intimidating, and it's basically the entire reason the song is structured the way it is, swapping from chill relaxing funtime music to evil fucked up weird shit on a dime, all cuz i accidentally added that comma between the two sounds making them overlap
### wind
```
s("white*12")
  .attack(0.5)
  .release(0.5)
  .hpf(500)
  .lpf(perlin.range(550,950).slow(4))
  .gain(tri.range(1.42,4.85).slow(32))
```
this one was made to fill out space in without adding any tonal or rhythm quality, i also just really like white noise wind, though strudel was weird about it cuz it's not actually constant, instead it actually gets triggered again and essentiall "resets" every cycle, so i tried to mask that retrigger with the slow attack and release, and give it very long variation with these super slow changes to the filter and gain
### glitch
```
n("<0 7> 7 21 7 4 <7 21!2> 7 14".fast(2).sometimesBy(0.23, x=>x.clip(0.5).ply("<6 3 4 6>*5")))
  .scale("F4:dorian")
  .vib("160:11.8")
  .postgain(0.79)
.s("square")
```
this was the pattern i made that was inspired by the visuals i ended up making for the second evil section

i was very inspired to go absolute absurdo bananas with the pixelation as something to be changing with the music, and so i thought i wanted to match that with something that sounded very glitchy, so i used my classic favorite effect of super big vibrato, on a pattern of rapid large jumps in indexes by octaves primarily, (even the vibrato is *juust* short of an octave in depth) so that even tho it's super fucked up it wouldn't be too difficult to listen to

the clip and ply also add a lot to the glitchiness, i end up using this again for the drums at the same section where this plays
### beatD
```
arrange([7, beats[0]],
[1, beats[2]])
  .s()
  .speed(rand.range(0.97,1.03))
  //.distort("4.5:0.155")
  //.sometimesBy(0.13, x=>x.clip(0.5).ply("<2 3 4 <2 6>>*6"))
  .bpf("2000:0.25")
  .bank("akailinn")
.postgain(1.9)
```
main beat of the song, the distortion i manually turn on when we reach the evil sections, it uses an array called beats here -> 
```
["<bd [bd bd:1:0.7]>@4 <[sd@3 bd]!3 [sd@2 bd@2]>@4 <[~ bd bd@2]>@4 <sd@4!2 [sd@3 bd] [sd@4]>@4",
"<[bd bd:1:0.6] bd>@2 sd bd@2 bd:1:0.7 sd ~ bd bd sd@2 bd@2 sd@2",
"bd@2 sd@3 bd:1:0.5 bd@2 sd@3 bd:1:0.5 bd@2 sd@2"]
```
at a certain point i change it from using beats[0] to beats[1] to give a lot more rapid frantic energy for the glitchy section
### beatBeuc
s("bd(3,8,0),bd:1:0.45(3,8,1)")
  .distort("0.8:0.7")
  .speed(rand.range(0.97,1.03))
  .bpf("<1555!17 1666 1777 1888 2000!994>:<1!18 0.9!2 0.75 0.55 0.3 0.2!999>")
  .room(0.2)
  .bank("akailinn")
i use this one for calmer sections to take a break from the constant stream of the same beat over and over, it's a slightly different vibe

that stuff in the bpf effect is to make it automatically build up and open into the chorus, this is timed by just having the numbers of the cycles line up on purpose
### ride
```
s("rd*8")
  .speed(rand.range(0.98,1.02))
  .bpf(tri.range(7000,8250).slow(8.5))
  //.crush(3.2)
  .bpq(6)
  .postgain(0.53)
  .bank("akailinn")
```
functions as an additional layer to the drum groove for more intensity

kind of a similar function as the wind pattern, just a bit more rhythmic and intense