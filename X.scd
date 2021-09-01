TempoClock.default.tempo_(120/120);
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
	arg dur=1;
	var x=1,y=1,t,z=1;
	var k=0, sig,sig1,env,s;
	var sum=0,sum1=0;

12.do{
		dur=dur+1;
	z=(dur+1)/z;
	x=z.cos; y=z.sin;
		t=Complex(x,y).angle;
	env=EnvGen.ar(Env.perc(1,4,1/z,[-4,-4]),doneAction:2);

		sig=FSinOsc.ar(z*x*220,mul:env,iphase:x*pi);
sig1=FSinOsc.ar(z*y*220,mul:env,iphase:y*pi);
	//	sig=Blip.ar(x*1000,mul:env,numharm:z/x,add:FSinOsc.ar(x*1000,mul:env,iphase:x*pi));
	//sig1=Blip.ar(y*1000,mul:env,numharm:z/y,add:FSinOsc.ar(y*1000,mul:env,iphase:y*pi));
sum1=sum1+sig1; sum=sum+sig;
		Out.ar(0,PanAz.ar(2,sum*env,LFSaw.ar(x*z),width:2));
	Out.ar(0,PanAz.ar(2,sum1*env,LFSaw.ar(y*z),width:2));
	};
	//Out.ar(0,PanAz.ar(2,sum*env,x,width:1));
	//Out.ar(0,PanAz.ar(2,sum1*env,y,width:1));
	//Out.ar(0,Rotate2.ar(sum*env,sum1*env,LFSaw.ar(z)));

//Out.ar(0,Rotate2.ar(PanAz.ar(8,sum*env,LFSaw.ar(x),width:z),PanAz.ar(8,sum1*env,LFSaw.ar(y),width:z),LFSaw.ar(z)));
}).add;
)

(
( Pdef(\1, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\2, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\3, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\4, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\5, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\6, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\7, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\8, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\9, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\10, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\11, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\12, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\13, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\14, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\15, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\16, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));

( Pdef(\17, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\18, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\19, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\20, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\21, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\22, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\23, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\24, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));

( Pdef(\25, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\26, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\27, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\28, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\29, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\30, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\31, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
( Pdef(\32, Pbind(\instrument, \id,
	//\dur,5;
	\dur,Pbrown(1,9,1,inf),
			)).play(quant:1));
)
///////////////////////////////////////////////////////


