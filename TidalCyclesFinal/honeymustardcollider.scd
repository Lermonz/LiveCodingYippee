(
s.options.numBuffers = 1024 * 256;
s.options.memSize = 8192 * 64;
s.options.maxNodes = 1024 * 32;
s.options.numOutputBusChannels = 2; // total number of output channels
s.options.numInputBusChannels = 2;

s.waitForBoot {
    ~dirt = SuperDirt(2, s); // total number of output channels
	~dirt.loadSoundFiles;
    ~dirt.loadSoundFiles("/Users/cooper/Documents//Dirt/Samples/**"); // specify sample folder to load
    s.sync; // wait for supercollider to finish booting up
    ~dirt.start(57120, 0 ! 12); // start superdirt, listening on port 57120, create twelve orbits each sending audio to channel 0
};
);

(
SynthDef(\Solace, {
	arg freq=440, amp=1, lpf=1200, pan=0, delay, delaytime=0.4, delayfb=0.5,fb1=0.55,fb2=0.4;
	var snd, del;
	snd = PSinGrain.ar(freq,0.55,fb1);
	snd = LPF.ar(snd+PSinGrain.ar(freq*fb2,0.4,0.03)*Env.perc(0,0.8,1,-8).ar,lpf);
	delay = DelayL.ar(snd, 20, delaytime, delayfb);
	snd = snd.blend(delay, 0.5);
	snd = snd*amp * 15.dbamp;
	snd = Pan2.ar(snd,pan);
	Out.ar(0,snd);
}).add;
SynthDef(\Ender, {
	arg freq=110, amp=1, pan=0, fb1=1, fb2=1, release=1.5;
	var snd, env;
	snd = VarSaw.ar(SinOscFB.ar(freq*fb1, 0.5, 60, freq*fb2),width:0.1);
	env = EnvGen.kr(Env.perc(0,release), doneAction: 2);
	snd = snd*env*amp;
	snd = Pan2.ar(snd,pan);
	Out.ar(0, snd);
}).add;
SynthDef(\Mylky, {
	arg freq=110, amp=1;
	var snd, env;
	freq = SinOsc.kr(9,0,3.69,freq);
	snd = SinOsc.ar(Formant.ar(freq*2, Env.perc(0.02,0.4,1,-14).kr*40+freq*13, freq*6.5, 1350, freq*2));
	env = EnvGen.kr(Env.perc(0.1,1),doneAction: 2);
	snd = snd*env*amp* -6.dbamp;
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).add;
SynthDef(\Zashy, { //perfect
	arg freq=110, amp=0.6, atk=0.45, release=0.8, pan=0;
	var snd, env;
	snd = LFSaw.ar(Dust.kr(80, 10, freq*2-5), 0.2);
	snd = snd.blend(SinOsc.ar(Dust.kr(80, 10, freq*2-5), 0.4));
	snd = snd+(LPF.ar(LFCub.ar(SinOsc.ar(freq, 0, 100, freq*2)),6000) * -10.dbamp);
	env = EnvGen.kr(Env.new([0,0.13,0.5,0.3,0], [atk*2,atk,0.5,release], [0,-1,1,2]), doneAction:2);
	snd = snd*env*amp;
	pan = SinOsc.kr(3.5,pi*3/2,0.12);
	snd = Pan2.ar(snd,pan);
	Out.ar(0, snd);
}).add;
SynthDef(\Declo, {
	arg freq=110, amp=0.6, atk=0.45, release=0.8, pan=0, sustain=1;
	var snd, env;
	snd = LFSaw.ar(freq+SinOsc.ar(10, mul:1.5));
	snd = snd.blend(LFSaw.ar(freq-0.5), 0.5);
	snd = snd+LFCub.ar(freq*2+SinOsc.ar(10, mul:1.5));
	env = EnvGen.kr(Env.linen(0.12, 0.28, release, 0.6), timeScale:sustain, doneAction:2);
	snd = snd*env*amp* -2.dbamp;
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).add;
SynthDef(\Skylar, {
	arg freq=110, amp=0.6, speed=1, accelerate=0, release=0.8, pan=0, sustain=1, dirt=5;
	var snd, env;
	snd = VarSaw.ar(freq*DirtFreqScale.kr(speed, accelerate, dirt), width:0.45);
	env = EnvGen.kr(Env.linen(0.12, 0.28, release, 0.6), timeScale:sustain, doneAction:2);
	snd = snd*env*amp* -4.dbamp;
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).add;
SynthDef(\iDoge, {
	arg freq=440, amp=0.5, decay=0.1, release=0.2;
	var snd, env;
	snd = AY.ar(AY.freqtotone(freq),AY.freqtotone(freq*2),AY.freqtotone(freq*1.333), 0, 7, 15, 15, 13, chiptype:0);
	env = EnvGen.kr(Env.linen(0, decay, release, 0.6), doneAction:2);
	snd = snd*env*amp;
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).add;
)