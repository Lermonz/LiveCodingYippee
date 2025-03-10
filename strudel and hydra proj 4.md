```
await initHydra({feedStrudel:1})
let melody = "<[2|~] 4 ~ [8|7] [~ 3] 4 ~ 6 ~>*2"
let mode = "F:dorian"
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
//PAD
$: n("[0,4,9,13] ~")
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .scale(mode)
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.attack(6)
.release(4.1)

//HYPNOTIC
$: n(melody)
  .scale(mode)
  .attack(1.8)
  .release(2)
  .room(2)
  .crush(8)
.sound("gm_epiano2")

//FUCKED UP AND EVIL
$: n("<[0,12] ~>/2")
  .vib(rand.range(5,50),5)
  .adsr("1.4:1.8:0.9:1.4")
  .gain(0.4)
.sound("triangle, supersaw")

//ARPEGGIO
_$: n("<[0 2 4 6 8 10 12 14] ~!15>*4".add("<[0,2] [2,4]>/4"))
  .sound("triangle")
  .scale(mode)
  .crush(8)
  .hpf(1200)
  .delay("0.4:0.32:0.75")
.attack(0.09)
//.struct("x ~ ~ ~")

//BASS
_$: n("<0 0 0 [0 3]>".add(-14))
  .sound("triangle")
  .scale(mode)
  .fm("8")
  .room("1.5:40")
.struct("x ~ ~ [~|x]")

//DRUMS
//kick
$: arrange(
  [3, ("rhodespolaris_bd").euclidRot(3,8,"<0 3>")],
  [1, ("rhodespolaris_bd").struct("x ~ ~ [x!3] ~ x ~ x")]
).sound()
//snare
$: s("<~ mt32_sd ~ [~ mt32_sd ~ ~]>*2")
  .gain(0.7)
  .attack(0.045)
  .delay("0.35:.22")

all(x => x.fast(1.18).fft(10).scope({thickness:20,smear:0.08}))
```