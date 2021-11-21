

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
	var freq=1,audio=0,sig,x=0,f=220,amp=1;

64.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f.postln,mul:1/amp),1200),LFSaw.ar(amp));
		audio = audio +sig;
		x=x+1;
		freq=(x+1)/x;
		f=f*freq;
		amp=amp*freq;
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

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=110,l=440;
	var sig;
	var env;
	var freq=1,audio=0,x=0,amp=1;

	//freq=n*6*f;
	    env=EnvGen.ar(Env.perc(a,4,0.1,[-4,-4]),doneAction:2);
		32.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f*2,mul:1/amp),l),LFSaw.ar(1/amp),width:2);
		//sig=BLowPass.ar(SinOsc.ar(f*2,mul:1/amp),l);
		audio = audio +sig;
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
	\dur,Pbrown(1,8,2,inf),
	\l,Pbrown(220,1200,10,inf),
	\sp,Pbrown(1,20324015,10000,inf),
		\pr,Pexprand(1,1,inf),
	\a,Pbrown(1,4,0.1,inf),
	\f,Prand([60,60*(9/8),60*(9/8)*(9/8),80,90,90*(9/8),90*(9/8)*(9/8),120],inf),
	\pass,Pexprand(0.0005,5,inf),
	\n,Pbrown(1,1,1,inf);)).play(quant:1))

)
