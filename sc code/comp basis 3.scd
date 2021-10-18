s.options.device_("USB Sound Device");
s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(60/60);
s.options.memSize = 65536;
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;

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
		sig=PanAz.ar(2,FSinOsc.ar(n*m*6*f,mul:env),LFSaw.ar(6/6),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
		sig=PanAz.ar(2,FSinOsc.ar(n*m*6.75*f,mul:env),LFSaw.ar(6/(6.75)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
	sig=PanAz.ar(2,FSinOsc.ar(n*m*(6.75*(9/8))*f,mul:env),LFSaw.ar(6/(6.75)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
		sig=PanAz.ar(2,FSinOsc.ar(n*m*8*f,mul:env),LFSaw.ar(6/(8)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
		sig=PanAz.ar(2,FSinOsc.ar(n*m*9*f,mul:env),LFSaw.ar(6/(9)),env,2);

		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
	    sig=PanAz.ar(2,FSinOsc.ar(n*m*10.125*f,mul:env),LFSaw.ar(6/(10.125)),env,2);

		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
	sig=PanAz.ar(2,FSinOsc.ar(n*m*(10.125*(9/8))*f,mul:env),LFSaw.ar(6/(12)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
		sig=PanAz.ar(2,FSinOsc.ar(n*m*12*f,mul:env),LFSaw.ar(6/(12)),env,2);
		//sum=sum+sig;
	//};
		Out.ar(0,sig*2);
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
