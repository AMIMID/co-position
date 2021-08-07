TempoClock.default.tempo_(100/10);
s.options.numOutputBusChannels=2
TempoClock.default.tempo_(120/45);
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
	arg a=1,fund,b=1,x=1,bus=1,dur;
	var y=1,pan;
	var k,z,pos;
	var sig,total=0,env,s;
	x=dur.cos;
	y=dur.sin;
	fund=220;
	pan=dur.explin(6,12,-1,1);
	k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a))/(k);
		s= Complex(k,z).abs;
			env=EnvGen.ar(Env.perc(0.01,dur,1/s,[-4,-4]),doneAction:2);
		sig=SinOsc.ar(s*fund,mul: env);
		total=total+sig;
	Out.ar(0,PanAz.ar(2,LeakDC.ar(total*env),LFSaw.ar(s),width:2));
}).add;
)

Tdef(\sa).play;
Tdef(\sa).stop;



(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pseq([6,8,9,12],inf),
			)).play(quant:1));  (0).yield});

		1.do({( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pseq([8,9,12,6],inf),
			)).play(quant:1));  (0).yield});

			1.do({( Pdef(\3, Pbind(\instrument, \id,
	\dur,Pseq([9,12,6,8],inf),
		)).play(quant:1));  (0).yield});

			1.do({( Pdef(\4, Pbind(\instrument, \id,
	\dur,Pseq([12,6,8,9],inf),
			)).play(quant:1));  (0).yield});

			})
)

////////////////////////////////////////////////////////voc
s.options.memSize = 2097152
(
SynthDef.new(\id, {
	arg a=1,fund=1,b=1,x=1,bus=1,dur,o=2;
	var y=1,p=0;
	var k,kpos,z,zpos;
	var w=0,sig,total=0,env,s,spos;
fund=fund*220;
8.do{
		p=p+(1/8);
		w=w+1;
		x=dur/(dur+w);
		y=(x+1)/x;
	k=Complex(x,y).angle;
	a=Complex(x,y).abs;
		z=(((k)+a)*fund)/(k);
		zpos=(((k)+a)/(k));
		s= Complex(z,w).abs;
			spos=Complex(z,w).angle;
			env=EnvGen.ar(Env.perc(0.01,dur+2,440/s,[-4,-4]),doneAction:2);
		sig=PitchShift.ar(SoundIn.ar(0),0.2,pitchRatio:s.linlin(1,2200,0,4),mul:env,timeDispersion:p);
				total=total+sig;
	Out.ar(0,PanAz.ar(2,LeakDC.ar(total*env),zpos,width:1));

	}
}).add;
)

Tdef(\sa).play
Tdef(\sav).stop;


(
Tdef(\sa,
      {
				 1.do({( Pdef(\1, Pbind(\instrument, \id,
	\dur,Pseq([6,8,9,12],inf),
			\fund, Pxrand([1.1,1],inf),
			\o,Pexprand(1,10,inf);
		)).play(quant:1));  (0).yield});
		 1.do({( Pdef(\2, Pbind(\instrument, \id,
	\dur,Pseq([6,8,9,12],inf),
			\fund, Pxrand([1.1,1],inf),
			\o,Pexprand(1,10,inf);
		)).play(quant:1));  (360).yield});
Pdef(\1).stop;
		Pdef(\2).stop;
			Pdef(\3).stop;
			})
)
