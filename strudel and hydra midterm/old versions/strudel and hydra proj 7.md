````
let melody = "<2 4 [8|7] [5 3] 4 6 ~>*2"
let mode = "F:major"
const seed = slider(22,0,24,1)
/*
await initHydra({feedStrudel:1})
osc(5,0.5,0.5)
  .color(0.739,0.109,H(melody.div(10).add(0.15)))
  .modulate(osc(25,0.1,0.5), .12)
  .saturate(0.5)
  .sub(src(s0).luma(0.6))
  .rotate(Math.cos(time%50),0.1)
  .scale(0.5)
  .scrollY(() => -time/30, -0.02)
       .modulateHue(osc(40,2),2)
  .diff(noise(5, .12))
  .pixelate(256,256)
.out(o0)
*/
const bassNote = "<f1@2 d1 e1>"
const chords = 
  "<[f3,c4,a4,e5]@2 [d3,c4,a4,f5] [e3,b3,g4,d5]>"
//PAD
$: note(chords)
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .room(0.5)
  //.scale(mode)
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.adsr("3.5:4.1:0.3:0.81")
.postgain(0.7)

//HYPNOTIC
$: n(irand(12).segment(4).ribbon(seed,5).degradeBy(0.75))
  .scale(mode)
  .attack(1.5)
  .release(2)
  .room(2)
  .crush(8)
  .lpf(itri.range(200,1500).slow(3))
  .postgain(1.17)
.sound("sine")
._scope()

//RAND MELODY
_$: n(irand(13).segment(8).ribbon(seed,2))
.scale(mode)
.s("sawtooth")

//FUCKED UP AND EVIL
_$: n("<[0,12] ~>/2")
  .vib(rand.range(5,50),5)
  .adsr("1.4:1.8:0.9:1.4")
  .gain(0.4)
.sound("triangle, supersaw")

//ARPEGGIO
_$: n("<[0 2 4 6 8 10 12 14] ~!15>*4".add("<[0,2] [2,4]>/4"))
  .sound("[triangle square sawtooth]*6")
  .scale(mode)
  .hpf(1200)
  .delay("0.4:0.32:0.75")
.attack(0.09)
//.struct("x ~ ~ ~")

//BASS
$: n("<0 0 0 [0 3]>".add(-14))
  .sound("triangle")
  .scale(mode)
  .fm("8")
  .room("1.5:40")
.struct("x ~ ~ [~|x]")

//DRUMS
const beats = ["bd@4 sd@3 bd ~ bd bd@2 sd@4",
               "bd@4 sd@3 bd ~ bd bd@2 sd@3 bd",
               "bd@2 sd@3 bd bd@2 sd@3 bd bd@2 sd@2"]

//BEAT
$: arrange([6, beats[0]],
          [1, beats[1]],
          [1, beats[2]])
  .s()
  .speed(rand.range(0.97,1.03))
  .bank("akailinn")
//RIDE ON
$: s("rd*8")
  .speed(rand.range(0.98,1.02))
  .bpf(tri.range(7000,8250).slow(8.5))
  .bpq(6)
  .postgain(0.72)
  .bank("akailinn")

all(x => x.fast(1.28))
````