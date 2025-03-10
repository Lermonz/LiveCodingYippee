```
//PAD
let padchord = "[0,4,9,13]"
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
$: s("rhodespolaris_bd").euclidRot(3,8,0)
  .lpf(sine.range(2500,4500))
//snare
$: s("<~ mt32_sd ~ [~ mt32_sd ~ ~]>*2")
  .gain(0.7)
  .attack(0.045)
  .delay("0.35:.22")

all(x => x.fast(1.18))
```