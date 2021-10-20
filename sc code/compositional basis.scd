s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=4;
TempoClock.default.tempo_(60/60);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:2) ;

(
(
SynthDef.new(\id1, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		//m=m*2;
	    env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*6*m)),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(n*m*6*f,mul:env),LFSaw.ar(2/6),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id2, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		//m=m*2;
        env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*6.75*m)),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(n*m*6.75*f,mul:env),LFSaw.ar(2/(6.75)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id3, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		//m=m*2;
	env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*(6.75*(9/8))*m)),[-4,-4]),doneAction:2);
	sig=PanAz.ar(2,FSinOsc.ar(n*m*(6.75*(9/8))*f,mul:env),LFSaw.ar(2/(6.75*(9/8))),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id4, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		//m=m*2;
		env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*8*m)),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(n*m*8*f,mul:env),LFSaw.ar(2/(8)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id5, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		//m=m*2;
		env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*9*m)),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(n*m*9*f,mul:env),LFSaw.ar(2/(9)),env,2);

		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id6, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*10.125*m)),[-4,-4]),doneAction:2);
	sig=PanAz.ar(2,FSinOsc.ar(n*m*10.125*f,mul:env),LFSaw.ar(2/(10.125)),env,2);

		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id7, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
	env=EnvGen.ar(Env.perc(4,6,pr*(2/(n*(10.125*(9/8))*m)),[-4,-4]),doneAction:2);
	sig=PanAz.ar(2,FSinOsc.ar(n*m*(10.125*(9/8))*f,mul:env),LFSaw.ar(2/(10.125*(9/8))),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
(
SynthDef.new(\id8, {

	arg dur=1,pr,par=1,n=1;
	var sig,sum=0;
	var env,f=20;
	var m=1,a=4;

		//par.do{
		env=EnvGen.ar(Env.perc(a,6,pr*(2/(n*12*m)),[-4,-4]),doneAction:2);
		sig=PanAz.ar(2,FSinOsc.ar(n*m*12*f,mul:env),LFSaw.ar(2/(12)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(2,sig*2);
}).add;
);
)
//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(

( Pdef(\1, Pbind(\instrument, \id1,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pexprand(0.01,4,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\2, Pbind(\instrument, \id2,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pexprand(0.01,4,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\3, Pbind(\instrument, \id3,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pexprand(0.01,4,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\4, Pbind(\instrument, \id4,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\a,Pexprand(0.01,4,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\5, Pbind(\instrument, \id5,
	\dur,Pbrown(1,6,2,inf),
	\par,Pbrown(1,4,1,inf),
	\a,Pexprand(0.01,4,inf),
		\pr,Pexprand(0.5,1,inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\6, Pbind(\instrument, \id6,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\7, Pbind(\instrument, \id7,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr,Pexprand(0.5,1,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

( Pdef(\8, Pbind(\instrument, \id8,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,4,1,inf),
	\a,Pexprand(0.01,4,inf),
		\pr,Pexprand(0.5,1,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
	\n,Pbrown(1,8,1,inf);)).play(quant:1));

)
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////



a= Buffer.read(s,path:"C:/Users/delkristo/Desktop/339326__inspectorj__bird-whistling-a.wav");
b= Buffer.read(s,path:"/Users/petrostatsiopoulos/Desktop/recordings final/sikada mono.wav");

(
(
SynthDef.new(\bp1, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),600,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/6),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp2, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),800,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/8),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp3, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),900,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/9),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp4, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),1200,pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/12),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp5, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),600*(9/8),pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/(6*(9/8))),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp6, {

	arg pass=1,n=1,p=1;
	var sig;
		var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),600*(9/8)*(9/8),pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/(6*(9/8)*(9/8))),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp7, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),900*(9/8),pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/(9*(9/8))),width:2);
		Out.ar(2,aud*env);
}).add;
);
(
SynthDef.new(\bp8, {

	arg pass=1,n=1,p=1;
	var sig;
	var env,aud;
			env=EnvGen.ar(Env.perc(4,10,p,[-4,-4]),doneAction:2);
	sig=PitchShift.ar(BBandPass.ar(PlayBuf.ar(1,0,BufRateScale.kr(0),loop:inf),90*(9/8)*(9/8),pass,mul:(1/pass)),0.02,n);
	aud=PanAz.ar(2,sig,LFSaw.ar(2/(9*(9/8)*(9/8))),width:2);
		Out.ar(2,aud*env);
}).add;
)
)

(
( Pdef(\a, Pbind(\instrument, \bp1,
	\dur,Pbrown(8,15,2,inf),
	\n,Pbrown(1,2,0.1,inf),
	\p,Pexprand(0.5,1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\b, Pbind(\instrument, \bp2,
		\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\c, Pbind(\instrument, \bp3,
		\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\d, Pbind(\instrument, \bp4,
	\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\g, Pbind(\instrument, \bp5,
	\dur,Pbrown(8,15,2,inf),
	\n,Pbrown(1,2,0.1,inf),
	\p,Pexprand(0.5,1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\k, Pbind(\instrument, \bp6,
		\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
	//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\l, Pbind(\instrument, \bp7,
		\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
( Pdef(\m, Pbind(\instrument, \bp8,
	\dur,Pbrown(8,15,2,inf),
		\n,Pbrown(1,2,0.1,inf),
		//\pass,Pbrown(0.0001,0.01,0.001,inf);
	\pass,Pexprand(0.0001,5,inf);

			)).play(quant:1));
)
///////////////////////////////////////////////////
(SynthDef.new(\env,{arg fr1=1,fr2=1; var env;
	env=EnvGen.ar(Env.sine(30,2),doneAction:2);
	Out.ar(0,PanAz.ar(2,FreeVerb.ar(InFeedback.ar(2)*env,0.5,0.5),LFSaw.ar(fr1)));
	Out.ar(0,PanAz.ar(2,FreeVerb.ar(InFeedback.ar(3)*env,0.5,0.5),LFSaw.ar(fr2)));
}).add);


( Pdef(\sound, Pbind(\instrument, \env,
	\dur,Pbrown(20,30,1,inf),
	\fr1,Prand([2/6,2/8,2/9,2/12],inf),
		\fr2,Prand([2/6,2/8,2/9,2/12],inf);
			)).play(quant:1));