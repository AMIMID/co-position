TempoClock.default.tempo_(60/10);
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
SynthDef.new(\id, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1,env2,env3,env4;
	var m=0;
		par.do{
		m=m+1;
		 env1=EnvGen.ar(Env.perc(4,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(4,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(4,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(4,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(1/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*40,mul:env2),LFSaw.ar(1/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(1/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(1/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(0,sum);
}).add;
);
(
SynthDef.new(\idb, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,par=1,n1=1,n2=1,n3=1,n4=1;
	var sig1,sig2,sig3,sum;
	var env1,env2,env3,env4;
	var m=0;
		par.do{
		m=m+1;
		 env1=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(0.01,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(0.01,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(0.01,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(1/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*40,mul:env2),LFSaw.ar(1/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*40,mul:env3),LFSaw.ar(1/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*40,mul:env4),LFSaw.ar(1/(12)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(0,sum);
}).add;
)
)
(
(
( Pdef(\1, Pbind(\instrument, \id,
		\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),


			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
);


(
( Pdef(\5, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,16,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),


			)).play(quant:1));
)
)