TempoClock.default.tempo_(60/15);
s.options.numOutputBusChannels=8
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

a={Out.ar(0,PanAz.ar(2,BLowPass.ar(WhiteNoise.ar(),880),LFSaw.ar(1/12),MouseX.kr(1/30,1/10),width:2))}.play
a.free

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

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(2/6),env1,1);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*20,mul:env2),LFSaw.ar(2/(8)),env2,1);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(2/(9)),env3,1);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(2/(12)),env4,1);
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
( Pdef(\1, Pbind(\instrument, \id,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),


			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
);


(
( Pdef(\5, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),

			)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf),


			)).play(quant:1));
)
)

/////////////////////////////


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

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*10,mul:env1),LFSaw.ar(1/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*10,mul:env2),LFSaw.ar(1/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*10,mul:env3),LFSaw.ar(1/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*10,mul:env4),LFSaw.ar(1/(12)),env4,2);
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

		sum=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*20,mul:env2),LFSaw.ar(3/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(3/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(3/(12)),env4,2);
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
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),


			)).play(quant:1));
( Pdef(\10, Pbind(\instrument, \idc,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\11, Pbind(\instrument, \idc,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\12, Pbind(\instrument, \idc,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
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
( Pdef(\13, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\14, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\15, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),

			)).play(quant:1));
( Pdef(\16, Pbind(\instrument, \idd,
	\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,8,1,inf),
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