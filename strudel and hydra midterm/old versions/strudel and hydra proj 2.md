```
await initHydra({feedStrudel:1})
let melody = "3 2 ~ 8 ~ [7 8] ~!2"
src(s0)
  .color(0.237,0.109,0.455)
  .kaleid()
  .rotate(() => time%360, 0.2)
  .diff(noise(H(melody.div(16).add(5)), 0.2)
        .thresh(0.15,0.4)
        .colorama(0.2))
  .pixelate(256,256)
  .kaleid(2)
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

//ARPEGGIO
$: n("<[0 2 4 6 8 10 12 14] ~!15>*4".add("<[0,2] [2,4]>/4"))
  .sound("sawtooth")
  .scale("F:dorian")
  .crush(6)
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

all(x => x.fast(1.18).fft(4).scope({pos:0,smear:2}))
```