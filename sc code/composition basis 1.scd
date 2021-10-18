TempoClock.default.tempo_(60/30);
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
	Out.ar(0,PanAz.ar(2,FreeVerb.ar(BLowPass.ar(WhiteNoise.ar(mul:env*1/15),440),0.3,0.5),LFSaw.ar(1/12),env,width:2))
}).add)


~j=( Pdef(\wave, Pbind(\instrument, \seefoam,
	\dur,Pbrown(480,960,60,inf),
			)).play(quant:1));
////////////////////////////////////////////////////
(SynthDef.new(\env,{var env;
	env=EnvGen.ar(Env.sine(360,2),doneAction:2);
	Out.ar(0,FreeVerb.ar(InFeedback.ar(2)*env));
	Out.ar(1,FreeVerb.ar(InFeedback.ar(3)*env));
}).add);
( Pdef(\sound, Pbind(\instrument, \env,
	\dur,Pbrown(180,720,60,inf),
			)).play(quant:1));

(
(
SynthDef.new(\id, {

	arg n1=1,n2=1,n3=1,n4=1,gate=1;
	var env1a,k,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(3,6,(1/(6)),[-4,-4]),gate,doneAction:2);
	         env1b=EnvGen.ar(Env.perc(3,6,(1/(8)),[-4,-4]),gate,doneAction:2);
	         env1c=EnvGen.ar(Env.perc(3,6,(1/(9)),[-4,-4]),gate,doneAction:2);
	         env1d=EnvGen.ar(Env.perc(3,6,(1/(12)),[-4,-4]),gate,doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*30,mul:env1a),LFSaw.ar(3/6),env1a,2)+PanAz.ar(2,FSinOsc.ar(n2*8*30,mul:env1b),LFSaw.ar(3/(8)),env1b,2)+
	            PanAz.ar(2,FSinOsc.ar(n3*9*30,mul:env1c),LFSaw.ar(3/(9)),env1c,2)+PanAz.ar(2,FSinOsc.ar(n4*12*30,mul:env1d),LFSaw.ar(3/(12)),env1d,2);
	Out.ar(0,FreeVerb.ar(20*k,0.5,1));
}).add;
);
(
SynthDef.new(\idb, {

	arg n1=1,n2=1,n3=1,n4=1,p1=1,p2=1,p3=1,p4=1;
	var env1a,k,env1b,env1c,env1d;
			 env1a=EnvGen.ar(Env.perc(0.02,6,(1/(6)),[-4,-4]),doneAction:2);
	         env1b=EnvGen.ar(Env.perc(0.02,6,(1/(8)),[-4,-4]),doneAction:2);
	         env1c=EnvGen.ar(Env.perc(0.02,6,(1/(9)),[-4,-4]),doneAction:2);
	         env1d=EnvGen.ar(Env.perc(0.02,6,(1/(12)),[-4,-4]),doneAction:2);
			k=PanAz.ar(2,FSinOsc.ar(n1*6*30,mul:env1a),p1,env1a,1)+PanAz.ar(2,FSinOsc.ar(n2*8*30,mul:env1b),p2,env1b,1)+
	            PanAz.ar(2,FSinOsc.ar(n3*9*30,mul:env1c),p3,env1c,1)+PanAz.ar(2,FSinOsc.ar(n4*12*30,mul:env1d),p4,env1d,1);
		Out.ar(0,FreeVerb.ar(20*k,0.5,1));
}).add;
)
)
(
~a=( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pbrown(1,8,2,inf),
	\n1,Pbrown(1,4,1,inf),
	\n2,Pbrown(1,4,1,inf),
	\n3,Pbrown(1,4,1,inf),
	\n4,Pbrown(1,4,1,inf);
			)).play(quant:1));


(
~e=( Pdef(\5, Pbind(\instrument, \idb,
	\dur,Pbrown(1,4,2,inf),
	\n1,Pbrown(1,8,1,inf),
	\n2,Pbrown(1,8,1,inf),
	\n3,Pbrown(1,8,1,inf),
	\n4,Pbrown(1,8,1,inf),
	//\p1,Pbrown(-1,1,0.2,inf),
	//\p2,Pbrown(-1,1,0.2,inf),
	//\p3,Pbrown(-1,1,0.2,inf),
	//\p4,Pbrown(-1,1,0.2,inf);
	\p1,Prand([-0.5,0.5],inf),
	\p2,Prand([-0.5,0.5],inf),
	\p3,Prand([-0.5,0.5],inf),
	\p4,Prand([-0.5,0.5],inf);
			)).play(quant:1));

)
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

