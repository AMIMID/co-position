TempoClock.default.tempo_(60/120);
s.options.numOutputBusChannels=4
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
	arg dur=1,i=1;
	var x=1,y=1,z=1,x0=1,y0=1;
	var k=0, sig2,sig1,env2,env1;
	var sum1=0,sum2=0;
	var z1,z2;
		x=Complex(dur,i).angle.cos;
		y=Complex(dur,i).angle.sin;
32.do{
		z1=(x+x0)/x;
		z2=(y+y0)/y;
	env1=EnvGen.ar(Env.perc(4,4,0.1/z1,[-4,-4]),doneAction:2);
	env2=EnvGen.ar(Env.perc(4,4,0.1/z2,[-4,-4]),doneAction:2);
		sig1=FSinOsc.ar(z1*220,mul:env1,iphase:z1*pi);
		sig2=FSinOsc.ar(z2*220,mul:env2,iphase:z2*pi);
		sum1=sum1+sig1;
		sum2=sum2+sig2;
		Out.ar(0,PanAz.ar(2,sum1*env1,LFSaw.ar(z1),width:2));
			Out.ar(0,PanAz.ar(2,sum2*env2,LFSaw.ar(z2),width:2));

	};
}).add;
)

(
( Pdef(\1, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\5, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,10,9/8,inf),
	\i,Pbrown(1,10,9/8,inf),
			)).play(quant:1));
)
///////////////////////////////////////////////////////


