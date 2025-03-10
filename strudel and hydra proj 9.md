```
let mode = "F:major"
const seed = slider(10,0,24,1)
//PAD
const pad =  n(`<
     <[0,4,8,13] [2,6,10,14]!7>
     <[1,4,9,12] [3,5,10b,13]>
     [0,4,9,13]
     <<[0,5,10,[13 12]] [1,4,10,12]>!7 [1,5b,9,13b]>
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
  .velocity("[0.8 0.33 0.22 0.1]")
  .lpf("850")
  .scale("f3:dorian")
  .vib("<1!3 <32 136 42 68>>/4")
  .vibmod("1.2")
  .penv(-1.2).panchor(0.2)
  .room(0.2)
.s("sawtooth")

//RAND MELODY
_$: n(irand(13).segment(8).ribbon(seed,2))
.scale(mode)
.s("sawtooth")

//FUCKED UP AND EVIL
const evil = n(`<[0,6b,12]  ~ 
               <[0,6,12b] [1,6b,13b]> ~>/2`)
  .scale("F0:major")
  .vib(5,500)
  .lpf(3000).lpa(2.5).lpr(1)
  //.adsr("1.4:1.8:0.9:1.4")
  .gain(0.68)
.sound("<triangle, supersaw>")

//ARPEGGIO
const arpeggio = n("<[0 2 4 6 8 10 12 14]>(3,8,<0,1,2>)".add("<[0,2] [2,4]>/4"))
  .sound("[triangle square sawtooth]*6")
  .scale(mode)
  .hpf(1200)
  .lpf("<1333 1444 1555 1666 1777 1888 1999 2100>".add("<0@8 1000@8 2000@8 3000@12 4000@3 -1000 0@16>"))
  .delay("0.4:0.32:0.75")
.attack(0.09)
//.struct("x ~ ~ ~")

//BASS
const bass = n("<0!3 [0 3]>")
  .sound("triangle")
  .scale("f1:major")
  .fm("<8!6 9 10 12!999>")
  .postgain(1.5)
.struct("x@2 <~!3 [~ x]> <~!3 [~ x]>")
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
  //.distort("4.2:0.28")
  .bpf("<1555 1666 1777 1888 2000!994>:<1!2 0.9!2 0.75 0.55 0.3 0.2!999>")
  .bank("akailinn")
//RIDE ON
const ride = s("rd*8")
  .speed(rand.range(0.98,1.02))
  .bpf(tri.range(7000,8250).slow(8.5))
  .bpq(6)
  .postgain(0.53)
  .bank("akailinn")

const bouncy = n(run("<6 <8 10>>"))
.chord("<FM7!2 Dm7 Em7>/2")
  .voicing().add("<0 -1>/16")
  .segment("8")
  .decay(0.4)
  .penv("[0.5 0.7 <0.9!3 2>]*2")
  .postgain(0.5)
.s("square")

//ARPTRI
const arptri = n(tri.segment(16).range(6,25))
  .scale(mode)
  //.penv("<-2 2>").panchor(0).pdecay("0.04")
  .bpf(sine.range(500,1200).segment(48).slow(16))
  .postgain(0.88)
.room(0.62)
const arptriFUCKEDUP =  n(tri.segment(16).range(6,irand(7).add(18)))
  .scale(mode)
  .vib("325:4.1")
  .phaser(2).phaserdepth("<0.5 0.75 <[0.9 0.75] [0.5 0.35]>>")
  .penv("<<-10 12 5> <-2 2>>").panchor(0).pdecay("0.04")
  .bpf(sine.range(500,1500).segment(48).slow(16))
  .distort("5:0.32")
  .postgain(0.48)
.room(0.62)
//.s("sine")
const wind = s("white*12")
  .attack(0.5)
  .release(0.5)
  .lpf(perlin.range(550,1200).slow(4))
  .gain(tri.range(1,10).slow(32))


const sections = [
  stack(beatD, pad),
  stack(beatD, pad, bass, ride, bouncy),
  stack(beatD, pad, bass, ride, hypno, arptri),
  stack(beatD, pad, bass, ride, hypno, arpGood),
  stack(beatD, pad, evil, ride, arpeggio),
  stack(pad, arpeggio, wind),
  stack(beatD, bass, hypno, arptri),
  stack(beatD, evil, hypno, arptriFUCKEDUP)]

$: pick(sections, "<5@64 6@16 7@16 0@8 1@16 2@16 3@16 4@24 5@8 ~@999>")
all(x=>x.fast(1.11))
```