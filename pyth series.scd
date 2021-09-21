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
SynthDef.new(\id, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,pr5=1,pr6=1,pr7=1,pr8=1,pr9=1,pr10=1,par=1,
	n1=1,n2=1,n3=1,n4=1,n5=1,n6=1,n7=1,n8=1,n9=1,n10=1;
	var sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sig9,sig10,sum;
	var env1,env2,env3,env4,env5,env6,env7,env8,env9,env10;
	var m=0;
		par.do{
		m=m+1;
		 env1=EnvGen.ar(Env.perc(2,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(2,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(2,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(2,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);
		 env5=EnvGen.ar(Env.perc(2,6,pr5*(2/(n5*6)),[-4,-4]),doneAction:2);
		env6=EnvGen.ar(Env.perc(2,6,pr6*(2/(n6*8*m)),[-4,-4]),doneAction:2);
		env7=EnvGen.ar(Env.perc(2,6,pr7*(2/(n7*9*m)),[-4,-4]),doneAction:2);
		env8=EnvGen.ar(Env.perc(2,6,pr8*(2/(n8*12*m)),[-4,-4]),doneAction:2);
		env9=EnvGen.ar(Env.perc(2,6,pr9*(2/(n9*9*m)),[-4,-4]),doneAction:2);
		env10=EnvGen.ar(Env.perc(2,6,pr10*(2/(n10*12*m)),[-4,-4]),doneAction:2);

		     sum=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*20,mul:env2),LFSaw.ar(3/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*20,mul:env3),LFSaw.ar(3/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*20,mul:env4),LFSaw.ar(3/(12)),env4,2);
		       sig5=PanAz.ar(2,FSinOsc.ar(n5*m*16*20,mul:env5),LFSaw.ar(3/(16)),env2,2);
				sig6=PanAz.ar(2,FSinOsc.ar(n6*m*18*20,mul:env6),LFSaw.ar(3/(18)),env3,2);
				sig7=PanAz.ar(2,FSinOsc.ar(n7*m*24*20,mul:env7),LFSaw.ar(3/(24)),env4,2);
		      sig8=PanAz.ar(2,FSinOsc.ar(n8*m*27*20,mul:env8),LFSaw.ar(3/(27)),env2,2);
				sig9=PanAz.ar(2,FSinOsc.ar(n9*m*32*20,mul:env9),LFSaw.ar(3/(32)),env3,2);
				sig10=PanAz.ar(2,FSinOsc.ar(n10*m*36*20,mul:env10),LFSaw.ar(3/(36)),env4,2);
		sum=sum+sig1+sig2+sig3;
	};
		Out.ar(0,sum);
}).add;
);
(
SynthDef.new(\idb, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,pr5=1,pr6=1,pr7=1,pr8=1,pr9=1,pr10=1,par=1,
	n1=1,n2=1,n3=1,n4=1,n5=1,n6=1,n7=1,n8=1,n9=1,n10=1;
	var sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sig9,sig10,sum;
	var env1,env2,env3,env4,env5,env6,env7,env8,env9,env10;
	var m=0;
		par.do{
		m=m+1;
		 env1=EnvGen.ar(Env.perc(0.01,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
		env2=EnvGen.ar(Env.perc(0.01,6,pr2*(2/(n2*8*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(0.01,6,pr3*(2/(n3*9*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(0.01,6,pr4*(2/(n4*12*m)),[-4,-4]),doneAction:2);
		 env5=EnvGen.ar(Env.perc(0.01,6,pr5*(2/(n5*6)),[-4,-4]),doneAction:2);
		env6=EnvGen.ar(Env.perc(0.01,6,pr6*(2/(n6*8*m)),[-4,-4]),doneAction:2);
		env7=EnvGen.ar(Env.perc(0.01,6,pr7*(2/(n7*9*m)),[-4,-4]),doneAction:2);
		env8=EnvGen.ar(Env.perc(0.01,6,pr8*(2/(n8*12*m)),[-4,-4]),doneAction:2);
		env9=EnvGen.ar(Env.perc(0.01,6,pr9*(2/(n9*9*m)),[-4,-4]),doneAction:2);
		env10=EnvGen.ar(Env.perc(0.01,6,pr10*(2/(n10*12*m)),[-4,-4]),doneAction:2);

		     sum=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*8*40,mul:env2),LFSaw.ar(3/(8)),env2,2);
				sig2=PanAz.ar(2,FSinOsc.ar(n3*m*9*40,mul:env3),LFSaw.ar(3/(9)),env3,2);
				sig3=PanAz.ar(2,FSinOsc.ar(n4*m*12*40,mul:env4),LFSaw.ar(3/(12)),env4,2);
		       sig5=PanAz.ar(2,FSinOsc.ar(n5*m*16*40,mul:env5),LFSaw.ar(3/(16)),env2,2);
				sig6=PanAz.ar(2,FSinOsc.ar(n6*m*18*40,mul:env6),LFSaw.ar(3/(18)),env3,2);
				sig7=PanAz.ar(2,FSinOsc.ar(n7*m*24*40,mul:env7),LFSaw.ar(3/(24)),env4,2);
		      sig8=PanAz.ar(2,FSinOsc.ar(n8*m*27*40,mul:env8),LFSaw.ar(3/(27)),env2,2);
				sig9=PanAz.ar(2,FSinOsc.ar(n9*m*32*40,mul:env9),LFSaw.ar(3/(32)),env3,2);
				sig10=PanAz.ar(2,FSinOsc.ar(n10*m*36*40,mul:env10),LFSaw.ar(3/(36)),env4,2);
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
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
);


(
( Pdef(\5, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \idb,
	\dur,Pbrown(1,8,1,inf),
	\par,Pbrown(1,1,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.1,1,inf),
	\pr3,Pexprand(0.1,1,inf),
	\pr4,Pexprand(0.1,1,inf),
	\pr5,Pexprand(0.1,1,inf),
	\pr6,Pexprand(0.1,1,inf),
	\pr7,Pexprand(0.1,1,inf),
	\pr8,Pexprand(0.1,1,inf),
		\pr9,Pexprand(0.1,1,inf),
	\pr10,Pexprand(0.1,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf),
\n9,Pbrown(1,8,1,inf),
	\n10,Pbrown(1,8,1,inf);

			)).play(quant:1));
)
)