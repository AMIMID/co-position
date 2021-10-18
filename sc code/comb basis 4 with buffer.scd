a= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/birdy/600.wav");
b= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/birdy/800.wav");
c= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/birdy/900.wav");
d= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/birdy/1200.wav");
s.options.memSize = 65536;




(
(
SynthDef.new(\bp1, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,20,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),0.05,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/6));
		Out.ar(0,aud*env*8);
}).add;
);
(
SynthDef.new(\bp2, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,20,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(PlayBuf.ar(1,1,BufRateScale.kr(0),loop:inf),0.05,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/8));
		Out.ar(0,aud*env*8);
}).add;
);
(
SynthDef.new(\bp3, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,20,p,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(PlayBuf.ar(1,2,BufRateScale.kr(0),loop:inf),0.05,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/9));
		Out.ar(0,aud*env*8);
}).add;
);
(
SynthDef.new(\bp4, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,20,p,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(PlayBuf.ar(1,3,BufRateScale.kr(0),loop:inf),0.05,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(3/12));
		Out.ar(0,aud*env*8);
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