```
// licensed with CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// by Olivia Jack
// https://ojack.github.io

s0.initImage("https://static.wikia.nocookie.net/mario64hacks/images/b/b8/Super_Mario_64_Mario.png")
osc(100, 0.01, 1.4)
.thresh(0.15,0.54)
	.rotate(0.3, 0.09)
	.mult(src(s0).modulate(noise(0.1).rotate(0, -1), -2),3.7)
	.color(5.83,0.491,0.39)
.scale(0.3)
	//.modulateKaleid(osc(-2,0.1,0.5),-0.002)
.rotate(0, 0.32)
.pixelate(256,256)
  .out(o0)
```