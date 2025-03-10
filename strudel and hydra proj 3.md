```
await initHydra({feedStrudel:1})
let melody = "<[2|~] 8 ~ [5|6] [~ 3] 4 ~ 6 ~>*2"
src(s0)
  .color(0.237,0.109,H(melody.div(5).add(0.4)))
  .scale(0.5)
  .scrollY(() => time/30, 0.02)
  .diff(noise(H(melody.div(16).add(5)), 1.2)
        .color(0.2,0.5,0.5,0.5)
        .luma(0.12)
        .kaleid(H(melody)))
  .pixelate(256,256)
  .rotate(Math.cos(time%50),0.1)
.out(o0)
//PAD
$: n("[0,4,9,13] ~")
  .sound("square")
  .vib("3.1:0.15")
  .lpf(1000)
  .scale("F:dorian")
  .pan(tri.slow(4).range(0.2,0.8))
.slow(4)
.attack(6)
.release(4.1)

//HYPNOTIC
$: n(melody)
  .scale("F:dorian")
  .attack(1.8)
  .release(2)
  .room(2)
  .crush(8)
.sound("gm_epiano2")

//FUCKED UP AND EVIL
_$: n("<[0,12] ~>/2")
  .vib(rand.range(5,50),5)
  .adsr("1.4:1.8:0.9:1.4")
  .gain(0.4)
.sound("triangle, supersaw")

//ARPEGGIO
$: n("<[0 2 4 6 8 10 12 14] ~!15>*4".add("<[0,2] [2,4]>/4"))
  .sound("triangle")
  .scale("F:dorian")
  .crush(8)
  .hpf(1200)
  .delay("0.4:0.32:0.75")
.attack(0.09)
//.struct("x ~ ~ ~")

//BASS
$: n("<0 0 0 [0 3]>".add(-14))
  .sound("triangle")
  .scale("F:dorian")
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

all(x => x.fast(1.18).fft(4).scope({pos:0,smear:0.8}))
```