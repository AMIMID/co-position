TempoClock.default.tempo_(60/10);
s.options.numOutputBusChannels=5
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
	arg a=1,fund=220,b=1,x=1,bus=1,dur,o=2;
	var y=1,p=0;
	var k,kpos,z,zpos,pos;
	var sig,total=0,env,s,spos;
	x=dur;
	y=x/dur;
12.do{
		p=p+(1/12);
	k=Complex(x,y).abs;
	a=Complex(x,y).angle;
		z=(((k)+a)*fund)/(k);
		zpos=(((k)+a)/(k));
		s= Complex(z,k).abs;
		spos= Complex(zpos,k).angle;
			env=EnvGen.ar(Env.perc(0.01,dur,10/s,[-4,-4]),doneAction:2);
		sig=SinOsc.ar(s,mul: env,phase:p);
		total=total+sig;
		Out.ar(0,PanAz.ar(2,total*env,spos*pi));
};


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
