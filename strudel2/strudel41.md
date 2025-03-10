```
//sparkle
$:  n("<[0 1 2 3] [5 7 9 12] ~>*2".add("[18|16|15]")).scale("E:minor").sound("sine")
  .delay("1:0.47:0.69")
  .crush(5)
  .gain(0.15)
  .pan("<0 1>*6")
  .palindrome()
//melody  
$:  n("<~ [0 -2 0 [2|3]] [[5|6] 7 9 [10|12]] ~>").scale("E:minor").sound("sawtooth")
  .gain(1.1)
  .bpf(sine.range(350,580).segment(4.2))
  .vib("2:0.25")
  .delay(".8:0.28:0.8")
//piano  
_$:  note("g3,a4,e4".add("<0 0 0 [-1|1|1 3]>")).sound("square")
  .delay(0.3)
  .gain(0.4)
  .lpf(sine.range(650,1150).segment(0.3))
  .pan("<0.25 0.75>*4")
  .struct("x ~ x ~ ~ x ~ x")
//bass
$:  note("<d2 ~ f2 [~ | [~ g2]|[~ c#2]]>").transpose(2).sound("gm_lead_2_sawtooth")
  .gain(1.2)
  .decay(1.5)
  .room(1.2)
  .delay(".3:1.95:.03")
  .roomsize(1)
  .vib("1:.15")
//hihat
_$:  note("eb3,b2").sound("sine")
  .gain(0.45)
  .decay(0.07)
  .delay("0.25:0.35:0.7")
  .vib("3:250")
  .hpf(3000)
  .struct("<[x ~ ~ x ~ ~ x ~]!3 [~ x ~ ~ x ~ x [~|x!3]]> ") 
//kick
$:  s("bd")
  .euclidRot(3,8,"<0 4>/3")
  .room(0.7)
//snare
$:  s("~ sd")
  .gain(0.8)
  .room(0.8)

all(x => x.color("#B5AF77").scope())
```