```
// licensed with CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// by Olivia Jack
// https://ojack.github.io

osc(100, 0.01, 1.4)
.thresh(0.15,0.54)
	.rotate(0.3, 0.09)
	.mult(noise(0.1,2).modulate(noise(0.1).rotate(0, -1), -2),3.7)
	.color(1.83,0.91,2.39)
.scale(0.3)
	//.modulateKaleid(osc(-2,0.1,0.5),-0.002)
.rotate(0, 0.12)
.pixelate(256,256)
  .out(o0)
```
