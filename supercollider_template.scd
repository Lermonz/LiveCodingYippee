(
s.options.numBuffers = 1024 * 256;
s.options.memSize = 8192 * 32;
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
SynthDef(\Azu, {
	arg freq=440, amp=1, atk=0.001, rel=0.4;
	var snd, env;
	freq = freq*PinkNoise.kr(1/(freq*2), 1);
	snd = LPF.ar((LFSaw.ar(freq)),freq*4);
	env = EnvGen.kr(Env.new([0,1,0], [atk,rel], [1,-1]), doneAction:2);
	snd = snd*env*amp;
	snd = Pan2.ar(snd);
	Out.ar(0, snd);
}).add;
SynthDef(\Rocker, {
	var snd, env;
	snd = SinOscFB.ar(Stepper.kr(Impulse.kr(20),Impulse.kr(2),4,8,1,4)*110,0.8,0.4);
	env = EnvGen.kr(Env.perc(1,2), doneAction: 2);
	snd = snd*env;
	snd = Pan2.ar(snd);
	Out.ar(0,snd);
}).add;
SynthDef(\Solace, {
	arg freq=440, amp=1, lpf=1200, pan=0;
	var snd, del;
	snd = PSinGrain.ar(freq,0.55);
	snd = LPF.ar(snd+PSinGrain.ar(freq*2,0.4)*Env.perc(0,0.8,1,-8).ar,lpf);
	snd = snd*amp * 15.dbamp;
	snd = Pan2.ar(snd,pan);
	Out.ar(0,snd);
}).add;
SynthDef(\Ender, {
	arg freq=110, amp=1, pan=0;
	var snd, env, del;
	snd = SinOsc.ar(SinOsc.ar(freq*5, 0, 600, freq*8));
	del = DelayN.ar(snd, 1, 0.4);
	snd = snd.blend(del, 0.5);
	env = EnvGen.kr(Env.perc(0,1), doneAction: 2);
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
	arg freq=110, amp=0.6, atk=1.5, rel=4.5, pan=0;
	var snd, env;
	snd = SinOscFB.ar(Dust.kr(80, 10, freq*4-5), 0.2);
	snd = snd+(LPF.ar(LFCub.ar(SinOsc.ar(freq*4, 0, 500, freq*5)),6000) * -10.dbamp);
	env = EnvGen.kr(Env.new([0,0.3,0.65,0.3,0], [atk*2,atk,1,rel], [5,-3,4,-2]), doneAction:2);
	snd = snd*env*amp;
	pan = SinOsc.kr(0.1,pi*3/2,0.8);
	snd = Pan2.ar(snd,pan);
	Out.ar(0, snd);
}).add;
)