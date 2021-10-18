a= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/339326__inspectorj__bird-whistling-a mono.wav");
b= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/sikada mono.wav");
s.options.memSize = 65536;

(SynthDef.new(\seefoam,{
	var env;
	env=EnvGen.ar(Env.new([0,1,1,0,],[30,120,30],[-4]));
	Out.ar(0,PanAz.ar(2,FreeVerb.ar(BLowPass.ar(WhiteNoise.ar(mul:env*1/15),440),0.3,0.5),LFSaw.ar(1/12),env,width:2))
}).add)


~j=( Pdef(\wave, Pbind(\instrument, \seefoam,
	\dur,Pbrown(480,960,60,inf),
			)).play(quant:1));
////////////////////////////////////////////////////
(SynthDef.new(\env,{var env;
	env=EnvGen.ar(Env.sine(360,2),doneAction:2);
	Out.ar(0,FreeVerb.ar(InFeedback.ar(2)*env,0.5,0.5));
	Out.ar(1,FreeVerb.ar(InFeedback.ar(3)*env,0.5,0.5));
}).add);
( Pdef(\sound, Pbind(\instrument, \env,
	\dur,Pbrown(180,720,60,inf),
			)).play(quant:1));

{Out.ar(0,BBandPass.ar(PlayBuf.ar(2,0,BufRateScale.kr(0),loop:inf),MouseX.kr(600,1200),0.01))}.play;

(
(
SynthDef.new(\bp1, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),600,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/6));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp2, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),800,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/8));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp3, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),900,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/9));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp4, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),1200,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/12));
		Out.ar(0,aud*env);
}).add;
)
)

(
( Pdef(\a, Pbind(\instrument, \bp1,
	\dur,Pbrown(5,15,2,inf),
	\n,Pbrown(1,2,0.1,inf),
	\p,Pexprand(0.5,1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\b, Pbind(\instrument, \bp2,
		\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\c, Pbind(\instrument, \bp3,
		\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\d, Pbind(\instrument, \bp4,
	\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
)
///////////////////////////////////////////////////////////////////
(
(
SynthDef.new(\bp5, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,1,BufRateScale.kr(0),loop:inf),600,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/6));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp6, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,1,BufRateScale.kr(0),loop:inf),800,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/8));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp7, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,1,BufRateScale.kr(0),loop:inf),900,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/9));
		Out.ar(0,aud*env);
}).add;
);
(
SynthDef.new(\bp8, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,1,BufRateScale.kr(0),loop:inf),1200,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/12));
		Out.ar(0,aud*env);
}).add;
)
)

(
( Pdef(\e, Pbind(\instrument, \bp5,
	\dur,Pbrown(5,15,2,inf),
	\n,Pbrown(1,2,0.1,inf),
	\p,Pexprand(0.5,1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\f, Pbind(\instrument, \bp6,
		\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\g, Pbind(\instrument, \bp7,
		\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
( Pdef(\k, Pbind(\instrument, \bp8,
	\dur,Pbrown(5,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,10,inf);

			)).play(quant:1));
)