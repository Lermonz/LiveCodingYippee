```
await initHydra()
gradient(0.7)
  .diff(noise(10,0.5).modulateKaleid(noise(20,0.1)).modulateRotate(osc(2,0.021)))
  .mult(osc(1.4,0.4,1).kaleid(20))
  .hue(0.18)
  .brightness(0.016)
.out(o0)
// src(o0)
//   .hue(0.05)
//   .diff(osc(5).colorama(1.112).brightness(0.2))
//   .mask(shape(4,H(sine.range(0.35,0.5).slow(4)),0.01).modulateScale(noise(20,0.1)))
//   .add(noise(20,0.15).color(0.35,0.08,0,1).modulateScale(osc(20)).kaleid(50))
// .out(o0)
let mode = "F:major"
const seed = slider(10,0,24,1)
const chords = `<
     <[0,4,8,13] [2,6,10,14]!3>
     <[1,4,9,12] [3,5,10b,13]>
     [0,<4 5>,9,13]
     <<[<0!2 1>,5,10,12] [1,4,10,12]>!7 [1,5b,9,13b]>
     >`
//PAD
const pad = n(chords)
  .scale("F3:major")
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .room(0.5)
  .phaser(sine.range(0,8).slow(2))
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.adsr("2.6:4.4:0.4:0.81")
.postgain(0.7)

//HYPNOTIC
const hypno = n(irand(9).add(2).segment(4).ribbon(seed,2).degradeBy(0.45))
  .scale("F4:major:pentatonic")
  .attack(0.5).room(2).crush(8)
  //.vib("80:5") //AT EVIL //REMOVE AFTER EVIL
  .lpf(itri.range(200,1500).slow(3))
  .postgain(0.8)
.sound("sine")

//ARP GOOD
const arpGood = n("<[8 6 5 3]*4 ~!3>*2")
  .velocity("[0.8 0.53 0.32 0.21]")
  .lpf("850")
  .scale("f3:dorian")
  //.vib("<1!3 <32 136 42 68>>/4")
  //.vibmod("1.2")
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
  .gain(0.88)
.sound("<triangle, supersaw>")

//ARPEGGIO
//<0,1,2> => <0 1 2> //AFTER INTRO //REVERT AT EVIL
const arpeggio = n("<[0 2 4 6 8 10 12 14](3,8,<0,1,2>)>".add("<[0,2] [2,4]>/4"))
  .sound("[triangle square sawtooth]*6")
  .scale(mode)
  .hpf("<1200@23 0>")
  .lpf("<1333 1555 1777 1999 2111>".add("<0@5 1000@5 2000@5 3000@5 4000@3 0>"))
  .delay("0.4:0.32:0.75")
.attack(0.09)

//BASS
const bass = n("<0!3 [0 3]>")
  .sound("triangle")
  .scale("f1:major")
  .fm("<8!6 9 10 12!999>")
  .postgain(1.5)
.struct("x@2 <~!3 [~ x]> <~!3 [~ x]>")
  //.room("1.5:40")

//DRUMS
const beats = ["<bd [bd bd:1:0.7]>@4 <[sd@3 bd]!3 [sd@2 bd@2]>@4 <[~ bd bd@2]>@4 <sd@4!2 [sd@3 bd] [sd@4]>@4",
               "bd@4 sd@3 bd ~ bd bd@2 sd@3 bd",
               "bd@2 sd@3 bd:1:0.5 bd@2 sd@3 bd:1:0.5 bd@2 sd@2"]

//BEAT
const beatBeuc = s("bd(3,8,0),bd:1:0.45(3,8,1)")
  .distort("0.8:0.7")
  //.crush(4)
  .lpf("<1750@24 20000@999>")
  .room(0.2)
  .bank("akailinn")
const beatD = arrange([7, beats[0]],
          [1, beats[2]])
  .s()
  .speed(rand.range(0.97,1.03))
  //.distort("4.5:0.155") //AT EVIL //REMOVE AFTER EVIL
  .bpf("<1555!25 1666 1777 1888 2000!994>:<1!2 0.9!2 0.75 0.55 0.3 0.2!999>")
  .bank("akailinn")
.postgain(1.9)

//RIDE ON
const ride = s("rd*8")
  .speed(rand.range(0.98,1.02))
  .bpf(tri.range(7000,8250).slow(8.5))
  //.crush(3.2) //AT EVIL //REVERT AFTER EVIL
  .bpq(6) //1.5 AT EVIL //REVERT TO 6 AFTER EVIL
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
  .hpf(500)
  .lpf(perlin.range(550,950).slow(4))
  .gain(tri.range(1.2,5).slow(32))

const chordsArp = n(chords.slow(4).add(7))
  .scale(mode)
  .release("0.06")
  .arp("[0 1 2 3]*12")
  .gain("<1 0.6 0.5 0.4 0.35 0.3 0.25 0.2 0.15@8>*8")
  .postgain(0.6)
.s("square")


const sections = [
  stack(pad,arpeggio,wind,ride),
  stack(pad,arpeggio,wind,beatBeuc),
  stack(pad,arpeggio,wind,bass,beatD,chordsArp),
  stack(pad,wind,bass,beatD,arptri,hypno),
  stack(evil,beatD,hypno,arptri,wind),
  stack(evil,beatD,ride,hypno,arpGood,arptriFUCKEDUP),
  stack(pad,bass,beatD,ride,bouncy),
  stack(pad,bass,beatBeuc,ride,hypno,chordsArp),
  stack(pad,arpeggio,evil,beatD,ride)
]
$: pick(sections, "<0@16 1@8 2@16 3@16 4@16 5@16 6@8 7@16 8@16 9@16>")
// $: pick(sections, `<[0,4,11]@16 [0,4,11,12]@8
// [0,4,11,5,6,13]@16 [5,6,11,0,9,13]@16 
// [3,6,1,9,11]@16 [3,6,7,1,10,2]@16 
// [6,7,0,5,8]@8 
// <[12,7,0,5,1],<9 2>*2>@16 
// [6,7,3,0,4]@16 [0,11,4]@16 
// ~@999>`)
all(x=>x.fast(1.11))



  // stack(beatD, pad), //0
  // stack(beatD, pad, bass, ride, bouncy), //1
  // stack(beatD, pad, bass, ride, hypno, arptri), //2 
  // stack(beatD, pad, bass, ride, hypno, arpGood), //3
  // stack(beatD, pad, evil, ride, arpeggio), //4
  // stack(pad, arpeggio, wind), //5
  // stack(beatD, bass, hypno, arptri), //6
  // stack(beatD, evil, hypno, arptriFUCKEDUP) //7
```