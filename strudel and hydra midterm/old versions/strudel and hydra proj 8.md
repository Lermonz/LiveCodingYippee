```
let mode = "F:major"
const seed = slider(10,0,24,1)
//PAD
const pad =  n(`<
     <[0,4,8,13b]!2 [2,5,10,14]!997>
     <[1,4,9,12]!2 [3,5,10b,13]!997>
     [0,4,9,13]
     <[0,5,10,[13 12]]!7 [1,5b,9,13b]>
     >`)
  .scale("F3:major")
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .room(0.5)
  //.scale(mode)
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.adsr("2.6:4.4:0.4:0.81")
.postgain(0.7)

//HYPNOTIC
const hypno = n(irand(9).add(2).segment(4).ribbon(seed,2).degradeBy(0.45))
  .scale("F4:major:pentatonic")
  .attack(0.5)
  .room(2)
  .crush(8)
  .lpf(itri.range(200,1500).slow(3))
  .postgain(0.8)
.sound("sine")
//ARP GOOD
const arpGood = n("<[8 6 5 3]*4 ~!3>")
  .velocity("[0.8 0.4 0.33 0.15]")
  .lpf("850")
  .scale("f3:dorian")
.s("kawai")

//RAND MELODY
_$: n(irand(13).segment(8).ribbon(seed,2))
.scale(mode)
.s("sawtooth")

//FUCKED UP AND EVIL
const evil = n("<[0,12] ~>/2")
  .scale("F0:major")
  .vib(rand.range(5,50),5)
  .adsr("1.4:1.8:0.9:1.4")
  .gain(0.8)
.sound("<triangle, supersaw>")

//ARPEGGIO
const arpeggio = n("<[0 2 4 6 8 10 12 14] ~!15>*4".add("<[0,2] [2,4]>/4"))
  .sound("[triangle square sawtooth]*6")
  .scale(mode)
  .hpf(1200)
  .delay("0.4:0.32:0.75")
.attack(0.09)
//.struct("x ~ ~ ~")

//BASS
const bass = n("<0!3 [0 3]>")
  .sound("triangle")
  .scale("f1:major")
  .fm("<8!6 9 10 12!999>")
  .postgain(1.5)
.struct("x x <~!3 [~ x]> <~!3 [~ x]>")
  //.room("1.5:40")

//DRUMS
const beats = ["<bd!3 [bd bd:1:0.7]>@4 <[sd@3 bd]!3 [sd@2 bd@2]>@4 <[~ bd bd@2]>@4 <sd@4!2 [sd@3 bd] [sd@4]>@4",
               "bd@4 sd@3 bd ~ bd bd@2 sd@3 bd",
               "bd@2 sd@3 bd:1:0.5 bd@2 sd@3 bd:1:0.5 bd@2 sd@2"]

//BEAT
const beatD = arrange([7, beats[0]],
          [1, beats[2]])
  .s()
  .speed(rand.range(0.97,1.03))
  .distort("4.2:0.28")
  .bpf("<1555 1666 1777 1888 2000!994>:<1!2 0.9!2 0.75 0.55 0.3 0.2!999>")
  .bank("akailinn")
//RIDE ON
const ride = s("rd*8")
  .speed(rand.range(0.98,1.02))
  .bpf(tri.range(7000,8250).slow(8.5))
  .bpq(6)
  .postgain(0.53)
  .bank("akailinn")

const sections = [
  stack(beatD, pad),
  stack(beatD, pad, bass, ride),
  stack(beatD, pad, bass, ride, hypno),
  stack(beatD, pad, bass, ride, hypno, arpeggio),
  stack(beatD, pad, evil, ride, arpGood),
  stack(pad, arpeggio, hypno)
]

$: pick(sections, "<0@8 1@16 2@12 3@16 4@24 5@8 ~@999>")
```