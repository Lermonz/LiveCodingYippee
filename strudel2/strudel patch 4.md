```
stack(
  n("<[0 1 2 3] [5 7 9 12] ~>*2".add("[8|6|5]")).scale("D:minor").sound("sine")
  .delay("1:0.47:0.69")
  .crush(5)
  .gain(0.15)
  //.lpf("5500:5.8")
  .palindrome(),
  
  n("<~ [0 -2 0 [2|3]] [[5|6] 7 9 [10|12]] ~>".add(8)).scale("D:minor").sound("sawtooth")
  .bpf(sine.range(350,580).segment(4.2))
  .vib("2:0.25")
  .delay(".8:0.28:0.8")
  ._scope()
  ,
  
  note("g3,a4,d4".add("<0 0 0 [-1|1|1 3]>")).sound("square")
  .delay(0.3)
  .gain(0.6)
  .lpf(sine.range(650,2150).segment(0.8))
  .struct("x ~ x ~ ~ x ~ x")
  ._scope(),
  
  
  note("<d2 ~ f2 [~ | [~ g2]|[~ c#2]]>").sound("sawtooth")
  .gain(1.1)
  .decay(".9")
  .vib("1:.25")
  ._scope(),

  note("eb3,b2").sound("sine")
  .gain(0.45)
  .decay(0.07)
  .delay("0.25:0.35:0.7")
  .vib("3:250")
  .hpf(3000)
  .struct("<[x ~ ~ x ~ ~ x ~]!3 [~ x ~ ~ x ~ x [~|x!3]]> ")
  ._scope(),
  
  s("bd")
  .euclidRot(3,8,"<0 4>/3"),
  s("~ sd")
  
).cpm(280/4)
```