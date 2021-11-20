













(
{
	var freq=1,audio=0,sig,x=0,f=110;

100.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f.postln,mul:1/f),3000),LFSaw.ar(freq));
		x=x+1;
		freq=(x+1)/x;
		f=f*freq;
		audio = audio +sig;
	};
	Out.ar(0,audio);
}.play
)

(
SynthDef.new(\id1, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig;
	var env;
	var freq=1,audio=0,x=0;

	//freq=n*6*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		32.do{
		sig=PanAz.ar(2,BLowPass.ar(SinOsc.ar(f,mul:1/f),MouseX.kr(100,10000)),LFSaw.ar(freq));
		x=x+1;
		freq=(x+5)/x;
		f=f*freq;
		audio = audio +sig;
	};
		//+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/6),width:2);

		Out.ar(0,audio*env);
}).add;
);
(
( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(1,8,1,inf),
	\sp,Pbrown(1,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60,80,90,120],inf),
	\pass,Pexprand(0.0005,5,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1))
)