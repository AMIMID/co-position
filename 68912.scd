TempoClock.default.tempo_(60/60);
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
SynthDef.new(\id, {

	arg dur=1;
	var env1,env2,env3,env4,m=0;

		6.do{
		dur=dur+1;
	env1=EnvGen.ar(Env.perc(4,6,1/(6*dur),[-4,-4]),doneAction:2);
	env2=EnvGen.ar(Env.perc(4,6,1/(8*dur),[-4,-4]),doneAction:2);
	env3=EnvGen.ar(Env.perc(4,6,1/(9*dur),[-4,-4]),doneAction:2);
	env4=EnvGen.ar(Env.perc(4,6,1/(12*dur),[-4,-4]),doneAction:2);
	Out.ar(0,PanAz.ar(2,FSinOsc.ar(dur*6*20,mul:env1),LFSaw.ar(6/(6*dur)),width:2));
		Out.ar(0,PanAz.ar(2,FSinOsc.ar(dur*8*20,mul:env2),LFSaw.ar(6/(8*dur)),width:2));
		Out.ar(0,PanAz.ar(2,FSinOsc.ar(dur*9*20,mul:env3),LFSaw.ar(6/(9*dur)),width:2));
		Out.ar(0,PanAz.ar(2,FSinOsc.ar(dur*12*20,mul:env4),LFSaw.ar(6/(12*dur)),width:2));
	}
}).add;
)

(
( Pdef(\1, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,1,inf),

			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,1,inf),

			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,1,inf),

			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	//\dur,5;
		\dur,Pbrown(1,10,1,inf),

			)).play(quant:1));
)