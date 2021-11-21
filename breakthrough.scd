

s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=8
TempoClock.default.tempo_(60/15);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;
~a= Buffer.read(s,path:"C:/Users/delkristo/Desktop/9/studio projects/recordings final/whole file.wav");
~a.query;
~a.numFrames

(
{
	var freq=1,audio=0,sig,x=0,f=220;

200.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f.postln,mul:1/(f/100)),3000),LFSaw.ar(freq));
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq;
	};
	Out.ar(0,audio);
}.play
)

(
{
	var freq=1,audio=0,sig,x=0,f=220,amp=1;

24.do{
		sig=SinOsc.ar(f,mul:1/amp);
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq;
		amp=amp*freq;
		amp.postln;
	};
	Out.ar(0,audio!2);
}.play
)

(
SynthDef.new(\id1, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=110;
	var sig;
	var env;
	var freq=1,audio=0,x=0,amp=1;

	//freq=n*6*f;
	    env=EnvGen.ar(Env.perc(0.01,6,pr,[-4,-4]),doneAction:2);
		24.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f*2,mul:1/amp),440),LFSaw.ar(freq),width:2);
		audio = audio +sig;
		x=x+1;
		freq=(x+n)/x;
		f=f*freq;
		amp=amp*freq;
	};
		//+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/6),width:2);

		Out.ar(0,audio*env);
}).add;
);
(
( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(1,4,1,inf),
	\sp,Pbrown(1,20324015,10000,inf),
		\pr,Pexprand(1,1,inf),
	\a,Pbrown(0.01,1,0.01,inf),
	\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.0005,5,inf),
	\n,Pbrown(1,3,1,inf);)).play(quant:1))

)
