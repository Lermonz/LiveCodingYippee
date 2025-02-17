```
stack(
  n("[0 1 2 3] [5 7 9 12] ~!6".add(8)).scale("D:minor").sound("sine")
  .delay("1:0.47:0.69")
  .crush(5)
  .gain(0.35)
  //.lpf("5500:5.8")
  .palindrome(),
  n("<[0 -2 0 3] [[5|6] 7 9 12] ~!2>".add(8)).scale("D:minor").sound("sine")
  .bpf("450:1.6")
  .delay(".5:0.28:0.8")
  ,
  note("f3,a3,d3".add("<0 0 0 1>")).sound("square")
  .struct("x ~ x ~ ~ x ~ x"),
  
  note("<d2 ~ f2 [~ | [~ g2]]>").sound("sawtooth")
  .adsr(".1:.9:.7:.5"),

  s("bd")
  .euclidRot(3,8,"<0 4>/3"),
  s("~ sd")
).cpm(280/4)
```