
TempoClock.default.tempo_(60/30);
s.options.numOutputBusChannels=8

(
SynthDef.new(\id, {

	arg n1=1,n2=1,n3=1,n4=1;
	var env1a,k,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(0.01,6,(1/(n1*6)),[-4,-4]),doneAction:2);
	         env1b=EnvGen.ar(Env.perc(0.01,6,(1/(n1*8)),[-4,-4]),doneAction:2);
	         env1c=EnvGen.ar(Env.perc(0.01,6,(1/(n1*9)),[-4,-4]),doneAction:2);
	         env1d=EnvGen.ar(Env.perc(0.01,6,(1/(n1*12)),[-4,-4]),doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*30,mul:env1a),LFSaw.ar(3/6),env1a,2)+PanAz.ar(2,FSinOsc.ar(n1*8*30,mul:env1b),LFSaw.ar(3/(8)),env1b,2)+
	            PanAz.ar(2,FSinOsc.ar(n1*9*30,mul:env1c),LFSaw.ar(3/(9)),env1c,2)+PanAz.ar(2,FSinOsc.ar(n1*12*30,mul:env1d),LFSaw.ar(3/(12)),env1d,2);
	Out.ar(0,FreeVerb.ar(10*k,0.5,1));
}).add;
)
(
~a=( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\n1,Pbrown(1,12,1,inf),
	\n2,Pbrown(1,12,1,inf),
	\n3,Pbrown(1,12,1,inf),
	\n4,Pbrown(1,12,1,inf);
			)).play(quant:1));
)

(
SynthDef.new(\id, {

	arg n1=1,n2=1,n3=1,n4=1;
	var env,sig;
			 env=EnvGen.ar(Env.perc(3,6,1,[-4,-4]),doneAction:2);
	sig=Klang.ar(`[[n1*6,n1*8,n1*9,n1*12],[1/(n1*6),1/(n1*8),1/(n1*9),1/(n1*12)],[pi,pi,pi]])*env;

	Out.ar(0,FreeVerb.ar(10*sig,0.5,1)!2);
}).add;
)

(
~a=( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\n1,Pbrown(100,120,10,inf),
	\n2,Pbrown(100,120,10,inf),
	\n3,Pbrown(100,120,10,inf),
	\n4,Pbrown(100,120,10,inf);
			)).play(quant:1));

//////////////////////////////////////////////////////////////////////////////

(
(
SynthDef.new(\id, {

	arg n=1;
	var env,k;
			// env=EnvGen.ar(Env.perc(3,6,1,[-4,-4]),doneAction:2);
	 env=EnvGen.ar(Env.sine(12),doneAction:2);
	k= PanAz.ar(2,FSinOsc.ar(n*6*20,mul:1/(n*6)*env),LFSaw.ar(4/6),env,1)+
	          PanAz.ar(2,FSinOsc.ar(n*8*20,mul:1/(n*8)*env),LFSaw.ar(4/(8)),env,1)+
	            PanAz.ar(2,FSinOsc.ar(n*9*20,mul:1/(n*9)*env),LFSaw.ar(4/(9)),env,1)+
	           PanAz.ar(2,FSinOsc.ar(n*12*20,mul:1/(n*12)*env),LFSaw.ar(4/(12)),env,1);
	Out.ar(0,FreeVerb.ar(k,0.2,1)*env);
}).add;
);


(
SynthDef.new(\id, {

	arg n=1;
	var env,k,sig;
			// env=EnvGen.ar(Env.perc(3,6,1,[-4,-4]),doneAction:2);
	 env=EnvGen.ar(Env.sine(6),doneAction:2);
	k= FSinOsc.ar(n*6*20,mul:1/(n*6)*env)+
	         FSinOsc.ar(n*8*20,mul:1/(n*8)*env)+
	          FSinOsc.ar(n*9*20,mul:1/(n*9)*env)+
	     FSinOsc.ar(n*12*20,mul:1/(n*12)*env);
	sig=PanAz.ar(2,k, SinOsc.ar(1/6)+SinOsc.ar(1/8)+SinOsc.ar(1/9)+SinOsc.ar(1/12),width:1);
	Out.ar(0,FreeVerb.ar(sig,0.2,1)*env);
}).add;
)

(
~a=( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,1,inf),
	\n,Pbrown(1,8,1,inf),
			)).play(quant:1));
)



~a.stop
~e.stop
(
~a.play;
~e.play;
)
Synth.new(\id,[\n1,100,\n2,100,\n3,100,\n4,100,\gate,1]);
/////////////////////////////////////////midi
(
SynthDef.new(\id, {

	arg n1=1,n2=1,n3=1,n4=1,gate=1;
	var env1a,k,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(0.01,2,(1/(6)),[-4,-4]),gate,doneAction:2);
	         env1b=EnvGen.ar(Env.perc(0.01,2,(1/(8)),[-4,-4]),gate,doneAction:2);
	         env1c=EnvGen.ar(Env.perc(0.01,2,(1/(9)),[-4,-4]),gate,doneAction:2);
	         env1d=EnvGen.ar(Env.perc(0.01,2,(1/(12)),[-4,-4]),gate,doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*1,mul:env1a),LFSaw.ar(3/6),env1a,2)+PanAz.ar(2,FSinOsc.ar(n2*8*1,mul:env1b),LFSaw.ar(3/(8)),env1b,2)+
	            PanAz.ar(2,FSinOsc.ar(n3*9*1,mul:env1c),LFSaw.ar(3/(9)),env1c,2)+PanAz.ar(2,FSinOsc.ar(n4*12*1,mul:env1d),LFSaw.ar(3/(12)),env1d,2);
	Out.ar(0,FreeVerb.ar(10*k,0.5,0.5));
}).add;
);
(
MIDIClient.init;
MIDIIn.connectAll;
~notes=Array.newClear(128);
)

(
(MIDIdef.noteOn(\noteon, {
	arg vel,nn,chan,src;
	[vel,nn,chan,src].postln;
	~notes[nn]=Synth.new(\id,[\n1,nn.midicps,\n2,nn.midicps,\n3,nn.midicps,\n4,nn.midicps,\gate,1]);
});
);
(MIDIdef.noteOff(\noteoff, {
	arg vel,nn;
	[vel,nn].postln;
	~notes[nn].set(\gate,0);
	~notes[nn]=nil;
});
)
)


)