s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=8
TempoClock.default.tempo_(60/60);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;
~a= Buffer.read(s,path:"C:/Users/delkristo/Desktop/9/studio projects/recordings final/whole file.wav");
~a.query;
~a.numFrames

(
(
SynthDef.new(\id1, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;

	freq=n*6*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/6),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id2, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*(6*(9/8))*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/(6*(9/8))),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id3, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*(6*(9/8)*(9/8))*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/(6*(9/8)*(9/8))),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id4, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*8*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/8),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id5, {

			arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*9*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/9),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id6, {

			arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*(9*(9/8))*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/(9*(9/8))),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id7, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*(9*(9/8)*(9/8))*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/(9*(9/8)*(9/8))),width:2);

		Out.ar(0,sig*env);
}).add;
);
(
SynthDef.new(\id8, {

		arg dur=1,pr,pass=1,n=1,b=0,sp=10000,a=4,f=20;
	var sig,sum=0;
	var env,freq;


	freq=n*12*f;
	    env=EnvGen.ar(Env.perc(a,16,pr,[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(freq,mul:2/freq)+BBandPass.ar(PlayBuf.ar(1,b,BufRateScale.kr(0),startPos:sp),freq,pass,mul:(0.1/pass)),LFSaw.ar(2/12),width:2);
		Out.ar(0,sig*env);
}).add;
);
)
//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
	\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
	\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
	\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\5, Pbind(\instrument, \id5,
		\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\6, Pbind(\instrument, \id6,
		\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60/2,8022,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\7, Pbind(\instrument, \id7,
	\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\8, Pbind(\instrument, \id8,
		\dur,Pbrown(1,12,2,inf),
	\sp,Pbrown(0,20324015,10000,inf),
		\pr,Pexprand(0.5,1,inf),
\a,Pbrown(0.01,0.5,0.01,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\pass,Pexprand(0.0005,10,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

)