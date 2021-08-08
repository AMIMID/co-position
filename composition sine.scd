TempoClock.default.tempo_(100/10);
s.options.numOutputBusChannels=12;
TempoClock.default.tempo_(120/20);
);
ServerOptions.inDevices.postln;
s.record(numChannels:2);
s.options.sampleRate =48000

s.options.device_("USB Sound Device");
s.options.memSize = 65536;
s.options.memSize
s.options.numInputBusChannels=0;
s.record(numChannels:6) ;


(
SynthDef.new(\id, {
	arg dur,note;
	var fund,b=1,x=1,bus=1; var y=1,theta,phi; var k,z,pos; var sig,env,s; var m,t=0,a=1;



3.do{
		t=t+1;
		m=(t+a)/t;
		dur=dur*m;
	};
	x=dur.cos; y=dur.sin; fund=220;
	k=Complex(x,y).abs; theta=Complex(x,y).angle;
		z=(((k)+theta))/(k);
		s= Complex(k,z).abs; phi= Complex(z,k).angle;
			env=EnvGen.ar(Env.perc(0.01,dur,1/s,[-4,-4]),doneAction:2); sig=Blip.ar(s*fund,mul: env,numharm:theta);
	Out.ar(0,PanAz.ar(2,LeakDC.ar(sig*env),LFSaw.ar(phi),width:2));
		//Out.ar(0,PanAz.ar(4,LeakDC.ar(InFeedback.ar(0)*env),LFSaw.ar(theta),width:2));
	//	Out.ar(0,PanAz.ar(4,LeakDC.ar(InFeedback.ar(1)*env),LFSaw.ar(theta),width:2));
}).add;
)

Tdef(\sa).play;
Tdef(\sa).stop;

(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pseq([6,8,9,12],inf),
			\note,Pseq([1,2,3],inf);
			)).play(quant:1));  (0).yield});


			})
)

////////////////////////////////////////////////////////voc
s.options.memSize = 2097152
(
SynthDef.new(\id, {
	arg a=1,fund,b=1,x=1,bus=1,dur;
	var y=1,pan;
	var k,z,pos;
	var sig,env,s;
	var total=0;
	x=dur.cos;
	y=dur.sin;
	fund=100;
2.do{
		x=x+1;
		y=(x+1)/x;
	k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a))/(k);
		s= Complex(k,z).abs;
	pan= Complex(a,s).angle;
			env=EnvGen.ar(Env.perc(0.01,dur,1/s,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(SoundIn.ar(0),3,pitchRatio:s.linlin(1,40,0,4),mul:env);
				total=total+sig;
	Out.ar(0,PanAz.ar(4,LeakDC.ar(sig*env),LFSaw.ar(pan),width:2));

	}
}).add;
)

Tdef(\sa).play;
Tdef(\sa).stop;

(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pseq([6,8,9],inf),
			)).play(quant:1));  (0).yield});

		1.do({( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pseq([9,8,6],inf),
			)).play(quant:1));  (0).yield});

//			1.do({( Pdef(\3, Pbind(\instrument, \id,
//	\dur,Pseq([9,12,6,8],inf),
//		)).play(quant:1));  (0).yield});

//	1.do({( Pdef(\4, Pbind(\instrument, \id,
//	\dur,Pseq([12,6,8,9],inf),
//	)).play(quant:1));  (0).yield});

			})
)

