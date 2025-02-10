```
stack(
  n("[0 1 2 3] [5 7 9 12] ~!3").scale("D:minor").sound("sawtooth")
  .gain(0.8)
  .delay("0.5:0.37:0.35")
  .crush(3)
  //.lpf("5500:5.8")
  .palindrome(),

  note("f3,a3,d3".add("<0 0 0 1>")).sound("square")
  .struct("x ~ x ~ ~ x ~ x"),
  
  note("<d2 ~ f2 [~ | [~ g2]]>").sound("sawtooth")
  .adsr(".1:.9:.7:.8"),

  s("bd")
  .euclidRot(3,8,"<0 4>/3"),
  //s("<~ ~ ~ [[~!7 bd bd ~!3 bd ~!3] | ~]>")
).cpm(280/4)
```