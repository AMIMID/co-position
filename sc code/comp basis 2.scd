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
~t=Tdef(\t,{6.do({Pbind(\instrument, \id,
		\dur,Pbrown(1,8,2,inf),
	\par,Pbrown(1,12,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\pr5,Pexprand(0.5,1,inf),
	\pr6,Pexprand(0.5,1,inf),
	\pr7,Pexprand(0.5,1,inf),
	\pr8,Pexprand(0.5,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf);
).play;})});
)
~t.play
(
(
SynthDef.new(\id, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,pr5=1,pr6=1,pr7=1,pr8=1,par=1,n1=1,n2=1,n3=1,n4=1,n5=1,n6=1,n7=1,n8=1;
	var sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sum;
	var env1,env2,env3,env4,env5,env6,env7,env8;
	var m=1;
			 env1=EnvGen.ar(Env.perc(4,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
	sum=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(12/6),env1,1);
		//par.do{
		//m=m*2;
		 env1=EnvGen.ar(Env.perc(4,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
        env2=EnvGen.ar(Env.perc(4,6,pr2*(2/(n2*6.75*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(4,6,pr3*(2/(n3*6.75*(9/8)*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(4,6,pr4*(2/(n4*8*m)),[-4,-4]),doneAction:2);
		env5=EnvGen.ar(Env.perc(4,6,pr5*(2/(n5*9*m)),[-4,-4]),doneAction:2);
		env6=EnvGen.ar(Env.perc(4,6,pr6*(2/(n6*10.125*m)),[-4,-4]),doneAction:2);
		env7=EnvGen.ar(Env.perc(4,6,pr7*(2/(n7*10.125*(9/8)*m)),[-4,-4]),doneAction:2);
		env8=EnvGen.ar(Env.perc(4,6,pr8*(2/(n8*12*m)),[-4,-4]),doneAction:2);

		sig8=PanAz.ar(2,FSinOsc.ar(n1*6*20,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*6.75*20,mul:env2),LFSaw.ar(3/(6.75)),env2,2);
			sig2=PanAz.ar(2,FSinOsc.ar(n3*m*6.75*(9/8)*20,mul:env3),LFSaw.ar(3/(6.75*(9/8))),env3,2);
			sig3=PanAz.ar(2,FSinOsc.ar(n4*m*8*20,mul:env4),LFSaw.ar(3/(8)),env4,2);
				sig4=PanAz.ar(2,FSinOsc.ar(n5*m*9*20,mul:env5),LFSaw.ar(3/(9)),env5,2);
				sig5=PanAz.ar(2,FSinOsc.ar(n6*m*10.125*20,mul:env6),LFSaw.ar(3/(10.125)),env6,2);
				sig6=PanAz.ar(2,FSinOsc.ar(n7*m*10.125*(9/8)*20,mul:env7),LFSaw.ar(3/(10.125*(9/8))),env7,2);
				sig7=PanAz.ar(2,FSinOsc.ar(n8*m*12*20,mul:env8),LFSaw.ar(3/(12)),env8,2);
		sum=sig8+sig1+sig2+sig3+sig4+sig5+sig6+sig7;
	//};
		Out.ar(0,sum*8);
}).add;
);
(
SynthDef.new(\idb, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,pr5=1,pr6=1,pr7=1,pr8=1,par=1,n1=1,n2=1,n3=1,n4=1,n5=1,n6=1,n7=1,n8=1;
	var sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sum;
	var env1,env2,env3,env4,env5,env6,env7,env8;
	var m=1;
				 env1=EnvGen.ar(Env.perc(4,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
	sum=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(12/6),env1,1);
	//	par.do{
		//m=m*2;
		env1=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
        env2=EnvGen.ar(Env.perc(3,6,pr2*(2/(n2*6.75*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(3,6,pr3*(2/(n3*6.75*(9/8)*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(3,6,pr4*(2/(n4*8*m)),[-4,-4]),doneAction:2);
		env5=EnvGen.ar(Env.perc(3,6,pr5*(2/(n5*9*m)),[-4,-4]),doneAction:2);
		env6=EnvGen.ar(Env.perc(3,6,pr6*(2/(n6*10.125*m)),[-4,-4]),doneAction:2);
		env7=EnvGen.ar(Env.perc(3,6,pr7*(2/(n7*10.125*(9/8)*m)),[-4,-4]),doneAction:2);
		env8=EnvGen.ar(Env.perc(3,6,pr8*(2/(n8*12*m)),[-4,-4]),doneAction:2);

		sig8=PanAz.ar(2,FSinOsc.ar(n1*6*40,mul:env1),LFSaw.ar(3/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*6.75*40,mul:env2),LFSaw.ar(3/(6.75)),env2,2);
			sig2=PanAz.ar(2,FSinOsc.ar(n3*m*6.75*(9/8)*40,mul:env3),LFSaw.ar(3/(6.75*(9/8))),env3,2);
			sig3=PanAz.ar(2,FSinOsc.ar(n4*m*8*40,mul:env4),LFSaw.ar(3/(8)),env4,2);
				sig4=PanAz.ar(2,FSinOsc.ar(n5*m*9*40,mul:env5),LFSaw.ar(3/(9)),env5,2);
				sig5=PanAz.ar(2,FSinOsc.ar(n6*m*10.125*40,mul:env6),LFSaw.ar(3/(10.125)),env6,2);
				sig6=PanAz.ar(2,FSinOsc.ar(n7*m*10.125*(9/8)*40,mul:env7),LFSaw.ar(3/(10.125*(6/8))),env7,2);
				sig7=PanAz.ar(2,FSinOsc.ar(n8*m*12*40,mul:env8),LFSaw.ar(3/(12)),env8,2);
		sum=sig8+sig1+sig2+sig3+sig4+sig5+sig6+sig7;
		//};
		Out.ar(0,sum*8);
}).add;
)
)
//////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
(
(
( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,6,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\pr5,Pexprand(0.5,1,inf),
	\pr6,Pexprand(0.5,1,inf),
	\pr7,Pexprand(0.5,1,inf),
	\pr8,Pexprand(0.5,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf);
			)).play(quant:1));
);

( Pdef(\5, Pbind(\instrument, \idb,
		\dur,Pbrown(1,6,2,inf),
	\par,Pbrown(1,4,1,inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\pr5,Pexprand(0.5,1,inf),
	\pr6,Pexprand(0.5,1,inf),
	\pr7,Pexprand(0.5,1,inf),
	\pr8,Pexprand(0.5,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf);
			)).play(quant:1));
)
//////////////////////////////////////////////////////////////////////////////////////////////////
(
SynthDef.new(\idb, {

	arg dur=1,pr1=1,pr2=1,pr3=1,pr4=1,pr5=1,pr6=1,pr7=1,pr8=1,par=1,n1=1,n2=1,n3=1,n4=1,n5=1,n6=1,n7=1,n8=1,f;
	var sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sum;
	var env1,env2,env3,env4,env5,env6,env7,env8;
	var m=1;
		//par.do{
		//m=m+1;
		 env1=EnvGen.ar(Env.perc(3,6,pr1*(2/(n1*6)),[-4,-4]),doneAction:2);
        env2=EnvGen.ar(Env.perc(3,6,pr2*(2/(n2*6.75*m)),[-4,-4]),doneAction:2);
		env3=EnvGen.ar(Env.perc(3,6,pr3*(2/(n3*6.75*(9/8)*m)),[-4,-4]),doneAction:2);
		env4=EnvGen.ar(Env.perc(3,6,pr4*(2/(n4*8*m)),[-4,-4]),doneAction:2);
		env5=EnvGen.ar(Env.perc(3,6,pr5*(2/(n5*9*m)),[-4,-4]),doneAction:2);
		env6=EnvGen.ar(Env.perc(3,6,pr6*(2/(n6*10.125*m)),[-4,-4]),doneAction:2);
		env7=EnvGen.ar(Env.perc(3,6,pr7*(2/(n7*10.125*(9/8)*m)),[-4,-4]),doneAction:2);
		env8=EnvGen.ar(Env.perc(3,6,pr8*(2/(n8*12*m)),[-4,-4]),doneAction:2);

		sig8=PanAz.ar(2,FSinOsc.ar(n1*6*f,mul:env1),LFSaw.ar(12/6),env1,2);
			sig1=PanAz.ar(2,FSinOsc.ar(n2*m*6.75*f,mul:env2),LFSaw.ar(12/(6.75)),env2,2);
			sig2=PanAz.ar(2,FSinOsc.ar(n3*m*6.75*(9/8)*f,mul:env3),LFSaw.ar(12/(6.75*(9/8))),env3,2);
			sig3=PanAz.ar(2,FSinOsc.ar(n4*m*8*f,mul:env4),LFSaw.ar(12/(8)),env4,2);
				sig4=PanAz.ar(2,FSinOsc.ar(n5*m*9*f,mul:env5),LFSaw.ar(12/(9)),env5,2);
				sig5=PanAz.ar(2,FSinOsc.ar(n6*m*10.125*f,mul:env6),LFSaw.ar(12/(10.125)),env6,2);
				sig6=PanAz.ar(2,FSinOsc.ar(n7*m*10.125*(9/8)*f,mul:env7),LFSaw.ar(12/(10.125*(9/8))),env7,2);
				sig7=PanAz.ar(2,FSinOsc.ar(n8*m*12*f,mul:env8),LFSaw.ar(12/(12)),env8,2);
		sum=sig8+sig1+sig2+sig3+sig4+sig5+sig6+sig7;
	//};
		Out.ar(0,sum);
}).add;
)
(
~t=Tdef(\t,{6.do({Pbind(\instrument, \idb,
		\dur,Pbrown(1,8,2,inf),
	\f,Prand([60/2,80/2,90/2,120/2],inf),
		\pr1,Pexprand(0.1,1,inf),
	\pr2,Pexprand(0.5,1,inf),
	\pr3,Pexprand(0.5,1,inf),
	\pr4,Pexprand(0.5,1,inf),
	\pr5,Pexprand(0.5,1,inf),
	\pr6,Pexprand(0.5,1,inf),
	\pr7,Pexprand(0.5,1,inf),
	\pr8,Pexprand(0.5,1,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	\n5,Pbrown(1,8,1,inf),
		\n6,Pbrown(1,8,1,inf),
	\n7,Pbrown(1,8,1,inf),
	\n8,Pbrown(1,8,1,inf);
).play;})});
)
~t.play