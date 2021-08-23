TempoClock.default.tempo_(120/20);
s.options.numOutputBusChannels=8;
TempoClock.default.tempo_(120/12);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000
s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;
s.options.memSize = 2097152
~b=Buffer.alloc(s,2048);
(
SynthDef.new(\id, {
	arg dur=1;
	var x=1,y=1,t,phi;
	var k=0; var sig,env,s;
~sig = Signal.sineFill(1024,[1,1/2,2/3,3/4,4/5,5/6,6/7,7/8,8/9],0!9);
	~sig.plot("signal");
	~wt =~sig.asWavetable;
	~b.loadCollection(~wt);

	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs;
	t=Complex(x,y).angle;

	env=EnvGen.ar(Env.perc(0.01,8,k/t,[-4,-2]),doneAction:2);
	sig=Osc.ar(~b,t*110,mul:env,phase:t*pi);
	//sig=FSinOsc.ar(t*220,mul:env,iphase:t*pi);

	Out.ar(0,PanAz.ar(2,sig*env,t,width:k));

}).add;
)


(
( Pdef(\1, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(0,4,0.125,inf),
			)).play(quant:1));
)
///////////////////////////////////////////////////////
