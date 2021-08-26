TempoClock.default.tempo_(120/60);
s.options.numOutputBusChannels=8;
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
x=dur.cos; y=dur.sin;
	env=EnvGen.ar(Env.perc(0.01,6,1/1,[-4,-4]),doneAction:2);
	sum=FSinOsc.ar(x*880,mul:env,iphase:x*pi);
	sum1=FSinOsc.ar(y*880,mul:env,iphase:y*pi);
6.do{
		dur=dur+1;
	z=(dur+1)/z;
	x=dur.cos; y=dur.sin;
	env=EnvGen.ar(Env.perc(0.01,6,1/z,[-4,-4]),doneAction:2);

	//sig=FSinOsc.ar(x*880,mul:env,iphase:x*pi);
//sig1=FSinOsc.ar(y*880,mul:env,iphase:y*pi);
		sig=Blip.ar(x*440,mul:env,numharm:z)+FSinOsc.ar(x*440,mul:env,iphase:x*pi);
sig1=Blip.ar(y*440,mul:env,numharm:z)+FSinOsc.ar(y*440,mul:env,iphase:y*pi);
sum1=sum1+sig1; sum=sum+sig;
	};
	Out.ar(0,PanAz.ar(2,sum*env,x,width:z));
	Out.ar(0,PanAz.ar(2,sum1*env,y,width:z));
	Out.ar(0,Rotate2.ar(sum*env,sum1*env,LFSaw.ar(z)));


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
			)).play(quant:1))
)
///////////////////////////////////////////////////////


