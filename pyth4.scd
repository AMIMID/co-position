TempoClock.default.tempo_(60/60);
s.options.numOutputBusChannels=4
TempoClock.default.tempo_(60/15);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;
s.options.memSize = 2097152


(SynthDef.new(\seefoam,{
	var env;
	env=EnvGen.ar(Env.new([0,1,1,0,],[30,120,30],[-4]));
	Out.ar(0,PanAz.ar(2,BLowPass.ar(WhiteNoise.ar(mul:env*1/20),440),LFSaw.ar(1/12),env,width:2))
}).add)

Synth.new(\seefoam);

( Pdef(\wave, Pbind(\instrument, \seefoam,
	\dur,Pbrown(480,960,60,inf),
			)).play(quant:1));
////////////////////////////////////////////////////
(SynthDef.new(\env,{var env;
	env=EnvGen.ar(Env.sine(360,1),doneAction:2);
	Out.ar(0,InFeedback.ar(2)*env);
	Out.ar(1,InFeedback.ar(3)*env);
}).add)
( Pdef(\sound, Pbind(\instrument, \env,
	\dur,Pbrown(180,720,60,inf),
			)).play(quant:1));

(
(
SynthDef.new(\id, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1a,env2,env3,env4,k;
	var m=0,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
	         env1b=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*8)),[-4,-4]),doneAction:2);
	         env1c=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*9)),[-4,-4]),doneAction:2);
	         env1d=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*12)),[-4,-4]),doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1a),LFSaw.ar(2/6),env1a,2)+PanAz.ar(2,FSinOsc.ar(n2*8*20,mul:env1b),LFSaw.ar(2/(8)),env1b,2)+
	            PanAz.ar(2,FSinOsc.ar(n3*9*20,mul:env1c),LFSaw.ar(2/(9)),env1c,2)+PanAz.ar(2,FSinOsc.ar(n4*12*20,mul:env1d),LFSaw.ar(2/(12)),env1d,2);
	sum=0;
		par.do{
		m=m+2;
		env2=EnvGen.ar(Env.perc(3,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(3,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(3,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*20,mul:env2),LFSaw.ar(2/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(2/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(2/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(2,sum+k);
}).add;
);
(
SynthDef.new(\idb, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1a,env2,env3,env4,k;
	var m=0,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
	         env1b=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*8)),[-4,-4]),doneAction:2);
	         env1c=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*9)),[-4,-4]),doneAction:2);
	         env1d=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*12)),[-4,-4]),doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1a),LFSaw.ar(2/6),env1a,2)+PanAz.ar(2,FSinOsc.ar(n2*8*40,mul:env1b),LFSaw.ar(2/(8)),env1b,2)+
	            PanAz.ar(2,FSinOsc.ar(n3*9*40,mul:env1c),LFSaw.ar(2/(9)),env1c,2)+PanAz.ar(2,FSinOsc.ar(n4*12*40,mul:env1d),LFSaw.ar(2/(12)),env1d,2);
	sum=0;
		par.do{
		m=m+2;
		env2=EnvGen.ar(Env.perc(0.01,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(0.01,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(0.01,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*40,mul:env2),LFSaw.ar(2/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*40,mul:env3),LFSaw.ar(2/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*40,mul:env4),LFSaw.ar(2/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(2,sum+k);
}).add;
)
)
(
(
~a=( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
		\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);


			)).play(quant:1));
~b=( Pdef(\2, Pbind(\instrument, \id,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
		\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);

			)).play(quant:1));
~c=( Pdef(\3, Pbind(\instrument, \id,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
		\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);

			)).play(quant:1));
~d=( Pdef(\4, Pbind(\instrument, \id,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
			\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);

			)).play(quant:1));
);


(
~e=( Pdef(\5, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
				\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);

			)).play(quant:1));
~f=( Pdef(\6, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
			\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);
			)).play(quant:1));

~g=( Pdef(\7, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
			\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);
			)).play(quant:1));

~k=( Pdef(\8, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
			\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf);

			)).play(quant:1));
)
)

~a.stop
~b.stop
~c.stop
~d.stop
~e.stop
~f.stop
~g.stop
~k.stop
~a.play
~b.play
~c.play
~d.play
~e.play
~f.play
~g.play
~k.play

////////////////////////////////////////////////////////////////////////////////


TempoClock.default.tempo_(60/30);
s.options.numOutputBusChannels=8
TempoClock.default.tempo_(120/20);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;
s.options.memSize = 2097152

(
(
SynthDef.new(\idd, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1,env2,env3,env4;
	var m=0,k=1;
		par.do{
			k=k+1;
		m=(k+1)/k;
		 env1=EnvGen.ar(Env.perc(4,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(4,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(4,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(4,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(1/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*20,mul:env2),LFSaw.ar(1/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(1/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(1/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(0,sum);
}).add;
);
(
SynthDef.new(\idc, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1,env2,env3,env4;
	var m=0,k=1;
		par.do{
			k=k+1;
		m=(k+1)/k;
		 env1=EnvGen.ar(Env.perc(0.05,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(0.05,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(0.05,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(0.05,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*40,mul:env2),LFSaw.ar(3/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*40,mul:env3),LFSaw.ar(3/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*40,mul:env4),LFSaw.ar(3/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(0,sum);
}).add;
)
)
(
(
( Pdef(\9, Pbind(\instrument, \idc,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);


			)).play(quant:1));
( Pdef(\10, Pbind(\instrument, \idc,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
( Pdef(\11, Pbind(\instrument, \idc,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
( Pdef(\12, Pbind(\instrument, \idc,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
);


(
( Pdef(\13, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
( Pdef(\14, Pbind(\instrument, \idd,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
( Pdef(\15, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);

			)).play(quant:1));
( Pdef(\16, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.5,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\n1,Prand([1,3,5,8,13],inf),
	\n2,Prand([1,3,5,8,13],inf),
	\n3,Prand([1,3,5,8,13],inf),
	\n4,Prand([1,3,5,8,13],inf);


			)).play(quant:1));
)
)