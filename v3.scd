TempoClock.default.tempo_(120/16);
s.options.numOutputBusChannels=12;
TempoClock.default.tempo_(120/12);
);
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
	arg dur,presence;
	var b=1,x=1,bus=1; var y=1,theta,phi; var k,z,pos; var sig,env,s;

	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs; theta=Complex(x,y).angle;
	z=(((k)+theta))/(k);
	s= Complex(k,z).abs; phi= Complex(z,k).angle;
	env=EnvGen.ar(Env.perc(0.1,dur,1/s,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(SoundIn.ar(0),0.006,pitchRatio:s.linlin(0.1,3,0,4),mul:env);
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sig*env),phi,width:1));

}).add;
);
(
SynthDef.new(\id1, {
		arg dur,presence;
	var b=1,x=1,bus=1; var y=1,theta,phi; var k,z,pos; var sig,env,s;

	x=dur.cos; y=dur.sin;
	k=Complex(x,y).abs; theta=Complex(x,y).angle;
	z=(((k)+theta))/(k);
	s= Complex(k,z).abs; phi= Complex(z,k).angle;
	env=EnvGen.ar(Env.perc(0.1,dur,1/s,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(SoundIn.ar(0),0.006,pitchRatio:s.linlin(0.1,3,0,4),mul:env);
		Out.ar(0,PanAz.ar(2,LeakDC.ar(sig*env),phi,width:1));
}).add;
)
)
Tdef(\sa).play;
Tdef(\sa).stop;

(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
			\dur,Pseq([12,16,18],inf),
			\presence,Pexprand(-1,1,inf);
			)).play(quant:1));  (0).yield});
		1.do({( Pdef(\2, Pbind(\instrument, \id1,
			\dur,Pseq([24,16,12],inf),
			\presence,Pexprand(-1,1,inf);
		)).play(quant:1));  (0).yield});

			})
)
